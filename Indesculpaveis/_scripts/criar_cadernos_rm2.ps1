# criar_cadernos_rm2.ps1 -- cria os 4 cadernos de Rm 2.1-11 no NotebookLM e dispara a midia
#
# Uso (Windows, PowerShell 5.1), a partir da pasta Indesculpaveis:
#   powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil <PERFIL_PRO>                      (SIMULACAO: so mostra)
#   powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil <PERFIL_PRO> -Executar -Fase fontes   (cria cadernos e sobe fontes)
#   powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil <PERFIL_PRO> -Executar -Fase midia -Caderno 1
#   ... -Ids "1=<uuid>,2=<uuid>,3=<uuid>,4=<uuid>"   (reutiliza cadernos ja criados)
#
# Regras (CLAUDE.md): -p e -n em TODO comando; NAO troca o perfil global; so 'auth check --test' decide;
#   Regra 11-D: timeout em 'generate' NAO significa falha -- o script NUNCA repete o comando;
#   confira com 'artifact list'. Cota: 20 audios e 20 videos/dia/conta: este kit usa 16 audios e 8 videos.
#   Script em ASCII puro (PowerShell 5.1 le .ps1 como ANSI).
#
# NAO TESTADO: escrito numa sessao sem a CLI. Confira cada flag com 'notebooklm generate --help'
#   (a 0.8.4 mudou modulos em relacao a 0.7.3) ANTES do primeiro -Executar. Rode primeiro com
#   -Caderno 1 -Fase fontes, depois UM item de midia (-Somente c1_A1), e so entao o lote.

param(
    [Parameter(Mandatory=$true)][string]$Perfil,
    [switch]$Executar,
    [ValidateSet("fontes","midia","tudo")][string]$Fase = "fontes",
    [int[]]$Caderno = @(1,2,3,4),
    [string]$Ids = "",
    [string]$Somente = "",
    [int]$PausaSeg = 20
)

$ErrorActionPreference = "Continue"
$Conta = "aleinstitutoreformado@gmail.com"
$Raiz  = Join-Path (Split-Path -Parent $PSScriptRoot) "cadernos_rm2"
$Nomes = @{ 1 = "IND Rm2 C1 - Indesculpabilidade do moralista"; 2 = "IND Rm2 C2 - Paciencia e ira entesourada"; 3 = "IND Rm2 C3 - Obras, galardao e justificacao"; 4 = "IND Rm2 C4 - Imparcialidade de Deus" }

function Passo($t) { Write-Host ""; Write-Host "== $t" -ForegroundColor Cyan }
function Nb { param([string[]]$a) Write-Host ("  > notebooklm " + ($a -join " ")) -ForegroundColor DarkGray; if ($Executar) { & notebooklm @a } }

$mapa = @{}
if ($Ids -ne "") { foreach ($par in $Ids.Split(",")) { $kv = $par.Split("="); $mapa[[int]$kv[0]] = $kv[1].Trim() } }

Passo "0. Ambiente"
if (-not (Test-Path $Raiz)) { Write-Host "[FALHA] pasta nao encontrada: $Raiz" -ForegroundColor Red; exit 1 }
$cli = Get-Command notebooklm -ErrorAction SilentlyContinue
if (-not $cli) { Write-Host "[FALHA] CLI 'notebooklm' nao encontrada no PATH." -ForegroundColor Red; if ($Executar) { exit 1 } }
if ($Executar) {
    Write-Host "Conta esperada: $Conta -- confira que o perfil '$Perfil' abre ESTA conta."
    & notebooklm -p $Perfil auth check --test
    $r = Read-Host "O perfil abre $Conta ? (s/N)"
    if ($r -ne "s") { Write-Host "Abortado." -ForegroundColor Yellow; exit 1 }
}
else { Write-Host "MODO SIMULACAO -- nada sera executado. Use -Executar." -ForegroundColor Yellow }

$manifest = Import-Csv (Join-Path $Raiz "manifest.csv")

foreach ($n in $Caderno) {
    Passo ("CADERNO $n : " + $Nomes[$n])
    $id = $mapa[$n]
    if (($Fase -eq "fontes" -or $Fase -eq "tudo") -and -not $id) {
        Write-Host "Criar caderno:"
        if ($Executar) {
            $saida = & notebooklm -p $Perfil create $Nomes[$n] 2>&1 | Out-String
            Write-Host $saida
            $m = [regex]::Match($saida, "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
            if ($m.Success) { $id = $m.Value } else { $id = (Read-Host "Nao achei o ID na saida. Cole o ID do caderno $n").Trim() }
            Write-Host "ID do caderno ${n}: $id  (anote em MEMORIA_INDESCULPAVEIS.md)" -ForegroundColor Green
        } else { Write-Host "  > notebooklm -p $Perfil create `"$($Nomes[$n])`""; $id = "<ID_C$n>" }
    }
    if (-not $id) { $id = "<ID_C$n>"; Write-Host "[AVISO] sem ID para o caderno $n (use -Ids)." -ForegroundColor Yellow }

    if ($Fase -eq "fontes" -or $Fase -eq "tudo") {
        Write-Host "Persona do caderno:"
        $persona = Join-Path (Split-Path -Parent $Raiz) "_artifacts\persona_notebooklm.txt"
        Nb @("-p",$Perfil,"-n",$id,"configure","--persona",(Get-Content $persona -Raw -Encoding UTF8))
        Write-Host "Fontes (uma por vez; conferir 'ready' antes da proxima):"
        $arqs = @( (Join-Path $Raiz "fontes\comum\00_contexto_comum.md"), (Join-Path $Raiz "fontes\c$n\01_texto.md"), (Join-Path $Raiz "fontes\c$n\02_auditoria.md") )
        foreach ($a in $arqs) {
            Nb @("-p",$Perfil,"-n",$id,"source","add",$a)
            if ($Executar) { Start-Sleep -Seconds $PausaSeg; & notebooklm -p $Perfil -n $id source list }
        }
        Write-Host "  -> So passe a midia quando as 3 fontes estiverem 'ready' (source list)." -ForegroundColor Yellow
    }

    if ($Fase -eq "midia" -or $Fase -eq "tudo") {
        $itens = $manifest | Where-Object { [int]$_.caderno -eq $n }
        if ($Somente -ne "") { $itens = $itens | Where-Object { $_.id -eq $Somente } }
        foreach ($it in $itens) {
            $arq = Join-Path $Raiz $it.arquivo
            $prompt = Get-Content $arq -Raw -Encoding UTF8
            Write-Host ("Midia {0}: {1} / {2} {3}" -f $it.id, $it.tipo, $it.formato, $it.estilo)
            if ($it.tipo -eq "audio") {
                $args2 = @("-p",$Perfil,"-n",$id,"generate","audio",$prompt,"--format",$it.formato,"--language","pt_BR")
                if ($it.duracao -eq "long") { $args2 += @("--length","long") }
            } else {
                $args2 = @("-p",$Perfil,"-n",$id,"generate","video",$prompt,"--format",$it.formato,"--language","pt_BR")
                if ($it.estilo -ne "") { $args2 += @("--style",$it.estilo) }
            }
            Nb $args2
            if ($Executar) {
                Write-Host "  (Regra 11-D: se houver 'timeout', NAO repita. Rode: notebooklm -p $Perfil -n $id artifact list)" -ForegroundColor Yellow
                Start-Sleep -Seconds $PausaSeg
            }
        }
        if ($Executar) { & notebooklm -p $Perfil -n $id artifact list }
    }
}
Passo "Fim"
if (-not $Executar) { Write-Host "Simulacao concluida. Nada foi alterado." }
