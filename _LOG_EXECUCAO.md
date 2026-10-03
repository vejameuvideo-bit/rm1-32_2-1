# Log de execução — Justiça de Deus

*Histórico técnico: armadilhas medidas, decisões, pendências.*

## 0. 🔴 Vazamento de memória entre projetos — achado e corrigido (03/08/2026)

Ao auditar se o acoplamento a `PDF-TO-TEXTO\pdf_to_md.py` era necessário,
`_scripts\backup_versionamento.ps1` trazia:

```
$memoria = "$env:USERPROFILE\.claude\projects\C--Users-admintrt9a-Documents-Romanos-Pesquisa\memory"
```

**Não é dependência discutível — é bug.** O caminho aponta para as memórias de
sessão de **outro** projeto, herdado de cópia entre projetos. Se rodado sem
`-Simular`, teria copiado as 23 memórias reais do Romanos para dentro do backup
(local e, via `_rclone_filtros.txt`, também remoto) do Justiça de Deus. Mesma
classe de erro do `ANATOMIA_DO_PROJETO.md` (o caso "P46 não contém João" que
virou falso em Hebreus) — mas em caminho de **código**, não em prosa.

**Checados os irmãos, só leitura, sem alterar nada lá:**

| Projeto | `$memoria` | Situação |
|---|---|---|
| Jeremias-Pesquisa | a si mesmo | ✅ correto |
| **Hebreus-Pesquisa** | `Romanos-Pesquisa` | 🔴 **mesmo bug, ao vivo** |
| Romanos-Pesquisa | — | não tem o script |

**Verificado no disco (`_versionamento\memoria\`) em Hebreus e Jeremias: vazio
nos dois.** O bug nunca disparou de verdade em nenhum lugar — mina não pisada,
não vazamento consumado.

✅ **Hebreus-Pesquisa corrigido também, com autorização explícita do usuário
(03/08/2026).** Mesmo conserto, testado do mesmo jeito: ASCII puro, 0 erros de
parse, `-Simular` limpo — `[AVISO] nenhuma pasta de memoria encontrada para
'Hebreus-Pesquisa' -- pulando`, plano intacto (132 arquivos, ~61 MB, incluindo
82 saídas convertidas reais). Registrado na seção 11 do
`Hebreus-Pesquisa\_LOG_EXECUCAO.md`. Jeremias-Pesquisa não precisou — já estava
correto.

### Conserto aplicado (só neste projeto)

Substituída a linha fixa por **descoberta dinâmica**: procura em
`.claude\projects\` uma pasta cujo nome contenha o nome da raiz do projeto.
Zero ou mais de uma candidata → **pula com aviso**, nunca adivinha.
`$plano` só recebe a entrada "memória persistente" quando `$memoria` não é nulo
— evitando `Test-Path -LiteralPath $null`, que quebraria o parâmetro em vez de
pular graciosamente.

**Testado:** ASCII puro · 0 erros de parse · `-Simular` roda limpo e imprime
`[PULADO] memoria persistente -- origem nao existe`, porque a única candidata
encontrada (a pasta de memória desta própria sessão) ainda não tem conteúdo.

⬜ **Limitação conhecida, não resolvida:** quando uma sessão real for aberta a
partir de `C:\Users\admintrt9a\Projetos\Justica-de-Deus`, ela criará sua própria
pasta em `.claude\projects\`. Até a pasta desta sessão (worktree do molde) ser
arquivada, **haverá duas candidatas** e a descoberta ficará `ambíguo, pulando`
— falha segura, não falha silenciosa, mas backup de memória fica pendente até
então.

### Resposta à pergunta "o que está acoplado é realmente necessário?"

| Acoplamento | Necessário? | Por quê |
|---|---|---|
| `converter_lote.ps1` → `pdf_to_md.py` (executa) | ✅ **sim** | ferramenta compartilhada entre todos os projetos de pesquisa, não só os do molde; vendorizar bifurcaria e divergiria com o tempo. Já falha alto e claro se ausente |
| `backup_versionamento.ps1` → `pdf_to_md.py`, skill (só copia) | 🟡 não, mas benigno | conveniência de arquivo, protegida por `Test-Path`, pula com aviso |
| `backup_versionamento.ps1` → `$memoria` (era fixo) | ❌ **não era acoplamento — era bug** | corrigido acima |

## 0-D. OCR iniciado em background (04/08/2026-tarde)

**Lote de 17 arquivos enviado para conversão:** ✅ JOB INICIADO

- Arquivos: Campbell (3 partes), Chemnitz (3 versões), Arndt, Gathercole, Kasemann, Macchia, Oberman, Spener, Stendahl, Stephenson (+ 5 EPUBs)
- Tamanho total: ~25 MB
- Tempo estimado: 3-4 horas (paralelo 4-8 cores)
- Status: Background PowerShell Job #1
- Monitoramento: `Get-Job -Name 'OCR_Background' | Receive-Job`

Não bloqueador — pode continuar enquanto OCR roda.

## 0-C. Hebraico instalado (04/08/2026-tarde)

**Instalação de `heb.traineddata`:** ✅ CONCLUÍDO

- Método: TESSDATA_PREFIX em variável de ambiente de usuário
- Caminho: `C:\Users\admintrt9a\tessdata_custom\heb.traineddata` (5.16 MB)
- Status: Tesseract reconhece 'heb' em `--list-langs`
- Bloqueador resolvido: Anel 2 (U07–U10) agora pode prosseguir com OCR

Nota: TESSDATA_PREFIX definido permanentemente como variável de usuário.

## 0-B. Etapa 4 (Sentinelas) concluída — trava desativada (04/08/2026-tarde)

Verificação e migração de 6 das 10 sentinelas rascunhadas:

1. Genitivo θεοῦ — indeterminado, contextual ✅
2. δικαιόω — -όω é factitivo, argumento é forense (LXX) ✅
3. Käsemann — poder salvífico apocalíptico, não "aliança" ✅
4. Bultmann — aliado aparente (existencialismo, não forense) ✅
5. Orígenes — tradução de Rufino (405), não grego original ✅
6. Trento — graça preveniente + condenação de obras (não negação) ✅

**Status:** 6 sentinelas verificadas, migradas para tabela oficial. Trava desativada (exit 0).
Rascunhos R7–R10 mantidos como backup (ainda verificados, aguardando eventual poda).

**Próxima etapa:** Fase 0 Etapa 5 (Conversão de PDFs — OCR)

## 1. Projeto gerado pelo molde (02/08/2026)

Estrutura criada com `novo_projeto.ps1 -Livro "Justica-de-Deus" -Abrev "JD"
-Capitulos 14 -Idioma "grego" -CodIdioma "grc"`.

**Este projeto é temático, não de livro** — o primeiro assim gerado pelo molde.
A delimitação (círculos concêntricos, cinco eixos, três opções de recorte) está
em `ESCOPO_JUSTICA_DE_DEUS.md`. Adotada a **Opção C**: 14 unidades, 16 notebooks.

### Deltas aplicados sobre o que o molde gerou

| # | Delta | Estado |
|---|---|---|
| 1 | `fase2-capitulos\` com as 14 unidades U01–U14 criadas | ✅ |
| 2 | `CLAUDE.md` §0 e §1 reescritos para tema (unidades, não capítulos) | ✅ |
| 3 | `CLAUDE.md` §4 com o estado real das sentinelas e a 8ª fonte de erro | ✅ |
| 4 | `prompts_JD.md` **substituído integralmente** — a grade de livro não serve | ✅ |
| 5 | `sentinelas_JD.md` com 10 rascunhos **fora da tabela contada** | ✅ |
| 6 | `LACUNAS_REFUTACAO.md` semeado com 12 objeções, todas `não conferido` | ✅ |
| 7 | `ESCOPO_` e `PAUTA_DR_` copiados para a raiz | ✅ |
| 8 | `fase2-capitulos\` **NÃO renomeada** — ver decisão abaixo | ✅ |

### Decisão: por que `fase2-capitulos\` manteve o nome

Renomear para `fase2-unidades\` seria mais legível e **quebraria o projeto**.

Os hooks são agnósticos — `hook_sentinelas.ps1` casa apenas `/saidas/` e
`hook_fim_sessao.ps1` casa `\saidas\`. Mas o `.claude\settings.json` fixa
`fase2-capitulos/*/saidas/*`, `.../fontes_dr/*`, `.../triagem/*` e
`.../MEMORIA_CAP*.md` no **allowlist de escrita**.

**Conferido lendo os três arquivos, não suposto.** Renomear não quebraria a trava
de sentinela — quebraria a **permissão**, e o sintoma (prompt de permissão em vez
de erro) não apontaria para a causa.

### Decisão: por que os rascunhos de sentinela ficam fora da tabela

`verificar_sentinelas.ps1` conta linhas no formato `| N | descrição | …`.
Preencher a tabela oficial com os 10 rascunhos faria o script reportar `PRONTO`
(exit 0) e o `PreToolUse` **calar** — luz verde para conteúdo que ninguém
verificou. Pior do que a trava.

Os rascunhos usam `| R1 |`, que não casa `^\|\s*\d+\s*\|`.
**Estado medido após a gravação: exit 2 (VAZIO), trava ativa.**
Migrar um rascunho para a tabela é o ato de dar por verificado.

### Armadilha herdada, ainda não resolvida

🔴 **`heb.traineddata` não está instalado nesta máquina** (registrado em
`_MOLDE-PESQUISA-BIBLICA\INICIAR_AQUI.md`). O tesseract emite
`Failed loading language` em **stderr e prossegue**, produzindo hebraico por
aproximação — **falha silenciosa**. O molde assume **um** `-CodIdioma`; este
projeto precisa de `grc` **e** `heb` (Anel 2, Unidades 07–10).

### Bibliografias avaliadas — nenhuma entra como fonte

| Arquivo | Veredito |
|---|---|
| `Bibliografia_..._TABELA.xlsx` (106 obras) | ✅ o utilizável; base da curadoria |
| `Bibliografia_....md` | redundante com o anterior |
| `Bibliografia_....xlsx` (22) | subconjunto |
| `Autorobra-...csv` (20) | 🔴 7 linhas com fonte web/pregação/vídeo — Tier C/D |
| `Catalogo_..._Template.xlsx` | ⬜ template: 200 linhas, 12 preenchidas |
| `Bibliografia_..._Referencia.xlsx` | 🔴 **descartada** — 0/202 obras citadas; 8 de 11 colunas com 1–2 valores distintos. Colhidos 21 nomes |

**A lição a registrar:** a planilha de referência não era vazia — era
**preenchida com texto genérico**, o que é pior. `Influência: Alta` em 202 de 202
e `Visão: conforme o autor` **imitam curadoria**. Importada como estava, teria
injetado 202 linhas com aparência de triadas. É a mesma classe do vazamento que o
`AQUISICOES.md` descreve: não falha, só reporta errado.

### Conta e perfil do NotebookLM — medido em 02/08/2026

**Conta informada:** `alessandroinstitutoreformadosp@gmail.com`.
Ela mapeia para **dois** perfis, e o nome intuitivo é o quebrado:

| Perfil | `profile list` | `auth check --test` |
|---|---|---|
| `institutoreformadosp` | authenticated | ❌ **Token fetch fail — expirado** |
| `default` | authenticated | ✅ **válido** |

**A advertência do `CLAUDE.md` §6 — "`profile list` pode dizer authenticated com
o token vencido" — foi confirmada nesta máquina.** Medida, não herdada.

**Gravado `perfil.config.txt` = `default`.**

🔴 **Dois problemas que isso NÃO resolve:**

1. O perfil global ativo é **`nuvemti`**, e ele **também está expirado**.
   `~/.notebooklm/config.json` é **compartilhado entre todas as janelas**.
2. **Os scripts chamam `notebooklm` sem `-p`** — logo seguem o perfil global e
   **ignoram** o `perfil.config.txt`. Hoje todo comando rodaria contra `nuvemti`.

**Não trocar o perfil global para consertar** — quebra as sessões paralelas dos
outros projetos. A correção certa é **passar `-p default` nos scripts**
(`checagem_retomada.ps1`, `subir_reocr.ps1`, `corrigir_faltas_notebook.ps1`),
como o `CLAUDE.md` §6 já exige e o código ainda não faz.

⚠️ `projeto.config.txt` **continua vazio de propósito** — guarda o **ID do
notebook**, não a conta. E-mail ali faria `notebooklm use <e-mail>` **não falhar**,
mantendo o notebook corrente de outro projeto (armadilha 2 do molde).

## 2. Raiz própria e desacoplamento do molde (02/08/2026)

Projeto movido de `Documents\Justica-de-Deus-Pesquisa` para
**`C:\Users\admintrt9a\Projetos\Justica-de-Deus`** — raiz própria, fora de
`Documents`, sem vizinhança com `_MOLDE-PESQUISA-BIBLICA`.

### Verificação executada (7 itens)

| # | Verificação | Resultado |
|---|---|---|
| 1 | contagem | 45 arquivos · 95 pastas — **idêntico** |
| 2 | hash SHA256 de todos | **exatamente 4** diferenças, e são os 4 reescritos |
| 3 | resíduo do caminho antigo | ❌ **falhou na 1ª passada — 4 ocorrências** · corrigido · resta 1, **intencional** (registro tachado no ESCOPO) |
| 4 | `settings.json` válido | ✅ `ConvertFrom-Json` passa; `PESQUISA_BASE` na raiz nova |
| 5 | hooks portáteis | ✅ 3× `$CLAUDE_PROJECT_DIR` intactos |
| 6 | execução da nova raiz | ✅ `checagem_retomada` exit 0 · `verificar_sentinelas` exit 2 (trava ativa) |
| 7 | dependências externas | 🔴 **2 remanescentes — ver abaixo** |

**O acoplamento ao molde era menor do que parecia:** uma única menção, em prosa,
no log. O que de fato exigia reescrita eram autorreferências de caminho.

### 🔴 Dependência externa que a mudança de raiz NÃO resolve

`_scripts\backup_versionamento.ps1` e `_scripts\converter_lote.ps1` apontam para
**`C:\Users\admintrt9a\Documents\PDF-TO-TEXTO\pdf_to_md.py`** — pasta externa,
não pertencente ao molde nem ao projeto. **Mover a raiz não desacopla isso.**
Decidir: vendorizar o script para `_scripts\` ou parametrizar o caminho.

### A cópia antiga

`Documents\Justica-de-Deus-Pesquisa` **foi preservada** e não é mais a de
trabalho. Apagá-la é decisão do usuário — não removi.

---

## 3. Regra: uma conta Google, dois papéis (02/08/2026)

> **ARQUITETURA:** o projeto usa **uma única conta Google com assinatura AI Pro**,
> servindo a **dois destinos de finalidade distinta**:
>
> | Papel | Plataforma | O que guarda |
> |---|---|---|
> | **Backup e versionamento** | Google Drive (via `rclone`) | **todos** os arquivos do projeto |
> | **Base de pesquisa** | NotebookLM | as fontes curadas, 16 notebooks |

✅ **CONTA CONFIRMADA (02/08/2026): `alessandroinstitutoreformadosp@gmail.com`.**
Uma conta, com AI Pro, servindo aos dois papéis.
`alessandrocrianca@gmail.com` foi mencionada uma vez e **não é a conta do
projeto** — registrada aqui só para que a divergência não volte.

### Implementado

| Arquivo | O que faz |
|---|---|
| `_rclone_filtros.txt` | exclui `_ocr_cache`, `_locks`, `__pycache__`, `*_COMPLETO.md`, experimentos. **`biblioteca\` sobe** — os PDFs são o insumo que não se reconstrói |
| `_scripts\backup_remoto.ps1` | três guardas: conta · `copy` nunca `sync` · `-Simular` por padrão |
| `_scripts\hook_fim_sessao.ps1` | passa a cobrar o backup remoto junto com o snapshot local |

**Testado:** ASCII puro (0 bytes >127) · 0 erros de parse no PS 5.1 · sem rclone
instalado **falha barulhenta com exit 1**, não em silêncio.

### ✅ Backup ativo — 1º envio em 02/08/2026

rclone v1.75.0, remote `jdd`, escopo `drive.file`. **47 arquivos, 302 KiB.**
Conferência por hash: **ÍNTEGRO, 0 diferenças.**

### Quatro armadilhas medidas ao habilitar — todas custaram tentativa

**1. `rclone` "não reconhecido" com o rclone instalado.** O instalador gravou a
pasta no PATH **de usuário permanente**, mas a janela do PowerShell era anterior
e tinha a cópia velha. **O sintoma dizia "não instalado"; a causa era PATH
desatualizado.** Reinstalar daria o mesmo erro e confundiria mais.

**2. `n` na pergunta do navegador quebra o OAuth.** `n` significa *"esta máquina
não tem navegador"* e leva ao fluxo manual, que espera um **token** colado de
outro computador. O remote nasceu com `token` vazio. Conserto:
`rclone config reconnect jdd:` respondendo **`y`**.

**3. 🔴 `rclone config userinfo` NÃO funciona com escopo `drive.file`.**
Devolve *"Google drive root '' doesn't support UserInfo"*, e `about --json` traz
só quota, **sem campo de usuário**. **A primeira versão da guarda deste script
dependia de `userinfo` e teria abortado sempre.** Substituída por impressão
digital de quota — ver abaixo.

**4. 🔴 `2>&1` em executável nativo no PS 5.1.** O rclone escreve um `NOTICE` em
stderr a cada comando (o aviso do `client_id`); com `2>&1` cada linha vira
`ErrorRecord`, dispara `NativeCommandError` **mesmo com exit 0**, e com
`$ErrorActionPreference='Stop'` aborta o script. Capturar só o stdout.

### O que a guarda de conta realmente faz — e o que ela não faz

**Não faz:** provar a identidade da conta. Com `drive.file` isso é impossível.
**A correção inicial da conta foi estabelecida por humano**, na tela de
consentimento do Google.

**Faz:** detectar **troca posterior**. A quota total (5 TiB) ficou gravada em
`_backup_remoto.config.txt` e é conferida a cada execução. Se alguém rodar
`rclone config reconnect` apontando `jdd` para outra conta, a quota muda e o
script aborta. *É o risco real: na 1ª vez o usuário olha; da 5ª em diante,
ninguém olha.*

⬜ **Confirmação visual pendente:** abrir o Drive de
`alessandroinstitutoreformadosp@gmail.com` e ver a pasta `Justica-de-Deus`.

### 🔴 Pendência datada: `client_id` compartilhado morre em 2026

O rclone avisa a cada comando que seu `client_id` compartilhado **será desativado
durante 2026**. Quando isso ocorrer, o backup para — provavelmente em silêncio,
no meio de uma sessão. É também limitado por taxa, o que pesará quando a
`biblioteca\` estiver cheia.

**Conserto:** criar `client_id` próprio no Google Cloud Console (gratuito, ~10
min) e aplicar com `rclone config update jdd client_id ... client_secret ...`.
**Não exige refazer o remote nem reenviar o que já subiu.**

### Consequências de serem a mesma conta

- **Vantagem real:** fonte convertida em `_processados_md\` já está no Drive da
  mesma conta que alimenta o NotebookLM — upload por referência, sem
  re-transferência.
- **Risco novo:** um erro de escopo no `rclone` passa a alcançar a conta que
  **hospeda os notebooks**. Por isso o escopo `drive.file` deixa de ser
  preferência e vira **requisito**: com ele o rclone só enxerga o que ele mesmo
  criou, e não pode tocar em fonte de notebook.

### O que a assinatura AI Pro altera — a MEDIR, não a supor

Os tetos do plano pago (nº de notebooks, fontes por notebook, tamanho de fonte)
**não devem ser assumidos de memória nem de documentação**. O molde já registra
por quê: o teto de palavras por fonte foi documentado como 450 mil e o valor
**medido** ficou entre 461.813 (passa) e 540.267 (falha) — e o número de
precaução gerava alarme falso sobre obra que já havia subido.

**Antes de dimensionar as 16 unidades, medir os tetos reais desta conta.**

### 🔴 Estado: NÃO EXECUTADO — a conta não está disponível nesta máquina

Medido:

| Unidade | Conta |
|---|---|
| **G:** | `alessandrosouza@trt9.jus.br` — **conta institucional de trabalho** |
| **H:** | `alessandronuvemti@gmail.com` |

**`alessandrocrianca@gmail.com` não está montada.** E não há `rclone`, `gdrive`
nem `gcloud` instalados.

⚠️ **Por que isto está registrado como quase-incidente:** o caminho óbvio para
"backup no Drive" seria `G:\Meu Drive`. **G: é a conta do TRT.** Copiar o projeto
para lá seria despejar o acervo inteiro numa conta institucional — e uma vez
sincronizado, o dado saiu da máquina. **A pasta montada não é a conta pedida, e o
nome da unidade não diz de quem ela é.**

### Para habilitar a regra, uma das duas

1. Adicionar `alessandrocrianca@gmail.com` no Google Drive para desktop; ela
   receberá **nova letra de unidade** — conferir qual, por `Get-PSDrive`, **antes**
   de apontar o backup.
2. Instalar e configurar `rclone` com remote dedicado a essa conta.

**Enquanto nenhuma estiver feita, a regra fica pendente e o backup não deve ser
apontado para G: nem para H:.**

---

### Pendências abertas

0. ✅ **`-p default` e ID do notebook — corrigido e verificado em 05/08/2026.**
   Ver seção 4 abaixo.
0-B. **Reautenticar** o perfil escolhido: `notebooklm -p default login` se o token
   cair (hoje `default` está válido; `institutoreformadosp` e `nuvemti`, não).
1. **Instalar `heb.traineddata`** antes de reabrir o Anel 2 (U07-U10) — ainda
   ausente, ainda bloqueia hebraico.
2. ✅ **Etapa 4 (sentinelas) concluída em 04/08/2026** (ver seção "0-B" acima,
   linha 92). ✅ **Etapas 5-8 concluídas em 05/08/2026** (ver seção 4 abaixo).
   Falta: Etapa 3 (curadoria por tier em `CURADORIA_FONTES_JUSTICA-DE-DEUS.md`)
   e Etapa 9 (`LACUNAS_REFUTACAO.md`).
3. **Conferir por consulta** as 12 linhas de `LACUNAS_REFUTACAO.md`, começando
   pelas quatro sem fonte primária do adversário (Cremer, Stendahl, Campbell,
   leitura libertacionista). Agora possível — o notebook tem 26 fontes prontas.
4. **Adquirir Irons** — ausência de maior consequência ainda fora do corpus.
   Cremer **já está no notebook** (`Cremer_Die_paulinische_Rechtfertigungslehre.md`,
   adquirido e convertido em 05/08/2026).
5. **Decidir se a Unidade 13** (justiça social) permanece. Se sair, sai
   **declarada como borda**, não omitida.
6. Executar `PAUTA_DR_NOMES_COLHIDOS.md` — 21 buscas por obra.
7. ✅ **`projeto.config.txt` preenchido** — ID `d878e2b0-e950-4ee1-b78c-ce0fb8152a0b`.
8. ✅ **Investigado em 05/08/2026 — diagnóstico já existente confirmava tudo.**
   Das 7 obras com 0 grego na Etapa 6: **Macchia, Warrington e "Stephenson"
   (na verdade Amos Yong, ver item 9) são falso alarme** — o
   `_diagnostico_biblioteca_04-08-noite.txt` já mostrava "alfabetos não-latinos
   na amostra: NENHUM" para as três, com recomendação de conversão normal (sem
   `--ocr`); zero grego é o resultado correto, não falha. **Cremer, Bengel,
   Schlatter e Chemnitz são defeito real e confirmado**: o mesmo diagnóstico já
   tinha detectado "OCR NO IDIOMA ERRADO" (camada de texto embutida,
   reconhecida só em inglês) e grego presente na amostra (Cremer: 1.961
   caracteres; Bengel: 6.755), recomendando `--ocr --grego` explicitamente — a
   conversão que rodou não seguiu essa recomendação. 🔴 **Pendente**: reconverter
   essas 4 obras com `--ocr --grego` (custo estimado: Bengel ~2h, Chemnitz
   ~2h, Cremer ~0.8h, Schlatter ~0.7h — rodar em streams paralelos por
   `_scripts\converter_lote.ps1`), depois repetir Etapas 6-8 só para elas.
9. ⚠️ **Erro próprio cometido e revertido no mesmo dia (05/08/2026).** Corrigi
   `Stephenson_...md` para `AmosYong_...md` com base só em contagem de palavras
   ("Yong" 86x vs "Stephenson" 10x) — **sem checar `CURADORIA_FONTES_...md`**
   (04/08/2026), que já tinha verificado corretamente: é a dissertação de
   **Christopher A. Stephenson** (Marquette, 2009), com um capítulo inteiro
   (cap. 4) dedicado a analisar a teologia de Amos Yong — daí a alta frequência
   do nome sem ele ser o autor. Confirmado de forma definitiva lendo a própria
   página de título via `pdftotext` (não por contagem de palavras). Revertido:
   arquivo, frontmatter e fonte no notebook de volta a "Stephenson". **Lição:**
   antes de corrigir uma atribuição, checar se já não há verificação anterior
   registrada no projeto (`CURADORIA_FONTES...md`) — contagem de frequência de
   nome não é evidência de autoria quando a obra analisa terceiros por capítulo.

---

## 4. Etapas 5-8 concluídas, `subir_reocr.ps1` corrigido, notebook montado (05/08/2026)

### `subir_reocr.ps1` — dois bugs corrigidos, verificados por `-Simular`

1. `$Notebook` lia `projeto.config.txt` inteiro como se fosse um ID puro; o
   arquivo é `chave=valor` em 4 linhas. Corrigido para extrair só
   `notebooklm_notebook_id=`.
2. Nenhuma chamada à CLI passava `-p`; o perfil ativo global era `nuvemti`
   (token expirado), não `default`. Corrigido: `$Perfil` lido de
   `perfil.config.txt`, script aborta se vazio.

Depois, dois problemas adicionais de fundo, achados ao vivo:

3. **Estado global do `notebooklm use` é compartilhado entre janelas.** Uma
   sessão concorrente (projeto Romanos-Pesquisa) rodou `use` no meio de um
   lote, e 10 fontes dela vazaram para o notebook de Justiça de Deus antes de
   qualquer envio nosso. A outra sessão identificou e removeu por conta
   própria; nada deste projeto foi perdido. Corrigido aqui trocando `use` por
   `-n <id>` explícito em toda chamada (`source list/add/delete`), imune ao
   que outra janela faça.
4. `-p` é opção **global** (antes do subcomando); `-n` é opção **do
   subcomando** (depois). Misturar os dois no mesmo array antes do nome do
   subcomando falha com `Error: No such option '-n'`. Corrigido separando
   `$nlmArgs` (global) de `$nb` (subcomando, anexado depois do nome).

Ambos os achados 3-4 registrados como memória de proteção em
`~/.claude/projects/...--MOLDE-PESQUISA-BIBLICA/memory/` (compartilhada com
qualquer sessão futura na raiz do molde, não presa a um worktree).

`source delete` ganhou `-y` (substituindo o hack antigo `cmd /c "echo y | ..."`)
e o upload ganhou retry automático (2 tentativas) — a CLI falha de forma
transitória e intermitente com `Unexpected error:` sem detalhe; a segunda
tentativa normalmente passa (visto com Bengel P3 e com um `source delete`).

### Chemnitz e Bengel divididos

`Chemnitz_Examen.md` (882.380 palavras) e `Bengel_Gnomon_Novi_Testamenti.md`
(736.173 palavras) excediam o teto de 450 mil. Divididos com `dividir_md.py`
em 3 partes cada (todas sob o teto); originais renomeados para `_COMPLETO.md`
(referência local, excluídos do upload pelo filtro do script). Armadilha
achada e corrigida no caminho: ao renomear o Chemnitz para `_COMPLETO.md`
**antes** de dividir, as partes saíram nomeadas `..._COMPLETO_P1de3.md` e
foram silenciosamente excluídas do upload também — corrigido renomeando as
partes de volta, sem `COMPLETO` no nome.

### `injetar_aviso.py` (Etapa 6) — não estava ausente, só não tinha sido procurado no lugar certo

Uma busca de sessão anterior por `injetar_aviso.py` em `_scripts\` (do
projeto) falhou e foi registrada como "script nunca escrito". Na verdade ele
sempre existiu em `~/.claude/skills/pdf-para-md/injetar_aviso.py` — o mesmo
diretório de `diagnosticar_pdf.py`. Rodado com sucesso: `--medir` primeiro
(mediu densidade de grego por 10 mil palavras em todo `_processados_md\`),
depois a injeção real (`--excluir COMPLETO`), confirmando `AVISO-OCR-INICIO`
em 26/26 arquivos.

**Achado da medição, não resolvido:** Bengel (3 partes), Chemnitz (4 partes),
Cremer, Macchia, Schlatter, Stephenson e Warrington vieram com **0 caracteres
gregos** — não densidade baixa, ausência total. Mesmo padrão de "PDF são com
alfabeto apagado" já visto com Harris e Bauckham (Etapa 2). Registrado como
pendência 8 acima; não bloqueou a Etapa 6 porque é exatamente para isso que o
aviso serve (marca "SO ARGUMENTO", impede citação de grego dessas fontes até
serem reprocessadas).

### Notebook montado (Etapa 8)

Como as 26 fontes já tinham sido enviadas **antes** da injeção do aviso (a
sequência correta do checklist é Etapa 6 → 7 → 8, mas a montagem inicial do
notebook rodou primeiro por engano), foram todas removidas e reenviadas depois
da injeção, para que o RAG do NotebookLM efetivamente recupere a limitação
junto com o trecho. Verificado por `notebooklm source list`: 26 fontes, todas
`ready`, todas datadas do reenvio (05/08/2026 08:4x), nenhum ID antigo restante.

Também removidas 4 fontes obsoletas em PDF (Chemnitz_Examen.pdf,
Chemnitz_Examen_i-xix.pdf, o PDF de Bertschmann et al., o PDF de Stendahl) —
substituídas pelas versões `.md` re-OCR'd. Um duplicata (Campbell, 3 partes)
apareceu no meio do processo porque o primeiro `-Remover` não incluía
"Campbell"; corrigido removendo as 3 cópias antigas manualmente.

---

## 5. Fase 0 fechada, Fase 1 inteira e abertura da Fase 2 (09-13/08/2026)

*Registro tardio: este arquivo ficou parado entre 09 e 13/08 enquanto
`MEMORIA_PROJETO.md` era atualizado. O desvio foi detectado pelo proprio
rito de retomada em 13/08 — a secao 3-B lia daqui e por isso listava como
abertas pendencias ja resolvidas (heb.traineddata, Etapas 3 e 9). Serve de
lembrete: **os dois arquivos precisam ser atualizados juntos**, como o
`FASE_0_CHECKLIST` §Depois exige.*

### Fase 0 — fechada em 09/08/2026

- **Unidade 13 (justica social) excluida** por decisao do usuario. Nao foi
  omitida: sai **declarada como borda** no capitulo de sintese (U14). Motivo
  registrado: sem fonte primaria do adversario no corpus (Gutierrez, Boff,
  Sobrino, Assmann), o item (1) do padrao de cinco nao se cumpre. Projeto
  passa de 14 para **13 unidades ativas**.
- **Unidade 12 formalizada** como permanente (ja estava de fato na tabela).
- **`heb.traineddata` instalado** — baixado e copiado para
  `Program Files\Tesseract-OCR\tessdata\` pelo usuario (exigia admin).
  Confirmado por `tesseract --list-langs`. Anel 2 (U07-U10) liberado.
- **Etapa 3 (curadoria por tier) fechada** — as 82 fontes tieradas.
- **Etapa 4 (sentinelas) fechada** — as 4 ultimas (R7-R10) verificadas por
  consulta real. `verificar_sentinelas.ps1` retorna exit 0, 10 sentinelas.
  R9 migrou **com correcao**: o corpus nao sustenta "o mais antigo
  comentario latino a Romanos".

### Dois bugs reais corrigidos no `checagem_retomada.ps1`

1. **Contagem de fontes lia o notebook errado.** A linha 146 chamava
   `notebooklm source list --json` **sem `-n`**, apos um `notebooklm use`.
   Entre as duas chamadas, o estado global da CLI podia ser trocado por
   outra janela — e foi: o script reportou **109 fontes** (de outro
   projeto) quando o real era **82**. O numero errado chegou a ser gravado
   em `MEMORIA_PROJETO.md` e na curadoria antes de ser pego. Corrigido para
   `-n $Notebook` explicito. **Mesma classe do vazamento cruzado de
   05/08** — o estado global da CLI e a armadilha recorrente deste projeto.
2. **Parsing do `notebook_id` quebrado.** O parametro `$Notebook` lia o
   arquivo `projeto.config.txt` **inteiro** como string, em vez de extrair
   a linha `notebooklm_notebook_id=`. So apareceu quando o config ganhou
   linhas novas. Corrigido com filtro por regex.

### Rotulo JDD e mecanismos de controle (a pedido do usuario)

- `_scripts/trava_JDD.ps1` — trava de janela unica, por timeout (nao por
  PID: cada `powershell -File` e processo novo, checar PID invalidaria a
  trava na hora errada).
- `_scripts/hash_estado_notebook.py` — hash SHA-256 do conjunto
  id+titulo das fontes. Pega divergencia que contagem sozinha esconde
  (fonte trocada sem mudar o total).
- `_scripts/ping_notebooklm.ps1` — checagem barata de autenticacao,
  plugada no `SessionStart`. **Antes disso nao havia nenhuma checagem
  automatica de conexao** — so manual, sob demanda.
- `_scripts/ponto_de_retomada.py` — registra o ponto **exato** onde o
  trabalho parou (unidade, etapa, quais das 3 consultas rodaram, proxima
  acao). Integrado como secao 3-A do rito.

### Fase 1 — completa em 13/08/2026

Os 16 prompts + relatorio consolidado (`00_relatorio_fase1.md`), com
auditoria em 11 deles.

**Achado central, nao previsto na grade:** em cinco casos onde se pode
comparar, a caracterizacao que os criticos fazem do adversario **precisou
de correcao sempre que a fonte primaria existia** (Dunn no P10; Kasemann
duas vezes no P11; o proprio Irons no P13) e foi **inverificavel quando
faltava** (Sanders no P12; Osiander no P15). Deixou de ser cautela teorica
e virou dado empirico — e e o argumento mais forte a favor de comprar
Sanders.

**Licao de metodo (P13):** o RAG produziu **falso negativo** — negou que o
corpus datasse Ambrosiaster no sec. IV, quando Irons diz literalmente
"fourth century Latin writer" (linha 766). Conferencia em disco desfez o
erro em segundos. Regra pratica incorporada: **afirmacao de ausencia se
confere no disco antes de virar conclusao.**

**Achado do lote noturno:** o volume de **Filipenses de Gerald Hawthorne**
(Word Biblical Themes) estava **dentro** da coletanea
`WBTheme_Collection_15vol`, invisivel pelo nome do arquivo — a coletanea
estava marcada "a conferir" desde 04/08. Lacuna de Filipenses rebaixada de
total para **parcial**; Fee deixou de ser aquisicao bloqueante.

### Lista de aquisicao: de 4 para 6 itens

Acrescentados na Fase 1: **pseudepigrafes apocalipticos** (4 Esdras,
2 Baruc, 1 Enoque, Sl. Salomao — metade da lista-chave de Stuhlmacher e
inverificavel sem eles) e **Justification and Variegated Nomism**
(Carson/O'Brien/Seifrid, a resposta conservadora de referencia ao nomismo
pactual).

🔴 **Sanders: compra autorizada pelo usuario em 13/08.** Ao chegar,
destrava a U05 — a unica unidade travada do projeto.

### Fase 2 — aberta

- `fase2-capitulos/_MAPA_PRONTIDAO_FASE2.md` — triagem das 13 unidades:
  8 prontas, 4 com ressalva, 1 travada (U05, por dependencia de Sanders).
- **U01 (Rm 1.16-17) redigida.** Etapa 10.0 cumprida (todos os adversarios
  com obra propria, exceto Bultmann — limitacao declarada). As tres
  consultas rodadas. A auditoria corrigiu tres pontos, todos registrados
  no capitulo §9:
  1. "Paulo segue a LXX" em Hc 2.4 e **impreciso** — ele diverge de LXX
     (*mou*) e de TM (*emunato*), omitindo **ambos** os pronomes.
  2. O eco do Sl 98.2 foi atribuido a **Hays, que nao esta no corpus** —
     rebaixado a INFERENCIA PLAUSIVEL.
  3. A citacao de Schlatter e **autentica** — conferida no disco (linhas
     2085-2088 do alemao, com OCR corrompendo tokens). A auditoria ainda
     fortaleceu a objecao ao recuperar o ancoramento em ἐν αὐτῷ.

  **Precisao acrescentada por mim, nao pela consulta:** o argumento do
  silencio de Rm 11 (onde δικαιοσύνη nunca aparece) atinge **Wright**, que
  equaciona justica = fidelidade pactual — **nao atinge Kasemann**, que
  sustenta poder salvifico apocaliptico, tese diferente. Usa-lo contra
  Kasemann seria espantalho. Exigencia da Sentinela 3.

### 14/08/2026 — OCR de Fraktur: um falso negativo que quase virou "correcao"

Ao preparar a U12, fui reconferir no disco a citacao de Cremer usada no
Prompt 1 ("nicht ein negativer, sondern ein durchaus positiver"). O
`grep -i "positiv"` retornou **zero** nos dois arquivos de Cremer — e a
conclusao natural seria que a citacao fora alucinada e precisava ser
removida da Fase 1.

Era falso negativo. O texto e **Fraktur** (letra gotica do sec. XIX), e o
OCR le o **s longo (ſ)** como **f**:

    arquivo : "nicht ein negativer, jondern ein durchaus pofitiver"
    real    : "nicht ein negativer, sondern ein durchaus positiver"

A citacao esta na linha 1313 e e autentica. O contexto completo e mais
rico do que o citado: Cremer credita a intuicao a H. Schultz e define o
"positivo" como *der Schutz des Rechtes, und der Schutz derer, die im
Recht sind* — protecao de quem tem direito contra um mundo que o trata
como sem direitos.

**Corolario da licao do P13.** Aquela dizia: "afirmacao de ausencia se
confere no disco". Agora: **em texto Fraktur, o disco tambem mente se a
busca for ingenua.** Criado `_scripts/buscar_fraktur.py`, que tolera as
trocas medidas neste corpus (ſ->f, s->j, st->ft, ch->dh). Vale para
Cremer e Schlatter — os dois alemaes centrais do projeto.

Quase inverti a conclusao correta. O erro teria sido pior que o original:
remover uma citacao valida da fonte primaria do adversario enfraqueceria
justamente o item (1) do padrao de cinco.

### 15/08/2026 — busca por nome de arquivo engana: a terceira vez

Na Etapa 10.0 da U12 afirmei que o corpus **nao tinha comentario dedicado
de Apocalipse**, e cheguei a comunicar isso ao usuario como lacuna. Estava
**errado**. O *Gnomon* de Bengel cobre o NT inteiro, Apocalipse incluido —
229 ocorrencias de "Apocalyps*", com anotacao direta a Apoc. 20,1 (linha
66259). A auditoria da consulta 2 pegou o erro.

A causa: busquei **nome de arquivo** (`ls | grep -i revelation`), nao
conteudo. `Bengel_Gnomon_Novi_Testamenti_*.md` nao anuncia Apocalipse no
nome.

**Terceira ocorrencia do mesmo padrao neste projeto:**
1. 13/08 — o volume de **Filipenses de Hawthorne** estava dentro de
   `WBTheme_Collection_15vol`, invisivel pelo nome.
2. 14/08 — a citacao de **Cremer** parecia ausente porque o OCR Fraktur
   troca `s`->`f` (`pofitiver`).
3. 15/08 — **Apocalipse** dentro do Bengel.

**Regra pratica consolidada:** coletaneas e comentarios de NT inteiro
**escondem seu conteudo da busca por nome**. Antes de declarar lacuna,
buscar no CONTEUDO dos arquivos grandes — e, em textos antigos, com
tolerancia de OCR (`_scripts/buscar_fraktur.py`).

**Ressalva que permanece:** Bengel e latim do sec. XVIII com OCR
degradado. Cobre Apocalipse, mas nao substitui comentario critico
moderno. A lacuna nao e total — e de *qualidade e atualidade*, nao de
ausencia.

### 16/08/2026 — hebraico e grego como IMAGEM: uma limitacao nova do corpus

Na U04 a consulta declarou que "as fontes nao permitem afirmar" o que
Wenham diz sobre חשב em Gn 15.6. Conferencia em disco mostrou que Wenham
**trata a questao em profundidade** (linha 7286: von Rad, Lohfink,
Oeming, e o veredito proprio de Wenham).

**A causa e nova e vale para outros arquivos:** nos .md convertidos de
EPUB, as palavras em hebraico e grego foram preservadas como
**IMAGENS**, nao como texto:

    ![](images/hcp-wbc01epub-heb1404.jpg)

Medicao no corpus:

| Arquivo | Palavras-imagem |
|---|---|
| Wenham_Genesis_1-15_WBC.md | **1516** |
| Dunn_Romans_9-16_WBC38B.md | 86 |
| Dunn_Romans_1-8_WBC38A.md | 71 |

**Consequencias praticas:**
1. Nenhuma busca -- grep ou RAG -- encontra o hebraico/grego nesses tres
   arquivos. A discussao **em ingles** e recuperavel; a palavra original,
   nao.
2. E possivel usar o ARGUMENTO desses autores, mas **nao citar deles a
   forma hebraica ou grega**. Mesma restricao que o aviso de OCR impoe a
   outras obras, por causa diferente.
3. Atinge diretamente o Anel 2 -- a U07 (Tora) depende de Gn 15.6,
   Dt 6.25, 24.13 e 25.1, todos em Wenham.

**Quarto falso negativo do mesmo genero.** A serie agora e:
1. 13/08 — Filipenses (Hawthorne) dentro da coletanea WBTheme
2. 14/08 — Cremer "ausente" por OCR Fraktur (s longo lido como f)
3. 15/08 — Apocalipse dentro do Bengel
4. 16/08 — hebraico de Wenham como imagem

As causas sao diferentes, mas o efeito e o mesmo: **a busca diz que nao
existe, e existe.** Regra consolidada: antes de declarar ausencia,
conferir no disco por conteudo; e se o alvo for palavra em alfabeto
nao-latino, verificar se o arquivo nao a guarda como imagem.
