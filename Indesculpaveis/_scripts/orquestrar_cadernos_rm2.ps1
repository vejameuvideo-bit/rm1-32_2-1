# orquestrar_cadernos_rm2.ps1 -- executa SOZINHO todo o kit dos 4 cadernos de Rm 2.1-11
#
# Uso (Windows 11, PowerShell 5.1), a partir da pasta Indesculpaveis:
#   powershell -ExecutionPolicy Bypass -File _scripts\orquestrar_cadernos_rm2.ps1             (SIMULACAO: so le e planeja)
#   powershell -ExecutionPolicy Bypass -File _scripts\orquestrar_cadernos_rm2.ps1 -Executar   (faz tudo, sem perguntas)
#
# O que faz, para cada caderno (1..4), de forma IDEMPOTENTE (pode rodar de novo sem duplicar nada):
#   1. acha o caderno pelo titulo (ou pelo ID salvo); cria so se nao existir; aborta se houver titulo duplicado
#   2. aplica a persona uma vez
#   3. confere as 3 fontes; sobe so as que faltam; espera 'ready'
#   4. confere os 6 itens de midia do manifest contra 'artifact list'; gera so os que faltam
#      (artefatos ja existentes sao vinculados por tipo, na ordem de criacao -- C1/C2 ja feitos a mao)
#   5. respeita a cota: antes de cada geracao le 'notebooklm usage --json'; acima do limite, ESPERA o
#      reinicio da janela de 5 h (ate -MaxHoras) em vez de falhar
#   6. Regra 11-D: nunca repete uma geracao sem resposta clara; reconcilia pelo 'artifact list'
#      (so RATE_LIMITED -- pedido recusado pelo Google -- e reenviado, uma vez, depois da espera)
#   7. artefato 'failed': uma tentativa de 'artifact retry' (no lugar, sem duplicar)
#   8. espera todos ficarem 'completed', baixa audio (.m4a) e video (.mp4) para cadernos_rm2\saida\cN\
#   9. verifica tudo e grava relatorio em cadernos_rm2\relatorios\ + log completo
#
# Seguranca: -p em todo comando; NAO troca o perfil global; confere a conta pelo 'auth check --test --json';
#   impede o Windows de dormir enquanto roda; estado salvo a cada passo em cadernos_rm2\estado_execucao.json.
# Saida: 0 = tudo completo e baixado; 2 = incompleto (pendente/adiado); 1 = falha.
# Script em ASCII puro (PowerShell 5.1 le .ps1 como ANSI).

param(
    [string]$Perfil = "",
    [switch]$Executar,
    [int[]]$Cadernos = @(1,2,3,4),
    [int]$LimiteUsoPct = 90,
    [double]$MaxHoras = 14,
    [int]$IntervaloSeg = 120,
    [int]$EsperaFonteSeg = 600,
    [int]$PausaGeracaoSeg = 20,
    [int]$EsperaReconciliarSeg = 60,
    [switch]$SemDownload,
    [switch]$SemAguardarJanela
)

$ErrorActionPreference = "Continue"
$Conta  = "aleinstitutoreformado@gmail.com"
$RaizP  = Split-Path -Parent $PSScriptRoot
$Raiz   = Join-Path $RaizP "cadernos_rm2"
$Idioma = "pt_BR"
$Nomes  = @{ 1 = "IND Rm2 C1 - Indesculpabilidade do moralista"; 2 = "IND Rm2 C2 - Paciencia e ira entesourada"; 3 = "IND Rm2 C3 - Obras, galardao e justificacao"; 4 = "IND Rm2 C4 - Imparcialidade de Deus" }
# Cadernos ja criados a mao em 14/10/2026 (conferidos de novo pelo 'list' antes de usar):
$Sementes = @{ 1 = "bd988699-9780-4722-a6b4-49bf1b16020e"; 2 = "79d06c63-2cdd-4d16-ac2c-02a72ec29777" }
$TitulosFontes = @("00_contexto_comum.md", "01_texto.md", "02_auditoria.md")

$Inicio   = Get-Date
$Prazo    = $Inicio.AddHours($MaxHoras)
$Carimbo  = $Inicio.ToString("yyyyMMdd_HHmmss")
$DirRel   = Join-Path $Raiz "relatorios"
$DirSaida = Join-Path $Raiz "saida"
$ArqEstado = Join-Path $Raiz "estado_execucao.json"
$ArqLog   = Join-Path $DirRel ("log_" + $Carimbo + ".txt")
$ArqRel   = Join-Path $DirRel ("relatorio_" + $Carimbo + ".md")
New-Item -ItemType Directory -Force -Path $DirRel | Out-Null

$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch { }

# ---------------------------------------------------------------- utilidades
function Log([string]$msg, [string]$cor = "Gray") {
    $linha = (Get-Date).ToString("HH:mm:ss") + "  " + $msg
    Write-Host $linha -ForegroundColor $cor
    Add-Content -Path $ArqLog -Value $linha -Encoding UTF8
}
function Passo([string]$t) { Log ""; Log ("== " + $t) "Cyan" }

# Impede o Windows de dormir (ES_CONTINUOUS | ES_SYSTEM_REQUIRED). Desfeito no fim.
$script:Acordado = $false
try {
    Add-Type -Namespace IND -Name Energia -MemberDefinition '[DllImport("kernel32.dll")] public static extern uint SetThreadExecutionState(uint esFlags);' -ErrorAction Stop
    $script:Acordado = $true
} catch { }
function ManterAcordado([bool]$sim) {
    if (-not $script:Acordado) { return }
    try {
        if ($sim) { [void][IND.Energia]::SetThreadExecutionState([uint32]2147483649) } else { [void][IND.Energia]::SetThreadExecutionState([uint32]2147483648) }
    } catch { $script:Acordado = $false }
}

# PowerShell 5.1 nao escapa aspas internas ao chamar executavel nativo.
function ArgNativo([string]$s) {
    if ($PSVersionTable.PSVersion.Major -ge 7 -and $PSNativeCommandArgumentPassing -ne "Legacy") { return $s }
    return ($s -replace '"', '\"')
}

function Visivel([string[]]$a) {
    $vis = $a | ForEach-Object { $s = [string]$_; if ($s.Length -gt 70) { $s = $s.Substring(0,67).Replace("`r"," ").Replace("`n"," ") + "..." }; if ($s -match '\s') { '"' + $s + '"' } else { $s } }
    return ("notebooklm " + ($vis -join " "))
}

# Roda a CLI. $escrita = comando que altera algo (so roda com -Executar).
# Devolve @{ Exit; Texto; Json } -- Json e o objeto do primeiro '{' ao ultimo '}' do stdout.
function NbCli([string[]]$a, [bool]$escrita = $false) {
    Log ("  > " + (Visivel $a)) "DarkGray"
    if ($escrita -and -not $Executar) { return @{ Exit = 0; Texto = ""; Json = $null; Simulado = $true } }
    $tmpErr = [System.IO.Path]::GetTempFileName()
    $saida = & notebooklm @a 2> $tmpErr
    $codigo = $LASTEXITCODE
    $texto = ($saida | Out-String)
    $err = ""
    try { $err = (Get-Content $tmpErr -Raw -ErrorAction SilentlyContinue) } catch { }
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    if ($err -and $err.Trim()) { Add-Content -Path $ArqLog -Value ("    [stderr] " + $err.Trim()) -Encoding UTF8 }
    $obj = $null
    $i = $texto.IndexOf("{"); $f = $texto.LastIndexOf("}")
    if ($i -ge 0 -and $f -gt $i) {
        try { $obj = $texto.Substring($i, $f - $i + 1) | ConvertFrom-Json } catch { $obj = $null }
    }
    return @{ Exit = $codigo; Texto = $texto; Json = $obj; Simulado = $false }
}

function Lista($obj, [string]$chave) {
    if ($null -eq $obj) { return @() }
    $v = $obj.$chave
    if ($null -eq $v) { return @() }
    return @($v)
}

# ---------------------------------------------------------------- estado (JSON -> hashtables)
function ParaHT($o) {
    if ($null -eq $o) { return $null }
    if ($o -is [System.Management.Automation.PSCustomObject]) {
        $h = @{}
        foreach ($p in $o.PSObject.Properties) { $h[$p.Name] = ParaHT $p.Value }
        return $h
    }
    if ($o -is [System.Collections.IEnumerable] -and -not ($o -is [string])) { return @($o | ForEach-Object { ParaHT $_ }) }
    return $o
}
function CarregaEstado {
    if (Test-Path $ArqEstado) {
        try { $e = ParaHT (Get-Content $ArqEstado -Raw -Encoding UTF8 | ConvertFrom-Json); if ($e -and $e.cadernos) { return $e } } catch { Log "[AVISO] estado_execucao.json ilegivel; recomecando o estado (os IDs reais vem do 'list')." "Yellow" }
    }
    return @{ versao = 1; cadernos = @{} }
}
function SalvaEstado {
    if (-not $Executar) { return }
    $json = $script:Estado | ConvertTo-Json -Depth 12
    [System.IO.File]::WriteAllText($ArqEstado, $json, (New-Object System.Text.UTF8Encoding($false)))
}
function EstadoCaderno([int]$n) {
    $k = [string]$n
    if (-not $script:Estado.cadernos.ContainsKey($k)) { $script:Estado.cadernos[$k] = @{ id = ""; persona = $false; itens = @{} } }
    $c = $script:Estado.cadernos[$k]
    if (-not $c.ContainsKey("itens") -or $null -eq $c.itens) { $c.itens = @{} }
    return $c
}
function EstadoItem($c, [string]$item) {
    if (-not $c.itens.ContainsKey($item)) { $c.itens[$item] = @{ artefato = ""; status = ""; tentativas = 0; retry = 0; vinculo = ""; arquivo = ""; bytes = 0; nota = "" } }
    return $c.itens[$item]
}

# ---------------------------------------------------------------- cota (janela de 5 h)
function LerUso {
    $r = NbCli @("-p",$Perfil,"usage","--json")
    if ($r.Exit -ne 0 -or $null -eq $r.Json) { return $null }
    $j = $r.Json
    $u = @{ Usado = -1.0; Reinicio = $null; Esgotado = [bool]$j.is_exhausted; Disponivel = $true }
    if ($null -ne $j.available) { $u.Disponivel = [bool]$j.available }
    foreach ($w in (Lista $j "windows")) {
        if ([string]$w.kind -eq "five_hour") {
            $u.Usado = [double]$w.used_percent
            try { $u.Reinicio = [DateTime]::Parse([string]$w.resets_at, [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::RoundtripKind).ToLocalTime() } catch { $u.Reinicio = $null }
        }
    }
    return $u
}

# Devolve $true quando ha cota para gerar; espera a janela reiniciar se preciso.
function AguardarCota {
    while ($true) {
        $u = LerUso
        if ($null -eq $u) { Log "  [AVISO] 'usage --json' sem resposta; seguindo (o Google enfileira o que passar do limite)." "Yellow"; return $true }
        Log ("  cota 5 h: {0:N1}% usada; reinicio {1}" -f $u.Usado, $(if ($u.Reinicio) { $u.Reinicio.ToString("dd/MM HH:mm") } else { "?" }))
        if (-not $u.Esgotado -and $u.Usado -lt $LimiteUsoPct) { return $true }
        if ($SemAguardarJanela) { Log "  [ADIADO] cota acima de $LimiteUsoPct% e -SemAguardarJanela." "Yellow"; return $false }
        $alvo = if ($u.Reinicio) { $u.Reinicio.AddMinutes(3) } else { (Get-Date).AddMinutes(30) }
        if ($alvo -gt $Prazo) { Log ("  [ADIADO] a janela so reinicia em {0}, depois do prazo (-MaxHoras {1})." -f $alvo.ToString("dd/MM HH:mm"), $MaxHoras) "Yellow"; return $false }
        if (-not $Executar) { Log ("  [SIMULACAO] esperaria ate {0} pela nova janela." -f $alvo.ToString("dd/MM HH:mm")) "Yellow"; return $true }
        Log ("  Cota acima de {0}%: esperando a nova janela ate {1} ..." -f $LimiteUsoPct, $alvo.ToString("dd/MM HH:mm")) "Yellow"
        while ((Get-Date) -lt $alvo) { ManterAcordado $true; Start-Sleep -Seconds ([Math]::Min(300, [Math]::Max(5, ($alvo - (Get-Date)).TotalSeconds))) }
    }
}

# ---------------------------------------------------------------- preparacao
Start-Transcript -Path (Join-Path $DirRel ("transcricao_" + $Carimbo + ".txt")) -Append | Out-Null
ManterAcordado $true

Passo ("Orquestrador IND Rm2 -- " + $(if ($Executar) { "EXECUCAO" } else { "SIMULACAO (nada sera alterado)" }))
if ($Perfil -eq "") {
    $pc = Join-Path $RaizP "perfil.config.txt"
    if (Test-Path $pc) { $Perfil = (Get-Content $pc -Raw).Trim() }
    if ($Perfil -eq "") { $Perfil = "ind-pro" }
}
Log ("Perfil: {0} | conta esperada: {1} | prazo: {2} | limite de cota: {3}%" -f $Perfil, $Conta, $Prazo.ToString("dd/MM HH:mm"), $LimiteUsoPct)

$falhaFatal = ""
if (-not (Test-Path (Join-Path $Raiz "manifest.csv"))) { $falhaFatal = "manifest.csv nao encontrado em $Raiz" }
if (-not $falhaFatal -and -not (Get-Command notebooklm -ErrorAction SilentlyContinue)) { $falhaFatal = "CLI 'notebooklm' nao encontrada no PATH" }
if (-not $falhaFatal) {
    $v = NbCli @("--version"); Log ("  " + $v.Texto.Trim())
    $a = NbCli @("-p",$Perfil,"auth","check","--test","--json")
    $txtAuth = $a.Texto
    if ($a.Exit -ne 0) { $falhaFatal = "'auth check --test' falhou para o perfil '$Perfil' (refaca o login DESTE perfil; nao troque o perfil global)" }
    elseif ($txtAuth -notmatch [regex]::Escape($Conta)) { $falhaFatal = "o perfil '$Perfil' NAO abre $Conta" }
    else { Log "  [OK] perfil valido e conta confirmada: $Conta" "Green" }
}
$manifest = @()
if (-not $falhaFatal) {
    $manifest = @(Import-Csv (Join-Path $Raiz "manifest.csv"))
    foreach ($it in $manifest) {
        if (-not (Test-Path (Join-Path $Raiz $it.arquivo))) { $falhaFatal = "prompt ausente: " + $it.arquivo; break }
    }
    foreach ($n in $Cadernos) {
        foreach ($t in $TitulosFontes) {
            $p = if ($t -eq "00_contexto_comum.md") { Join-Path $Raiz "fontes\comum\$t" } else { Join-Path $Raiz "fontes\c$n\$t" }
            if (-not (Test-Path $p)) { $falhaFatal = "fonte ausente: $p" }
        }
    }
    $persArq = Join-Path $RaizP "_artifacts\persona_notebooklm.txt"
    if (-not (Test-Path $persArq)) { $falhaFatal = "persona ausente: $persArq" }
}
if ($falhaFatal) { Log ("[FALHA] " + $falhaFatal) "Red" }

$script:Estado = CarregaEstado
$Resumo = @{}

# ---------------------------------------------------------------- fase 1: cadernos, fontes e pedidos
function ListarCadernos {
    $r = NbCli @("-p",$Perfil,"list","--json")
    if ($r.Exit -ne 0 -or $null -eq $r.Json) { return $null }
    return (Lista $r.Json "notebooks")
}

function PrepararCaderno([int]$n) {
    $c = EstadoCaderno $n
    $res = @{ n = $n; nome = $Nomes[$n]; id = ""; fontes = @(); fontesOk = $false; problemas = @(); itens = @() }
    $Resumo[$n] = $res
    Passo ("CADERNO {0}: {1}" -f $n, $Nomes[$n])

    $lista = ListarCadernos
    if ($null -eq $lista) { $res.problemas += "nao consegui listar os cadernos da conta"; Log "  [FALHA] 'list --json' sem resposta." "Red"; return }
    $comTitulo = @($lista | Where-Object { [string]$_.title -eq $Nomes[$n] })
    $candidato = ""
    if ($c.id -and @($lista | Where-Object { [string]$_.id -eq $c.id }).Count -eq 1) { $candidato = $c.id }
    elseif ($Sementes.ContainsKey($n) -and @($lista | Where-Object { [string]$_.id -eq $Sementes[$n] }).Count -eq 1) { $candidato = $Sementes[$n] }
    if ($comTitulo.Count -gt 1) {
        $ids = ($comTitulo | ForEach-Object { $_.id }) -join ", "
        $res.problemas += "HA $($comTitulo.Count) cadernos com o mesmo titulo ($ids) -- resolva a mao; nada foi feito neste caderno"
        Log ("  [FALHA] titulo duplicado: " + $ids) "Red"; return
    }
    if (-not $candidato -and $comTitulo.Count -eq 1) { $candidato = [string]$comTitulo[0].id }
    if ($candidato) {
        $c.id = $candidato; Log ("  [OK] caderno existente: " + $candidato) "Green"
        if ($Sementes.ContainsKey($n) -and -not $c.persona) { $c.persona = $true }
    } else {
        $r = NbCli @("-p",$Perfil,"create",$Nomes[$n],"--json") $true
        if ($r.Simulado) { Log "  [SIMULACAO] criaria o caderno." "Yellow"; $res.id = "(a criar)"; $res.problemas += "caderno ainda nao existe"; return }
        if ($r.Json -and $r.Json.notebook -and $r.Json.notebook.id) { $c.id = [string]$r.Json.notebook.id; Log ("  [OK] caderno criado: " + $c.id) "Green" }
        else {
            # Nao repetir 'create' (duplicaria): procurar de novo pelo titulo.
            Start-Sleep -Seconds $EsperaReconciliarSeg
            $lista2 = ListarCadernos
            $t2 = @($lista2 | Where-Object { [string]$_.title -eq $Nomes[$n] })
            if ($t2.Count -eq 1) { $c.id = [string]$t2[0].id; Log ("  [OK] caderno encontrado apos resposta incompleta: " + $c.id) "Green" }
            else { $res.problemas += "'create' sem ID e caderno nao encontrado"; Log "  [FALHA] criacao sem ID." "Red"; return }
        }
        $c.persona = $false
    }
    $res.id = $c.id
    SalvaEstado

    if (-not $c.persona) {
        $ptxt = (Get-Content (Join-Path $RaizP "_artifacts\persona_notebooklm.txt") -Raw -Encoding UTF8).Trim()
        if ($ptxt.Length -gt 10000) { $res.problemas += "persona acima de 10.000 caracteres" }
        else {
            $r = NbCli @("-p",$Perfil,"configure","-n",$c.id,"--persona",(ArgNativo $ptxt)) $true
            if ($r.Exit -eq 0 -and -not $r.Simulado) { $c.persona = $true; Log "  [OK] persona aplicada." "Green"; SalvaEstado }
            elseif (-not $r.Simulado) { $res.problemas += "falha ao aplicar a persona"; Log "  [AVISO] persona nao aplicada." "Yellow" }
        }
    }

    # Fontes
    $okTodas = $true
    foreach ($t in $TitulosFontes) {
        $arq = if ($t -eq "00_contexto_comum.md") { Join-Path $Raiz "fontes\comum\$t" } else { Join-Path $Raiz "fontes\c$n\$t" }
        $rl = NbCli @("-p",$Perfil,"source","list","-n",$c.id,"--json")
        $fontes = Lista $rl.Json "sources"
        $mesmas = @($fontes | Where-Object { [string]$_.title -eq $t })
        if ($mesmas.Count -gt 1) { $res.problemas += "fonte duplicada: $t ($($mesmas.Count)x) -- remover a extra a mao" }
        $pronta = @($mesmas | Where-Object { [string]$_.status -eq "ready" })
        if ($pronta.Count -ge 1) { $res.fontes += "$t = ready"; continue }
        $sid = ""
        $comErro = @($mesmas | Where-Object { [string]$_.status -eq "error" })
        $andamento = @($mesmas | Where-Object { [string]$_.status -ne "error" })
        if ($andamento.Count -ge 1) { $sid = [string]$andamento[0].id; Log ("  fonte {0} em processamento ({1}); aguardando." -f $t, $andamento[0].status) }
        elseif ($comErro.Count -ge 1) { $res.problemas += "fonte com status error: $t (remover a mao e rodar de novo)"; $res.fontes += "$t = error"; $okTodas = $false; continue }
        else {
            $ra = NbCli @("-p",$Perfil,"source","add","-n",$c.id,$arq,"--type","file","--json") $true
            if ($ra.Simulado) { $res.fontes += "$t = (subiria)"; $okTodas = $false; continue }
            if ($ra.Json -and $ra.Json.source -and $ra.Json.source.id) { $sid = [string]$ra.Json.source.id }
            else { $res.problemas += "'source add' sem ID para $t -- conferir 'source list --status preparing' (nao reenviado)"; $res.fontes += "$t = ?"; $okTodas = $false; continue }
        }
        $rw = NbCli @("-p",$Perfil,"source","wait","-n",$c.id,$sid,"--timeout","$EsperaFonteSeg") $true
        if ($rw.Exit -eq 0) { $res.fontes += "$t = ready"; Log ("  [OK] fonte pronta: " + $t) "Green" }
        else { $res.fontes += "$t = nao ficou ready (exit $($rw.Exit))"; $res.problemas += "fonte $t nao ficou ready"; $okTodas = $false }
    }
    $res.fontesOk = $okTodas
    if (-not $okTodas) { Log "  [AVISO] fontes incompletas: a midia deste caderno NAO sera pedida." "Yellow"; return }

    Reconciliar $n
    $itensC = @($manifest | Where-Object { [int]$_.caderno -eq $n })
    foreach ($it in $itensC) {
        $ei = EstadoItem $c $it.id
        if ($ei.artefato) {
            if ($ei.status -eq "failed" -and $ei.retry -lt 1) {
                if (-not (AguardarCota)) { $ei.nota = "retry adiado (cota)"; continue }
                $rr = NbCli @("-p",$Perfil,"artifact","retry",$ei.artefato,"-n",$c.id) $true
                if (-not $rr.Simulado) { $ei.retry++; $ei.status = "pending"; $ei.nota = "retry pedido (exit $($rr.Exit))"; SalvaEstado; Start-Sleep -Seconds $PausaGeracaoSeg }
            }
            continue
        }
        if ($it.formato -eq "cinematic") { $ei.nota = "cinematic exige AI Ultra: nao gerado"; continue }
        if ($ei.tentativas -ge 1 -and $ei.status -eq "verificar") { $ei.nota = "pedido anterior sem resposta clara: nao repetido (Regra 11-D)"; continue }
        if (-not (AguardarCota)) { $ei.nota = "adiado: cota"; continue }
        Gerar $n $c $it $ei
        Start-Sleep -Seconds $(if ($Executar) { $PausaGeracaoSeg } else { 0 })
    }
}

function ArgsGeracao($it, [string]$nb) {
    $arq = Join-Path $Raiz $it.arquivo
    if ($it.tipo -eq "audio") {
        $a = @("-p",$Perfil,"generate","audio","-n",$nb,"--prompt-file",$arq,"--format",$it.formato,"--language",$Idioma,"--json")
        if ($it.duracao -ne "") { $a += @("--length",$it.duracao) }
    } else {
        $a = @("-p",$Perfil,"generate","video","-n",$nb,"--prompt-file",$arq,"--format",$it.formato,"--language",$Idioma,"--json")
        if ($it.estilo -ne "" -and $it.formato -ne "cinematic" -and $it.formato -ne "short") { $a += @("--style",$it.estilo) }
    }
    return $a
}

function Gerar([int]$n, $c, $it, $ei) {
    for ($volta = 1; $volta -le 2; $volta++) {
        $antes = @{}
        if ($Executar) { foreach ($x in (ArtefatosDe $c.id)) { $antes[[string]$x.id] = $true } }
        $r = NbCli (ArgsGeracao $it $c.id) $true
        if ($r.Simulado) { Log ("  [SIMULACAO] geraria " + $it.id) "Yellow"; return }
        $ei.tentativas++
        if ($r.Json -and $r.Json.task_id) {
            $ei.artefato = [string]$r.Json.task_id; $ei.status = [string]$r.Json.status; $ei.vinculo = "gerado"
            Log ("  [OK] {0} pedido: {1}" -f $it.id, $ei.artefato) "Green"; SalvaEstado; return
        }
        if ($r.Json -and [string]$r.Json.code -eq "RATE_LIMITED" -and $volta -eq 1) {
            Log ("  [AVISO] {0}: RATE_LIMITED (pedido recusado). Esperando a cota e tentando uma vez mais." -f $it.id) "Yellow"
            $ei.status = "rate_limited"; SalvaEstado
            if (-not (AguardarCota)) { $ei.nota = "adiado: RATE_LIMITED"; return }
            continue
        }
        # Resposta ambigua (timeout etc.): Regra 11-D -- NAO repetir; reconciliar pela lista.
        Start-Sleep -Seconds $EsperaReconciliarSeg
        $novos = @(ArtefatosDe $c.id | Where-Object { -not $antes.ContainsKey([string]$_.id) -and [string]$_.type_id -eq $it.tipo })
        if ($novos.Count -ge 1) { $ei.artefato = [string]$novos[0].id; $ei.status = [string]$novos[0].status; $ei.vinculo = "reconciliado"; Log ("  [OK] {0}: resposta incompleta, mas o artefato apareceu na lista ({1})." -f $it.id, $ei.artefato) "Green" }
        else { $ei.status = "verificar"; $ei.nota = "sem task_id e sem artefato novo (exit $($r.Exit)); nao repetido"; Log ("  [AVISO] {0}: sem resposta clara; NAO repetido (Regra 11-D)." -f $it.id) "Yellow" }
        SalvaEstado; return
    }
}

function ArtefatosDe([string]$nb) {
    $r = NbCli @("-p",$Perfil,"artifact","list","-n",$nb,"--json")
    return (Lista $r.Json "artifacts")
}

# Vincula itens do manifest a artefatos existentes (por ID salvo; senao por tipo, na ordem de criacao).
function Reconciliar([int]$n) {
    $c = EstadoCaderno $n
    if (-not $c.id) { return }
    $arts = @(ArtefatosDe $c.id | Where-Object { [string]$_.type_id -eq "audio" -or [string]$_.type_id -eq "video" })
    $porId = @{}; foreach ($x in $arts) { $porId[[string]$x.id] = $x }
    $usados = @{}
    $itensC = @($manifest | Where-Object { [int]$_.caderno -eq $n })
    foreach ($it in $itensC) {
        $ei = EstadoItem $c $it.id
        if ($ei.artefato -and $porId.ContainsKey($ei.artefato)) { $usados[$ei.artefato] = $true; $ei.status = [string]$porId[$ei.artefato].status; $ei.titulo = [string]$porId[$ei.artefato].title }
    }
    foreach ($it in $itensC) {
        $ei = EstadoItem $c $it.id
        if ($ei.artefato -and $usados.ContainsKey($ei.artefato)) { continue }
        if ($ei.artefato -and $ei.vinculo -eq "gerado") { continue }   # recem pedido, ainda fora da lista
        $livre = @($arts | Where-Object { [string]$_.type_id -eq $it.tipo -and -not $usados.ContainsKey([string]$_.id) } | Sort-Object { [string]$_.created_at })
        if ($livre.Count -ge 1) {
            $x = $livre[0]; $usados[[string]$x.id] = $true
            $ei.artefato = [string]$x.id; $ei.status = [string]$x.status; $ei.titulo = [string]$x.title
            if (-not $ei.vinculo) { $ei.vinculo = "existente (por tipo)" }
        }
    }
    $extras = @($arts | Where-Object { -not $usados.ContainsKey([string]$_.id) })
    $c.extras = @($extras | ForEach-Object { "{0} {1} [{2}] {3}" -f $_.type_id, $_.id, $_.status, $_.title })
    SalvaEstado
}

# ---------------------------------------------------------------- execucao
if (-not $falhaFatal) {
    foreach ($n in $Cadernos) {
        if ((Get-Date) -gt $Prazo) { Log "[AVISO] prazo esgotado antes do caderno $n." "Yellow"; break }
        PrepararCaderno $n
    }

    # Fase 2: esperar a conclusao de tudo o que foi pedido
    Passo "Aguardando a conclusao dos artefatos"
    while ($Executar) {
        $pend = 0
        foreach ($n in $Cadernos) {
            $c = EstadoCaderno $n
            if (-not $c.id) { continue }
            Reconciliar $n
            foreach ($k in @($c.itens.Keys)) {
                $ei = $c.itens[$k]
                if ($ei.artefato -and [string]$ei.status -eq "failed" -and $ei.retry -lt 1) {
                    Log ("  [AVISO] {0} falhou na geracao; uma nova tentativa no lugar (artifact retry)." -f $k) "Yellow"
                    if (AguardarCota) {
                        $rr = NbCli @("-p",$Perfil,"artifact","retry",$ei.artefato,"-n",$c.id) $true
                        $ei.retry++; $ei.status = "pending"; $ei.nota = "retry pedido (exit $($rr.Exit))"; SalvaEstado
                    }
                }
                $s = [string]$ei.status
                if ($ei.artefato -and $s -ne "completed" -and $s -ne "failed") { $pend++ }
            }
        }
        if ($pend -eq 0) { Log "  [OK] nenhum artefato pendente." "Green"; break }
        if ((Get-Date) -gt $Prazo) { Log "  [AVISO] prazo esgotado com $pend artefato(s) pendente(s)." "Yellow"; break }
        Log ("  {0} artefato(s) ainda em geracao; nova checagem em {1} s (prazo {2})." -f $pend, $IntervaloSeg, $Prazo.ToString("dd/MM HH:mm"))
        ManterAcordado $true
        Start-Sleep -Seconds $IntervaloSeg
    }
    if (-not $Executar) { foreach ($n in $Cadernos) { Reconciliar $n } }

    # Fase 3: downloads
    if (-not $SemDownload) {
        Passo "Baixando os artefatos prontos"
        foreach ($n in $Cadernos) {
            $c = EstadoCaderno $n
            if (-not $c.id) { continue }
            $dir = Join-Path $DirSaida "c$n"
            foreach ($it in @($manifest | Where-Object { [int]$_.caderno -eq $n })) {
                $ei = EstadoItem $c $it.id
                if ($ei.status -ne "completed" -or -not $ei.artefato) { continue }
                $ext = if ($it.tipo -eq "audio") { ".m4a" } else { ".mp4" }
                $dest = Join-Path $dir ($it.id + $ext)
                if ((Test-Path $dest) -and (Get-Item $dest).Length -gt 0) { $ei.arquivo = $dest; $ei.bytes = (Get-Item $dest).Length; continue }
                if ($Executar) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
                $r = NbCli @("-p",$Perfil,"download",$it.tipo,"-n",$c.id,"-a",$ei.artefato,$dest,"--no-clobber") $true
                if ($r.Simulado) { continue }
                if ((Test-Path $dest) -and (Get-Item $dest).Length -gt 0) { $ei.arquivo = $dest; $ei.bytes = (Get-Item $dest).Length; Log ("  [OK] baixado: {0} ({1:N0} bytes)" -f $dest, $ei.bytes) "Green" }
                else { $ei.nota = "download falhou (exit $($r.Exit))"; Log ("  [AVISO] download falhou: " + $it.id) "Yellow" }
            }
        }
        SalvaEstado
    }
}

# ---------------------------------------------------------------- verificacao e relatorio
Passo "Verificacao final e relatorio"
$L = New-Object System.Collections.Generic.List[string]
$L.Add("# Relatorio do orquestrador -- cadernos Rm 2.1-11")
$L.Add("")
$L.Add(("Execucao: {0} -> {1} | modo: {2} | perfil: {3} | conta: {4}" -f $Inicio.ToString("dd/MM/yyyy HH:mm"), (Get-Date).ToString("dd/MM/yyyy HH:mm"), $(if ($Executar) { "EXECUCAO" } else { "SIMULACAO" }), $Perfil, $Conta))
$L.Add("")
$totalOk = 0; $totalItens = 0; $falhas = 0; $incompletos = 0
if ($falhaFatal) { $L.Add("**FALHA FATAL:** " + $falhaFatal); $falhas++ }
$u = $null; if (-not $falhaFatal) { $u = LerUso }
if ($u) { $L.Add(("Cota 5 h no fim: {0:N1}% usada; reinicio {1}" -f $u.Usado, $(if ($u.Reinicio) { $u.Reinicio.ToString("dd/MM HH:mm") } else { "?" }))); $L.Add("") }

foreach ($n in $Cadernos) {
    $c = EstadoCaderno $n
    $res = $Resumo[$n]
    $L.Add(("## Caderno {0} -- {1}" -f $n, $Nomes[$n]))
    $L.Add("")
    $L.Add("- ID: " + $(if ($c.id) { $c.id } else { "(nenhum)" }))
    if ($res) { foreach ($f in $res.fontes) { $L.Add("- fonte: " + $f) } }
    $L.Add("")
    $L.Add("| Item | Tipo | Formato/estilo | Artefato | Status | Arquivo | Nota |")
    $L.Add("|---|---|---|---|---|---|---|")
    $itensC = @($manifest | Where-Object { [int]$_.caderno -eq $n })
    $okC = 0
    foreach ($it in $itensC) {
        $totalItens++
        $ei = EstadoItem $c $it.id
        $arqv = if ($ei.arquivo) { ("{0} ({1:N0} B)" -f (Split-Path $ei.arquivo -Leaf), $ei.bytes) } else { "-" }
        $ok = ($ei.status -eq "completed") -and ($SemDownload -or ($ei.bytes -gt 0))
        if ($ok) { $okC++; $totalOk++ }
        $L.Add(("| {0} | {1} | {2} {3} | {4} | {5} | {6} | {7} |" -f $it.id, $it.tipo, $it.formato, $it.estilo, $(if ($ei.artefato) { $ei.artefato } else { "-" }), $(if ($ei.status) { $ei.status } else { "nao pedido" }), $arqv, ($ei.nota + $(if ($ei.vinculo) { " [" + $ei.vinculo + "]" } else { "" }))))
    }
    $L.Add("")
    # Checagens do caderno
    $chk = @()
    $chk += $(if ($c.id) { "[OK] caderno identificado" } else { "[FALHA] sem caderno" })
    if ($res) {
        $chk += $(if ($res.fontesOk) { "[OK] 3/3 fontes ready" } else { "[FALHA] fontes incompletas" })
        foreach ($p in $res.problemas) { $chk += "[FALHA] " + $p }
    } else { $chk += "[--] caderno nao processado nesta execucao" }
    $chk += $(if ($okC -eq $itensC.Count) { "[OK] {0}/{1} itens completos{2}" -f $okC, $itensC.Count, $(if ($SemDownload) { "" } else { " e baixados" }) } else { "[PENDENTE] {0}/{1} itens completos{2}" -f $okC, $itensC.Count, $(if ($SemDownload) { "" } else { " e baixados" }) })
    $artIds = @($itensC | ForEach-Object { (EstadoItem $c $_.id).artefato } | Where-Object { $_ })
    $dup = @($artIds | Group-Object | Where-Object { $_.Count -gt 1 })
    $chk += $(if ($dup.Count -eq 0) { "[OK] nenhum artefato vinculado a dois itens" } else { "[FALHA] artefato vinculado a mais de um item" })
    if ($c.extras -and @($c.extras).Count -gt 0) { $chk += "[ATENCAO] artefatos de audio/video a mais no caderno (possivel duplicata): " + (@($c.extras) -join "; ") }
    foreach ($x in $chk) { $L.Add("- " + $x); if ($x.StartsWith("[FALHA]")) { $falhas++ } }
    if ($okC -lt $itensC.Count) { $incompletos++ }
    $L.Add("")
}
$veredito = if ($falhas -gt 0) { "FALHA" } elseif ($incompletos -gt 0) { "INCOMPLETO" } else { "COMPLETO" }
$L.Add(("## Veredito: {0} -- {1}/{2} itens completos; {3} falha(s); {4} caderno(s) incompleto(s)" -f $veredito, $totalOk, $totalItens, $falhas, $incompletos))
$L.Add("")
$L.Add("Rodar de novo e seguro: o script so faz o que falta (estado em cadernos_rm2/estado_execucao.json).")
[System.IO.File]::WriteAllText($ArqRel, ($L -join "`r`n"), (New-Object System.Text.UTF8Encoding($false)))
Log ("Relatorio: " + $ArqRel) "Cyan"
Log ("Log: " + $ArqLog) "Cyan"
Log ("VEREDITO: {0} ({1}/{2} itens)" -f $veredito, $totalOk, $totalItens) $(if ($veredito -eq "COMPLETO") { "Green" } elseif ($veredito -eq "INCOMPLETO") { "Yellow" } else { "Red" })

ManterAcordado $false
try { Stop-Transcript | Out-Null } catch { }
if ($veredito -eq "COMPLETO") { exit 0 } elseif ($veredito -eq "INCOMPLETO") { exit 2 } else { exit 1 }
