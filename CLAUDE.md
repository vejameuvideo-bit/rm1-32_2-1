# CLAUDE.md — Projeto Justica-de-Deus

> **Leia este arquivo inteiro antes de qualquer ação.** É o mapa de tudo.
> Gerado em 02/08/2026 pelo molde. Atualizar a cada ciclo de sessões.

---

## 0. TL;DR — Retomada em 90 segundos

> ### ⛔ REGRA ZERO, antes de qualquer redação
>
> **Jamais equiparar posição liberal ou progressista à conservadora.** Quando
> divergirem, a posição liberal/progressista é **objeção a ser refutada**, com
> base sólida, robusta e detalhada — nunca alternativa a ser registrada.
>
> **Detalhe e padrão de cinco itens: §2-B.** Se você está redigindo capítulo e
> não leu §2-B, leia agora.

> ### 🔁 DUPLA CHECAGEM ANTI-FALHA — regra fixa (22/08/2026)
>
> **Nenhuma afirmação de ausência vale com uma única verificação.** Toda vez
> que a conclusão for "não existe", "não está no corpus", "não há comentário
> de X", ou "é preciso comprar", conferir por **dois métodos independentes**
> antes de dizer ao usuário.
>
> Independentes de verdade — dois métodos que falhem por causas diferentes:
>
> | Método | O que ele NÃO enxerga |
> |---|---|
> | consulta RAG no notebook | o que o retrieval não alcançou |
> | `grep` no `.md` em disco | OCR corrompido; palavra como imagem |
> | `ls`/nome de arquivo | coletânea; comentário de NT inteiro |
> | `buscar_fraktur.py` | — (cobre o OCR gótico) |
> | `varredura_aquisicoes.py` | — (cobre original→md→notebook) |
>
> **Combinação mínima:** um método de conteúdo + um método de inventário.
> `ls` sozinho nunca basta. RAG sozinho nunca basta (Regra 11: a consulta
> confirma presença, **nunca** estabelece ausência).
>
> **Por que esta regra existe — oito falsos negativos, todos meus:**
> Hawthorne dentro de coletânea · Cremer em Fraktur (`positiv`→`pofitiv`) ·
> Apocalipse dentro do Bengel · hebraico e grego como imagem ·
> Sanders na pasta de outro projeto · `heb.traineddata` "não instalado" ·
> as 5 unidades "vazias" que tinham comentário · Goldingay Sl 1-89 na
> biblioteca, nunca convertido.
>
> Em dois desses casos eu **recomendei compra** de obra que o usuário já
> tinha. **A dupla checagem é obrigatória antes de qualquer recomendação de
> aquisição.**

> ### 🔒 FRONTEIRA JDD — rótulo e clausura (definida em 22/08/2026)
>
> **Rótulo do projeto: `JDD`.** A pasta deste projeto é **fechada nos dois
> sentidos**:
>
> 1. **Não sai.** Nenhum script, busca, conversão ou upload deste projeto
>    pode ler pasta fora de `C:\Users\admintrt9a\Projetos\Justica-de-Deus`.
>    Nada de `find` na raiz do usuário, nada de varrer projetos irmãos.
>    **Toda obra que o JDD usar tem de estar dentro de `biblioteca\`.**
> 2. **Não entra.** Nenhum projeto externo lê ou escreve aqui. Os **15
>    notebooks** do JDD (ver §1) são exclusivos do projeto e só alterados
>    por uma janela por vez (`_scripts/trava_JDD.ps1`).
>
> **Como trazer uma obra de fora:** copiar o arquivo para `biblioteca\`
> **primeiro**, e só então processá-lo. A cópia é o ato de entrada; depois
> dela, a obra é do JDD e a origem deixa de importar.
>
> **Verificação:** `_scripts/verificar_fronteira.ps1`.
> **Por que existe:** ver `_artifacts/DESBLOQUEIO_U05_SANDERS.md` §1 — em
> 22/08 uma obra do JDD estava fora da pasta, e a busca não a viu.

**Projeto:** pesquisa exegética da **Justiça de Deus** — δικαιοσύνη θεοῦ / צדקת אל —
**tema transversal ao cânon**, em três fases, com **14 unidades temáticas**.
**Rótulo:** `JDD` — **pasta fechada, ver quadro acima**
**Pasta:** `C:\Users\admintrt9a\Projetos\Justica-de-Deus`
**Biblioteca:** `biblioteca\` — **única origem legítima de fontes**
**Idiomas originais:** **grego e hebraico** (o molde assume um; aqui são dois)

> ⚠️ **Este projeto não é de um livro.** O molde é por livro; a adaptação está
> documentada em `ESCOPO_JUSTICA_DE_DEUS.md` §6. Onde os documentos herdados
> disserem "capítulo", leia **unidade**. A pasta `fase2-capitulos\` **manteve o
> nome de propósito**: os hooks são agnósticos (casam só `/saidas/`), mas o
> `.claude\settings.json` fixa `fase2-capitulos/*/…` no allowlist de escrita —
> renomear não quebra a trava de sentinela, **quebra a permissão**.

> 🟡 **`heb.traineddata` — o aviso anterior estava ERRADO (corrigido em 22/08).**
> Este quadro dizia em vermelho que o arquivo "NÃO está instalado nesta máquina".
> Ele **existe**, e agora está dentro do projeto: `_tessdata\heb.traineddata`
> (5,4 MB), junto com `grc`, `lat`, `deu`, `fra` e `Fraktur` — internalizados
> pela FRONTEIRA JDD. Foi o sexto falso negativo do projeto, e da mesma família
> dos outros: **procurei no lugar errado e concluí ausência**.
>
> ⚠️ **O risco descrito continua real, e é outro:** o tesseract emite
> `Failed loading language` em **stderr e segue sem o idioma**, produzindo
> hebraico por aproximação — falha silenciosa. Passar `--tessdata-dir _tessdata`
> e **conferir o stderr**, nunca só o código de saída.
>
> 🔎 **Pendente de verificação:** o Anel 2 (Unidades 07–10) depende de hebraico.
> Não há evidência de que material já convertido tenha nascido corrompido — mas
> também não foi conferido. Checar antes de escrever a U07.

**Escopo e delimitação:** `ESCOPO_JUSTICA_DE_DEUS.md` — os círculos concêntricos,
os cinco eixos de decisão e a grade das 14 unidades.
**Pauta de aquisição e Deep Research:** `PAUTA_DR_NOMES_COLHIDOS.md`.

**Comece sempre por:**
```powershell
cd C:\Users\admintrt9a\Projetos\Justica-de-Deus
powershell -ExecutionPolicy Bypass -File _scripts\checagem_retomada.ps1
```

---

## 1. ARQUITETURA

| Fase | Escopo | Notebooks | Entregável |
|---|---|---|---|
| **1** | Fundamentos lexicais, sintáticos, Segundo Templo, história da interpretação | 1 notebook | 16 saídas + relatório |
| **2** | Exegese **unidade a unidade** (14) | 1 por unidade | 1 relatório por unidade |
| **3** | Síntese geral | 1 notebook | Relatório completo |

**Total: 15 notebooks reais** — 1 (introdução) + 13 (unidades ativas,
U13 excluída) + 1 (síntese). Restaurado em 22/08/2026 após rodar com 1
único notebook por inércia, sem decisão explicita, por quase 3 semanas.
Ver `_artifacts/ARQUITETURA_16_CADERNOS.md`. IDs em `projeto.config.txt`
e `_artifacts/notebooks_por_unidade.json`.

### As 14 unidades

**Anel 1 — núcleo paulino:** U01 Rm 1.16-17 · U02 Rm 1.18–3.20 · U03 Rm 3.21-26 ·
U04 Rm 3.27–4.25 · U05 Rm 9.30–10.13 · U06 Gl/Fp/2Co
**Anel 2 — raiz vetero-testamentária:** U07 Torá · U08 Salmos · U09 Is 40–66 ·
U10 Profetas e Sabedoria
**Anel 3 — bordas declaradas:** U11 justiça como conduta (Mt/Tg) · U12 justiça
retributiva e juízo · U13 justiça de Deus e justiça social · U14 síntese sistemática

⚠️ **Borda declarada não é borda ignorada.** Cada exclusão do §3 do ESCOPO entra
no relatório **nomeada, com a razão** — o equivalente temático de harmonizar em
silêncio é **excluir em silêncio**.

**O notebook de síntese não recebe os PDFs.** Recebe os relatórios já auditados.
Porque (a) os rótulos de certeza sobrevivem, (b) com ~20 fontes curtas o
retrieval alcança tudo, (c) é onde a coerência transversal aparece.

**Regra:** o notebook de síntese **não decide questões novas**. Detecta
contradições e as devolve ao capítulo de origem.

---

## 2. ESTRUTURA DE PASTAS

```
Justica-de-Deus/
├── CLAUDE.md                        ← este arquivo
├── MEMORIA_PROJETO.md               ← estado e próxima ação
├── REGRAS_RETOMADA.md               ← diretrizes, regras, EXCEÇÕES
├── LACUNAS_REFUTACAO.md             ← pauta de refutação
├── CURADORIA_FONTES_JUSTICA-DE-DEUS.md
├── FASE_0_CHECKLIST.md              ← do zero ao primeiro capítulo
├── ANATOMIA_DO_PROJETO.md           ← o método e o que ele custou
├── _LOG_EXECUCAO.md                 ← histórico técnico
│
├── _artifacts/
│   ├── sistema_erudito.md           ← protocolo anti-alucinação
│   ├── sentinelas_JD.md      ← 🚩 armadilhas factuais — PREENCHER
│   ├── escala_certeza.md            ← os 6 níveis
│   └── persona_notebooklm.txt
│
├── _scripts/                        ← automação (ver §5)
├── _triagem_dr/                     ← kit R1–R4 + N1
├── biblioteca/                      ← PDFs
├── _fora_do_notebook/               ← Tier D, duplicatas, experimentos
├── _processados_md/                 ← saídas convertidas
├── _versionamento/                  ← snapshots
│
├── fase1-introducao/
│   ├── prompts_JD.md
│   └── saidas/                      ← 01..16 + relatório
└── fase2-capitulos/
    └── _TEMPLATE/
```

---

## 2-B. LINHA EDITORIAL

O relatório é **obra confessional de nível acadêmico**, no registro de Carson,
Köstenberger, Morris e Bruce. Não é exposição neutra.

### A regra do desnível (não negociável)

**Jamais equiparar argumento teológico conservador e progressista.** Quando
divergirem, a posição progressista é objeção a ser **respondida**.

O alcance é amplo: hermenêutica feminista e de gênero, leituras pós-coloniais,
libertação em chave marxista, revisionismo sexual, desconstrução
pós-estruturalista. **Nenhuma entra como "perspectiva complementar".**

### O padrão da refutação: cinco itens

| # | Exigência | O que reprova |
|---|---|---|
| 1 | **Fonte primária citada**, localizável | resumo secundário |
| 2 | **A melhor versão** do argumento adversário | espantalho |
| 3 | **Ataque ao pressuposto** | responder só a conclusão |
| 4 | **Ancoragem tripla:** texto · recepção · consenso conservador | só autoridade |
| 5 | **Desfecho explícito** | terminar em "há debate" |

**Detalhe é obrigação, não ornamento.** Sem espaço para os cinco itens, não se
abre a objeção.

**As exceções estão em `REGRAS_RETOMADA.md` §4** — leia antes de refutar um
aliado por engano.

### Deep Research: pauta obrigatória de refutação

Toda Deep Research busca **os dois lados**. Cada uma abre com: *quais objeções
progressistas este texto atrai?*

Se a resposta não existir na literatura, **declarar a lacuna** — nunca preenchê-la.

**Pauta corrente:** `LACUNAS_REFUTACAO.md`.

### Escolas a percorrer

| Escola | Cobertura | Fontes |
|---|---|---|
| Patrística | | |
| Reformada | | |
| Puritana | | |
| Pietista | | |
| Wesleyana | | |
| Pentecostal | | |

⚠️ **Presença da fonte não é cobertura do tema.** Onde a fonte existe mas cala,
**declarar o silêncio** — não reconstruir a tradição de memória.

---

## 3. PROTOCOLO DE SESSÃO

**Início:** `checagem_retomada.ps1` → ler o relatório → confirmar auth e fontes `ready`.

**Durante:**
- **Máximo 4 prompts exegéticos por sessão.**
- **NUNCA** `notebooklm ask > arquivo.md`. Sempre redigir e usar a Write tool.
- **Três consultas por capítulo:** exegética · verificação · refutação dirigida.
  A **verificação audita a consulta anterior**, não só busca o contraditório.
- **Antes de qualquer consulta ao RAG:** `python _scripts\dossie.py "termo" --listar`.
  Custa zero e diz se a obra sequer trata do assunto.
- Rótulos obrigatórios em toda afirmação.
- Verificar as sentinelas de `_artifacts/sentinelas_JD.md`.

**Fim:** atualizar `MEMORIA_PROJETO.md` (seção "Próxima ação") e `_LOG_EXECUCAO.md`;
rodar o backup. **A cada sessão que muda o estado** — não só quando alguém notar
o atraso. Um rito de retomada só serve se alguém mantiver o arquivo que ele lê.

---

## 3-B. AS REGRAS QUE CUSTARAM CARO

*Todas nasceram de erro medido no projeto de origem. Nenhuma é teórica.*

**Regra 11 — 🔑 RAG para descobrir, disco para conferir.**
Se a obra existe como `.md` no acervo, **ler o arquivo** (`dossie.py`, `trecho.py`,
`grep`) em vez de perguntar ao notebook. O RAG produz **falso negativo
indistinguível de ausência**: uma consulta estreita a uma obra certa, com nome
certo, sobre uma passagem que ela comenta em três páginas, respondeu `NAO TRATA`.
**Nenhuma lacuna se declara sem procurar o arquivo localmente.**
→ *A verificação confirma presença; nunca estabelece ausência.*

**Regra 11-B — se o conversor padrão embaralhar o texto, usar `pdftotext_para_md.py`.**
O PyMuPDF intercala corpo e nota de rodapé **caractere a caractere** em PDFs com
nota em coluna estreita. Sintoma: caracteres alternando entre duas frases legíveis.
E **para interromper um lote, matar o processo do script**, não os `python` filhos
— o laço continua e sobrescreve o trabalho refeito.

**Regra 11-C — ⛔ nunca imputar VÍCIO DE MÉTODO sem ler a passagem inteira em
fonte primária.** Espantalho, polêmica desleal, apropriação indevida. O RAG entrega
a crítica de um autor **sem as concessões que a acompanham**, e é nas concessões
que se vê se a crítica é justa. *Atribuição de tese errada corrige-se com nota;
atribuição de má-fé é outra ordem de dano, e recai sobre quem a faz.*

**Regra 11-D — ⛔ `CREATE_ARTIFACT timeout` é FALSO NEGATIVO.**
No `generate audio`, *"Network error: Request timed out calling CREATE_ARTIFACT"*
**não significa que o artefato não foi criado** — só a resposta do RPC estoura aos
30 s. **NÃO repetir o comando** (duplica). Fazer `artifact list`, depois
`artifact wait <id>`. `artifact poll` é checagem única e não aceita `--timeout`.
Idioma é **`pt_BR`**, com underscore.

**Regra 12 — ⚠️ o nome do arquivo não é evidência de autoria.**
Conferir o `autor:` do frontmatter **e** a página de créditos antes de citar. No
projeto de origem, um PDF distribuído com o nome de outro autor produziu **16
atribuições falsas em 4 capítulos**, duas delas contando um só testemunho duas
vezes. Hierarquia de evidência: ficha catalográfica (número Cutter) → autor citado
em 3ª pessoa no próprio texto → créditos → estrutura da edição → extensão →
frontmatter → ~~nome do arquivo~~.
E há uma **segunda face**: frontmatter com placeholder (`Usuario`, `Unknown`).
Para volumes de série, **conferir pelo miolo, não pelo sufixo `_v2`**.

**Regra 13 — inspecionar antes de decidir OCR.**
`FONTE SEM ToUnicode` **sozinho não manda usar OCR**. Extrair uma página do
**miolo** (pp. 40-60, não as primeiras) com `pdftotext` e olhar decide em trinta
segundos; o erro contrário custa horas **e degrada texto correto**. No projeto de
origem, BP-05 contrariou o diagnóstico automático **6 vezes em 6 aplicações**.
Três causas hoje confundidas sob "precisa de OCR":

| Causa | Sintoma | Decisão |
|---|---|---|
| Sem camada de texto | `pdftotext` devolve vazio | OCR |
| `sem ToUnicode` | prosa perfeita, **só** o grego como sósia latino | **medir os dois caminhos** |
| Política editorial | a obra translitera; não há grego a recuperar | nativo + aviso |

---

## 4. SENTINELAS FACTUAIS

Ver `_artifacts/sentinelas_JD.md`.

🚩 **Enquanto aquele arquivo estiver vazio, nenhuma unidade pode ser redigida.**

**Estado em 02/08/2026: VAZIO (exit 2) — a trava está ativa, e é intencional.**

Há **10 rascunhos** (R1–R10) no arquivo, redigidos a partir de conhecimento prévio
do tema, **sem consulta ao notebook**. Eles ficam **fora** da tabela contada,
porque preenchê-la com material não verificado faria o script reportar `PRONTO` e
o `PreToolUse` calar — uma **luz verde falsa**, que é pior do que a trava.

**Migrar um rascunho para a tabela é o ato de dar por verificado.** Um por vez,
depois da consulta de verificação.

⚠️ **A Regra 11 vale aqui:** a consulta **confirma presença, nunca estabelece
ausência**. Rascunho que a consulta não contradisser **não está verificado** —
está apenas não-refutado.

**Oitava fonte de erro, própria deste projeto:** *atribuição de posição a autor*.
Num tema definido pela história do seu próprio debate, confundir quem disse o quê
é o erro checável mais fácil de cometer — e reincide sobre o item (2), porque
atribuir a um autor a tese de outro é espantalho ainda que sem intenção.
R3, R4, R9 e R10 são dessa classe.

---

## 5. SCRIPTS

### Camada local — rodar ANTES de gastar crédito

| Script | O que faz |
|---|---|
| `dossie.py` | 🔑 varre o acervo por termo e emite dossiê pequeno, com autor, **página impressa** e faixa de OCR. `--listar` só conta, **custo zero** |
| `paginacao.py` | converte marcador de PDF em **página impressa**, calibrando o offset por obra |
| `trecho.py` | extrai um intervalo de páginas impressas de uma obra |
| `conferir_citacoes.py` | audita toda citação `Autor, p. N` dos capítulos **contra o disco** |
| `varredura_acervo.py` | quais obras do acervo **nunca foram citadas** |

⚠️ **O marcador `<!-- Página N -->` conta páginas do PDF, incluindo preliminares —
não é a página impressa.** O offset é fixo por obra e **negativo** (medido: −15,
−18, −20, −49). Quando a obra não calibra, os scripts escrevem *"marcador"*, nunca
*"p."*: **preferimos admitir que não sabemos a fabricar uma equivalência.**

### Conversão e notebook

| Script | O que faz |
|---|---|
| `checagem_retomada.ps1` | consistência + relatório + regras |
| `checar_ambiente.ps1` | diagnóstico do ambiente (só leitura) |
| `converter_lote.ps1` | OCR em lote a partir do CSV |
| `fila_conversao.ps1` | encadeia conversões longas, com travas por etapa |
| `pdftotext_para_md.py` | conversor alternativo — **Regra 11-B** |
| `dividir_md.py` | divide `.md` pronto **sem refazer OCR** |
| `subir_reocr.ps1` | sobe/remove fontes — **sempre `-Simular` antes** |
| `triagem_dr.ps1` | kit de triagem R1–R4 + N1 |
| `backup_versionamento.ps1` | snapshot repetível (inclui `_artifacts/`) |

**Paralelismo:** o `fila_conversao.ps1` é **seguro em várias janelas** — travas por
etapa, com detecção de trava órfã. Ganho medido: 1.621 páginas em ~1h20 contra
~2h50 em série. **Mas medir antes:** conversão **nativa** custa minutos (13 obras
em 10,7 min), OCR custa horas. Paralelizar só compensa com **≥5 obras de OCR
confirmado** — contar obras não é estimar custo quando elas diferem em ordem de
grandeza.

---

## 6. NOTEBOOKS

| Notebook | ID | Status | Fontes |
|---|---|---|---|
| Justica de Deus | `d878e2b0-e950-4ee1-b78c-ce0fb8152a0b` | ✅ montado (05/08/2026) | 26, todas `ready` |
| Justica-de-Deus - U01…U14 | *(criar, se o recorte por unidade for adotado)* | ⬜ | |
| Justica-de-Deus - Sintese | *(criar ao fim)* | ⬜ | |

### Uma conta, dois papéis

**`alessandroinstitutoreformadosp@gmail.com`**, com assinatura **AI Pro**:

| Papel | Plataforma | Como |
|---|---|---|
| Backup e versionamento | Google Drive | `_scripts\backup_remoto.ps1` (rclone, remote `jdd`) |
| Base de pesquisa | NotebookLM | 16 notebooks, `perfil.config.txt` |

⚠️ **Como é a mesma conta, o escopo `drive.file` do rclone é REQUISITO, não
preferência** — com ele o rclone só enxerga o que ele mesmo criou e **não pode
tocar nas fontes dos notebooks**. Com escopo `drive` completo, poderia.

⚠️ **Os tetos do plano Pro devem ser MEDIDOS, não supostos.** O molde já pagou
por isso: o teto de palavras por fonte estava documentado como 450 mil, e o
medido ficou entre **461.813 (passa)** e **540.267 (falha)** — o número redondo
de precaução gerava alarme falso sobre obra que já havia subido. Medir antes de
dimensionar as 16 unidades.

⛔ **Há outras duas contas Google montadas nesta máquina:** `G:` é
`alessandrosouza@trt9.jus.br` (**institucional**) e `H:` é
`alessandronuvemti@gmail.com`. **Nenhuma das duas é destino de backup.** O
`backup_remoto.ps1` aborta se `rclone config userinfo` não bater com a conta
esperada.

### 🔴 Perfil da CLI — medido em 02/08/2026

**Conta:** `alessandroinstitutoreformadosp@gmail.com`
**Perfil a usar:** `default` — gravado em `perfil.config.txt`

⚠️ **A conta mapeia para DOIS perfis, e um deles está quebrado:**

| Perfil | `profile list` diz | `auth check --test` diz |
|---|---|---|
| `institutoreformadosp` | authenticated | ❌ **Token fetch fail — expirado** |
| `default` | authenticated | ✅ **válido** |

> **A advertência do §6 sobre `profile list` mentir foi confirmada nesta máquina.**
> O nome do perfil sugeria `institutoreformadosp`; naquele momento só `default`
> passava. **Só `auth check --test` decide.**

🔴 **CORREÇÃO medida ~20 min depois, na mesma sessão:** `nuvemti`, que havia
**falhado**, passou a **VÁLIDA** — sem nenhum `login`. Os três perfis testados
passaram.

> **A conclusão que sobrevive não é qual perfil está bom — é que o estado de
> autenticação é VOLÁTIL.** Uma medição de auth vale para o instante em que foi
> feita. **Re-rodar `auth check --test` a cada sessão**, que é justamente o que o
> rito de retomada faz. Não confiar em nota de sessão anterior, inclusive esta.

🔴 **O perfil global ativo é `nuvemti`, e ele TAMBÉM está expirado.**
`~/.notebooklm/config.json` traz `"default_profile": "nuvemti"` e é **compartilhado
entre todas as janelas**.

🔴 **Os scripts deste projeto chamam `notebooklm` sem `-p`.** Portanto seguem o
perfil global — hoje `nuvemti`, expirado — e **ignoram** o `perfil.config.txt`.
Enquanto isso não for corrigido, todo comando roda contra a conta errada.

**NÃO trocar o perfil global para "consertar"** — isso quebra as sessões
paralelas dos outros projetos. A correção é passar `-p default` em cada comando:

```powershell
notebooklm -p default auth check --test
notebooklm -p default -n <ID> source list
```

⚠️ **`projeto.config.txt` continua vazio, e deve continuar** — ele guarda o **ID
do notebook**, não a conta. Gravar um e-mail ali faria `notebooklm use <e-mail>`
**não falhar**, mantendo o notebook corrente de outro projeto: é a armadilha 2 do
molde, e remoção de fonte não tem desfazer.

**Teto de palavras por fonte** (medido, não documentado): falha em **540.267**,
passa em **461.813**. Corte de trabalho: **500 mil** — acima, `dividir_md.py`.

⚠️ *O corte era 450 mil e foi subido. A 450 mil o alerta acusava uma obra de
461.813 palavras **que já havia subido com sucesso** — alarme falso ensina a
ignorar o alarme. Calibrar limite **entre o maior aprovado e o menor reprovado**,
não por número redondo de precaução.*

**Antes de reenviar obra já no notebook**, medir se há ganho real. "Foi re-OCR'd"
não é motivo suficiente.

**Injetar o aviso de limitação, depois dividir — nesta ordem.** Se dividir
primeiro, a parte 2 sai sem aviso. E o aviso vai **no corpo do `.md`**, não em
metadado: assim o RAG o recupera junto com o trecho.

⚠️ **`-p <perfil>` e `-n <id>` explícitos em TODO comando.** Perfil e notebook
corrente vivem em `~/.notebooklm/config.json`, **compartilhado entre todas as
janelas** — outra sessão os troca. `-p` é opção global: vem **antes** do
subcomando. E **não trocar o perfil global para "consertar"**: isso quebra a
sessão paralela. `profile list` pode dizer "authenticated" com o token vencido —
só `auth check --test` confirma.

---

## 7. PRÓXIMA AÇÃO

Ver `FASE_0_CHECKLIST.md` e `MEMORIA_PROJETO.md`.

---

*Este arquivo substitui qualquer chat anterior como fonte de verdade.*
