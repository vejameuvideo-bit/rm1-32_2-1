# etapa1_perfil_pro.ps1 -- Fase 0, Etapa 1 do projeto Indesculpaveis (IND)
#
# Cria (ou confere) o perfil da CLI do NotebookLM para a conta Pro do IND:
#     aleinstitutoreformado@gmail.com
#
# Uso:
#   powershell -ExecutionPolicy Bypass -File _scripts\etapa1_perfil_pro.ps1              (so mostra o que faria)
#   powershell -ExecutionPolicy Bypass -File _scripts\etapa1_perfil_pro.ps1 -Executar     (faz)
#   ... -Perfil outro_nome                                                                (nome do perfil; padrao: ind-pro)
#
# Regras herdadas (CLAUDE.md do JDD, sec. 6):
#   - NAO troca o perfil global (quebraria as sessoes paralelas dos outros projetos).
#   - -p vem ANTES do subcomando.
#   - So 'auth check --test' decide se o token vale; 'profile list' mente com token vencido.
#   - Script em ASCII puro (PowerShell 5.1 le .ps1 como ANSI).
#
# NAO TESTADO: escrito numa sessao sem a CLI instalada. Conferir a saida de cada passo.

param(
    [string]$Perfil = "ind-pro",
    [switch]$Executar
)

$ErrorActionPreference = "Continue"
$ContaEsperada = "aleinstitutoreformado@gmail.com"
$Raiz = Split-Path -Parent $PSScriptRoot

function Passo($texto) { Write-Host ""; Write-Host "== $texto" -ForegroundColor Cyan }

Passo "0. Ambiente"
$cli = Get-Command notebooklm -ErrorAction SilentlyContinue
if (-not $cli) { Write-Host "[FALHA] CLI 'notebooklm' nao encontrada no PATH." -ForegroundColor Red; exit 1 }
& notebooklm --version

Passo "1. Perfis existentes (informativo -- 'authenticated' aqui NAO prova nada)"
& notebooklm profile list

if (-not $Executar) {
    Passo "MODO SIMULACAO -- nada foi alterado"
    Write-Host "Com -Executar, este script faria:"
    Write-Host "  notebooklm -p $Perfil login"
    Write-Host "  notebooklm -p $Perfil auth check --test"
    Write-Host "  gravar '$Perfil' em $Raiz\perfil.config.txt"
    Write-Host ""
    Write-Host "No login, entre com: $ContaEsperada" -ForegroundColor Yellow
    exit 0
}

Passo "2. Login no perfil '$Perfil' -- entre com $ContaEsperada"
Write-Host "ATENCAO: o login por cookies falhou nesta maquina em 30/09 (rookie_cookies.pyd," -ForegroundColor Yellow
Write-Host "'DLL load failed ... Acesso negado'). Se falhar de novo, NAO mexa em antivirus/politica" -ForegroundColor Yellow
Write-Host "por conta propria: registre o erro e decida (ver ESTADO_ATUAL_2026-10-03.md sec. 7)." -ForegroundColor Yellow
& notebooklm -p $Perfil login
if ($LASTEXITCODE -ne 0) { Write-Host "[FALHA] login retornou $LASTEXITCODE" -ForegroundColor Red; exit 2 }

Passo "3. auth check --test (o unico teste que vale)"
$saida = & notebooklm -p $Perfil auth check --test 2>&1 | Out-String
Write-Host $saida
if ($LASTEXITCODE -ne 0) { Write-Host "[FALHA] auth check retornou $LASTEXITCODE" -ForegroundColor Red; exit 3 }

Passo "4. A conta e a esperada?"
if ($saida -match [regex]::Escape($ContaEsperada)) {
    Write-Host "[OK] a saida menciona $ContaEsperada" -ForegroundColor Green
} else {
    Write-Host "[CONFERIR] a saida do auth check NAO menciona $ContaEsperada." -ForegroundColor Yellow
    Write-Host "Confira a conta por outro meio (ex.: 'notebooklm -p $Perfil list' mostra os cadernos da conta)" -ForegroundColor Yellow
    Write-Host "ANTES de criar qualquer caderno. Caderno criado na conta errada e trabalho perdido." -ForegroundColor Yellow
}

Passo "5. Gravar perfil.config.txt"
$alvo = Join-Path $Raiz "perfil.config.txt"
$Perfil | Out-File -FilePath $alvo -Encoding ascii -NoNewline
Write-Host "[OK] $alvo = $Perfil"
Write-Host ""
Write-Host "Proximo: substituir <PERFIL_PRO> por '$Perfil' nos documentos e registrar no _LOG_EXECUCAO.md." -ForegroundColor Cyan
