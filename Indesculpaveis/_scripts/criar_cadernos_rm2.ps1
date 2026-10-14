# criar_cadernos_rm2.ps1 -- cria os 4 cadernos de Rm 2.1-11 no NotebookLM e dispara a midia
#
# Uso (Windows, PowerShell 5.1), a partir da pasta Indesculpaveis:
#   powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil ind-pro                      (SIMULACAO: so mostra)
#   powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil ind-pro -Executar -Fase fontes   (cria cadernos e sobe fontes)
#   powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil ind-pro -Executar -Fase midia -Caderno 1
#   ... -Ids "1=<uuid>,2=<uuid>,3=<uuid>,4=<uuid>"   (reutiliza cadernos ja criados)
#   ... -PermitirCinematic   (so com conta Google AI Ultra; ver abaixo)
#
# Regras (CLAUDE.md): -p em TODO comando; NAO troca o perfil global; so 'auth check --test' decide;
#   Regra 11-D: timeout em 'generate' NAO significa falha -- o script NUNCA repete o comando
#   (e nunca passa --retry); confira com 'artifact list' / 'artifact poll <task_id>'.
#   Cota: 20 audios e 20 videos/dia/conta: este kit usa 16 audios e 8 videos.
#   Script em ASCII puro (PowerShell 5.1 le .ps1 como ANSI).
#
# SINTAXE CONFERIDA contra notebooklm-py 0.8.4 (--help e codigo-fonte), SEM login:
#   * -p/--profile e opcao GLOBAL: vem ANTES do subcomando  (notebooklm -p P <cmd> ...)
#   * -n/--notebook NAO e global: vai DEPOIS do subcomando   (notebooklm -p P source add -n ID arq)
#     ('notebooklm -p P -n ID ...' falha com "No such option '-n'").
#   * 'create TITLE --json' -> {"notebook":{"id":...}}; sem --use NAO muda o caderno corrente global.
#   * 'configure -n ID --persona TEXTO' (ate 10.000 caracteres).
#   * 'source add -n ID ARQ --json' -> {"source":{"id":...}}; 'source wait -n ID SRC_ID --timeout N'
#     (exit 0=ready, 1=falhou/sumiu, 2=timeout).
#   * 'generate audio|video -n ID --prompt-file ARQ ...' (o prompt e posicional OU --prompt-file;
#     usamos --prompt-file para nao passar texto longo/com aspas pela linha de comando do PS 5.1).
#     --json devolve {"task_id":...,"status":"pending"}; default e --no-wait.
#   * audio: --format deep-dive|brief|critique|debate ; --length short|default|long
#   * video: --format explainer|brief|cinematic|short ; --style auto|custom|classic|whiteboard|...
#     (--style NAO vale com cinematic/short). cinematic EXIGE Google AI Ultra (diz o --help).
#   * --language: codigo validado contra lista interna; 'pt_BR' e aceito (notebooklm language list).
#   * 'artifact list -n ID', 'artifact poll TASK_ID -n ID', 'artifact wait ID -n ID --timeout N'.
#
# Ainda NAO TESTADO com login. Rode primeiro com -Caderno 1 -Fase fontes, depois UM item de
#   midia (-Somente c1_A1), e so entao o lote.

param(
    [Parameter(Mandatory=$true)][string]$Perfil,
    [switch]$Executar,
    [ValidateSet("fontes","midia","tudo")][string]$Fase = "fontes",
    [int[]]$Caderno = @(1,2,3,4),
    [string]$Ids = "",
    [string]$Somente = "",
    [int]$PausaSeg = 20,
    [int]$EsperaFonteSeg = 600,
    [switch]$PermitirCinematic
)

$ErrorActionPreference = "Continue"
$Conta = "aleinstitutoreformado@gmail.com"
$Raiz  = Join-Path (Split-Path -Parent $PSScriptRoot) "cadernos_rm2"
$Nomes = @{ 1 = "IND Rm2 C1 - Indesculpabilidade do moralista"; 2 = "IND Rm2 C2 - Paciencia e ira entesourada"; 3 = "IND Rm2 C3 - Obras, galardao e justificacao"; 4 = "IND Rm2 C4 - Imparcialidade de Deus" }
$Idioma = "pt_BR"

# Saida da CLI (Python) em UTF-8, so neste processo -- nao altera nada global.
$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch { }

function Passo($t) { Write-Host ""; Write-Host "== $t" -ForegroundColor Cyan }

# Mostra o comando (argumentos longos abreviados) e, com -Executar, roda.
function Mostra([string[]]$a) {
    $vis = $a | ForEach-Object { $s = [string]$_; if ($s.Length -gt 60) { $s = $s.Substring(0,57).Replace("`r"," ").Replace("`n"," ") + "..." }; if ($s -match '\s') { '"' + $s + '"' } else { $s } }
    Write-Host ("  > notebooklm " + ($vis -join " ")) -ForegroundColor DarkGray
}
function Nb([string[]]$a) { Mostra $a; if ($Executar) { & notebooklm @a } }

# PowerShell 5.1 NAO escapa aspas internas ao chamar executavel nativo: escapar a mao.
# (PowerShell 7.3+ ja escapa sozinho; la nao mexer, senao vira \\".)
function ArgNativo([string]$s) {
    if ($PSVersionTable.PSVersion.Major -ge 7 -and $PSNativeCommandArgumentPassing -ne "Legacy") { return $s }
    return ($s -replace '"', '\"')
}

# Roda a CLI com --json e devolve o objeto (stdout so; stderr vai para a tela).
function NbJson([string[]]$a) {
    Mostra $a
    if (-not $Executar) { return $null }
    $txt = (& notebooklm @a | Out-String)
    $script:UltimoExit = $LASTEXITCODE
    try { return ($txt | ConvertFrom-Json) } catch { Write-Host $txt; return $null }
}

$mapa = @{}
if ($Ids -ne "") { foreach ($par in $Ids.Split(",")) { $kv = $par.Split("="); $mapa[[int]$kv[0]] = $kv[1].Trim() } }

Passo "0. Ambiente"
if (-not (Test-Path $Raiz)) { Write-Host "[FALHA] pasta nao encontrada: $Raiz" -ForegroundColor Red; exit 1 }
$cli = Get-Command notebooklm -ErrorAction SilentlyContinue
if (-not $cli) { Write-Host "[FALHA] CLI 'notebooklm' nao encontrada no PATH." -ForegroundColor Red; if ($Executar) { exit 1 } }
if ($Executar) {
    & notebooklm --version
    Write-Host "Conta esperada: $Conta -- confira que o perfil '$Perfil' abre ESTA conta."
    & notebooklm -p $Perfil auth check --test
    if ($LASTEXITCODE -ne 0) { Write-Host "[FALHA] 'auth check --test' falhou para o perfil '$Perfil'. Nao troque o perfil global; refaca o login DESTE perfil." -ForegroundColor Red; exit 1 }
    $r = Read-Host "O perfil abre $Conta ? (s/N)"
    if ($r -ne "s") { Write-Host "Abortado." -ForegroundColor Yellow; exit 1 }
}
else { Write-Host "MODO SIMULACAO -- nada sera executado. Use -Executar." -ForegroundColor Yellow }

$manifest = Import-Csv (Join-Path $Raiz "manifest.csv")

foreach ($n in $Caderno) {
    Passo ("CADERNO $n : " + $Nomes[$n])
    $id = $mapa[$n]
    if (($Fase -eq "fontes" -or $Fase -eq "tudo") -and -not $id) {
        Write-Host "Criar caderno (sem --use: o caderno corrente global NAO muda):"
        $j = NbJson @("-p",$Perfil,"create",$Nomes[$n],"--json")
        if ($Executar) {
            if ($j -and $j.notebook -and $j.notebook.id) { $id = [string]$j.notebook.id }
            else { $id = (Read-Host "Nao achei o ID na saida. Cole o ID do caderno $n (ou ENTER para pular)").Trim() }
            if (-not $id) { Write-Host "[AVISO] caderno $n pulado." -ForegroundColor Yellow; continue }
            Write-Host "ID do caderno ${n}: $id  (anote em MEMORIA_INDESCULPAVEIS.md; reuse com -Ids)" -ForegroundColor Green
        } else { $id = "<ID_C$n>" }
    }
    if (-not $id) { $id = "<ID_C$n>"; Write-Host "[AVISO] sem ID para o caderno $n (use -Ids)." -ForegroundColor Yellow; if ($Executar) { continue } }

    if ($Fase -eq "fontes" -or $Fase -eq "tudo") {
        Write-Host "Persona do caderno:"
        $persona = Join-Path (Split-Path -Parent $Raiz) "_artifacts\persona_notebooklm.txt"
        $ptxt = (Get-Content $persona -Raw -Encoding UTF8).Trim()
        if ($ptxt.Length -gt 10000) { Write-Host "[FALHA] persona com $($ptxt.Length) caracteres (limite 10.000)." -ForegroundColor Red; exit 1 }
        Nb @("-p",$Perfil,"configure","-n",$id,"--persona",(ArgNativo $ptxt))
        Write-Host "Fontes (uma por vez; espera 'ready' com source wait antes da proxima):"
        $arqs = @( (Join-Path $Raiz "fontes\comum\00_contexto_comum.md"), (Join-Path $Raiz "fontes\c$n\01_texto.md"), (Join-Path $Raiz "fontes\c$n\02_auditoria.md") )
        $okFontes = $true
        foreach ($a in $arqs) {
            if (-not (Test-Path $a)) { Write-Host "[FALHA] fonte nao encontrada: $a" -ForegroundColor Red; $okFontes = $false; break }
            $j = NbJson @("-p",$Perfil,"source","add","-n",$id,$a,"--type","file","--json")
            if ($Executar) {
                if (-not ($j -and $j.source -and $j.source.id)) {
                    Write-Host "[AVISO] 'source add' sem ID na saida. NAO reenvie: confira com 'source list --status preparing'." -ForegroundColor Yellow
                    & notebooklm -p $Perfil source list -n $id
                    $okFontes = $false; break
                }
                $sid = [string]$j.source.id
                & notebooklm -p $Perfil source wait -n $id $sid --timeout $EsperaFonteSeg
                if ($LASTEXITCODE -ne 0) { Write-Host "[AVISO] fonte $sid nao ficou 'ready' (exit ${LASTEXITCODE}: 1=falhou, 2=timeout). Parando este caderno." -ForegroundColor Yellow; $okFontes = $false; break }
            } else {
                Mostra @("-p",$Perfil,"source","wait","-n",$id,"<SOURCE_ID>","--timeout","$EsperaFonteSeg")
            }
        }
        if ($Executar) { & notebooklm -p $Perfil source list -n $id }
        if (-not $okFontes) { Write-Host "  -> Fontes incompletas: NAO passe a midia deste caderno." -ForegroundColor Yellow; if ($Fase -eq "tudo") { continue } }
        else { Write-Host "  -> So passe a midia quando as 3 fontes estiverem 'ready' (source list)." -ForegroundColor Yellow }
    }

    if ($Fase -eq "midia" -or $Fase -eq "tudo") {
        $itens = $manifest | Where-Object { [int]$_.caderno -eq $n }
        if ($Somente -ne "") { $itens = $itens | Where-Object { $_.id -eq $Somente } }
        foreach ($it in $itens) {
            $arq = Join-Path $Raiz $it.arquivo
            if (-not (Test-Path $arq)) { Write-Host "[FALHA] prompt nao encontrado: $arq" -ForegroundColor Red; continue }
            Write-Host ("Midia {0}: {1} / {2} {3} {4}" -f $it.id, $it.tipo, $it.formato, $it.estilo, $it.duracao)
            if ($it.tipo -eq "audio") {
                $args2 = @("-p",$Perfil,"generate","audio","-n",$id,"--prompt-file",$arq,"--format",$it.formato,"--language",$Idioma,"--json")
                if ($it.duracao -ne "") { $args2 += @("--length",$it.duracao) }
            } else {
                if ($it.formato -eq "cinematic" -and -not $PermitirCinematic) {
                    Write-Host "  [PULADO] video cinematic exige Google AI Ultra (a conta e AI Pro). Use -PermitirCinematic so se a conta tiver Ultra." -ForegroundColor Yellow
                    continue
                }
                $args2 = @("-p",$Perfil,"generate","video","-n",$id,"--prompt-file",$arq,"--format",$it.formato,"--language",$Idioma,"--json")
                if ($it.estilo -ne "" -and $it.formato -ne "cinematic" -and $it.formato -ne "short") { $args2 += @("--style",$it.estilo) }
            }
            $j = NbJson $args2
            if ($Executar) {
                if ($j -and $j.task_id) { Write-Host ("  task_id: {0}  (acompanhe: notebooklm -p {1} artifact poll {0} -n {2})" -f $j.task_id, $Perfil, $id) -ForegroundColor Green }
                else { Write-Host "  (Regra 11-D: sem task_id / 'timeout' NAO e falha. NAO repita. Rode: notebooklm -p $Perfil artifact list -n $id)" -ForegroundColor Yellow }
                Start-Sleep -Seconds $PausaSeg
            }
        }
        Nb @("-p",$Perfil,"artifact","list","-n",$id)
    }
}
Passo "Fim"
if (-not $Executar) { Write-Host "Simulacao concluida. Nada foi alterado." }
