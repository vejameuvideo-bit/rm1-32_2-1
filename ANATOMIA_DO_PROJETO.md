# Anatomia de um projeto de pesquisa exegética

*Inventário e análise do projeto João-Pesquisa, levantado em 27/07/2026 contra o
estado real dos arquivos — não de memória.*

Este documento existe por duas razões. A primeira é registrar o que foi
construído, para que não se perca. A segunda é maior: **separar o que é
específico de João do que é o método**, para que o método possa ser aplicado a
qualquer livro bíblico. O molde ao lado (`novo_projeto.ps1`) é a execução dessa
separação.

---

# PARTE I — O QUE FOI CONSTRUÍDO

## 1. A arquitetura em três fases

| Fase | Escopo | Notebooks | Entregável |
|---|---|---|---|
| **1** | Questões introdutórias — autoria, data, gênero, teologia, recepção | 1 notebook | 16 capítulos + relatório de introdução |
| **2** | Exegese capítulo a capítulo | 1 por capítulo do livro | 1 relatório por capítulo |
| **3** | Síntese geral | 1 notebook | Relatório completo + podcast |

**A decisão não óbvia, e ela é boa:** o notebook de síntese **não recebe os PDFs**.
Recebe os relatórios já auditados. Três razões, todas verificadas na prática:

1. **Os rótulos sobrevivem.** Cada relatório traz `[FATO TEXTUAL]`,
   `[HIPÓTESE DEBATIDA]` e a tabela de certeza. Perguntar sobre eles preserva a
   classificação; perguntar sobre os PDFs a refaz do zero e pode contradizer o
   que já foi auditado.
2. **O retrieval enxerga tudo.** Com ~22 fontes curtas, uma consulta alcança o
   corpus inteiro. Com 200 PDFs, o RAG toca poucas por consulta.
3. **É onde a coerência transversal aparece.** "Onde *egō eimi* foi tratado e os
   capítulos concordam?" só é respondível contra os relatórios.

**Regra decorrente:** o notebook de síntese **não decide questões novas**. Ele
detecta contradições e as devolve ao capítulo de origem.

## 2. O pipeline de fontes — cinco estágios

```
biblioteca/ (PDFs brutos)
    │
    ├─[1] DIAGNÓSTICO ──────► diagnosticar_pdf.py
    │       classifica: PDF são · scan · fonte sem ToUnicode · fonte Symbol
    │
    ├─[2] CURADORIA ────────► CURADORIA_FONTES.md (tiers S/A1/A2/B/C/D)
    │       Tier D e duplicatas saem para _fora_do_notebook/
    │
    ├─[3] CONVERSÃO ────────► pdf_to_md.py --ocr --grego
    │       em lote, via converter_lote.ps1 + lotes_ocr.csv
    │
    ├─[4] MEDIÇÃO ──────────► densidade + pureza do alfabeto original
    │       injetar_aviso.py escreve o aviso NO CABEÇALHO do .md
    │
    └─[5] UPLOAD ───────────► subir_reocr.ps1 (sempre -Simular antes)
```

**O estágio 4 é a invenção mais importante deste projeto.** O aviso de limitação
vai **dentro do arquivo**, no cabeçalho, para que o RAG o recupere *junto com o
trecho*. Um aviso guardado em outro lugar não chega ao modelo na hora em que ele
responde.

## 3. Inventário de arquivos

### 3.1 Documentos de governo (raiz)

| Arquivo | Função | Agnóstico? |
|---|---|---|
| `CLAUDE.md` | Mapa de tudo; carregado pelo Claude Code | estrutura sim, conteúdo não |
| `MEMORIA_PROJETO.md` | Estado, notebooks, próxima ação | estrutura sim |
| `REGRAS_RETOMADA.md` | Diretrizes, regras obrigatórias, **exceções** | **quase todo sim** |
| `LACUNAS_REFUTACAO.md` | Pauta de refutação e desequilíbrio do corpus | estrutura sim |
| `PLANO_<LIVRO>.md` | Plano completo de referência | não |
| `CURADORIA_FONTES_<LIVRO>.md` | Ranking e tiers da biblioteca | não |
| `_LOG_EXECUCAO.md` | Histórico técnico, armadilhas medidas, decisões | não |
| `TRIAGEM_BIBLIOTECA.md` · `AQUISICOES_ESCOLAS.md` | Triagem e compras | não |

### 3.2 `_artifacts/` — o núcleo reaproveitável

| Arquivo | Função | Agnóstico? |
|---|---|---|
| `sistema_erudito.md` | Prompt de sistema anti-alucinação | **sim**, menos o bloco de sentinelas |
| `escala_certeza.md` | Os 6 níveis + estado do consenso | **sim, integralmente** |
| `persona_notebooklm.txt` | Persona aplicada a todo notebook | **sim** |
| `sentinelas_<livro>.md` | Armadilhas factuais do livro | **não — é o que mais dá trabalho** |

### 3.3 `_scripts/` — 14 arquivos

| Script | O que faz | Agnóstico? |
|---|---|---|
| `checar_ambiente.ps1` | Diagnóstico do ambiente (só leitura) | sim |
| `montar_notebook_fase1.ps1` | Cria o notebook da Fase 1 | parametrizável |
| `montar_notebook_capitulo.ps1` | Cria notebook de capítulo | parametrizável |
| `converter_lote.ps1` | OCR em lote a partir de CSV | **sim** |
| `fila_conversao.ps1` | Encadeia conversões longas, com travas | **sim** |
| `dividir_md.py` | Divide `.md` pronto sem refazer OCR | **sim** |
| `subir_reocr.ps1` | Sobe/remove fontes, com `-Simular` | **sim** (ID parametrizado) |
| `triagem_dr.ps1` | Kit de triagem R1–R4 + N1 | **sim** |
| `backup_versionamento.ps1` | Snapshot repetível | **sim** |
| `checagem_retomada.ps1` | Consistência + relatório de retomada | **sim** |
| `corrigir_faltas_notebook.ps1` | Reenvia fontes que falharam | sim |
| `lotes_ocr.csv` | Manifesto das conversões | estrutura sim |

### 3.3-B Os avisos automáticos (`.claude/settings.json` + 3 scripts)

O molde não pode gerar as sentinelas — mas **cobra-as sozinho**. Três hooks que
**medem antes de falar**:

| Gatilho | Hook | Comportamento |
|---|---|---|
| Abrir a sessão | `SessionStart` | imprime o estado das sentinelas |
| **Escrever em `saidas/`** | `PreToolUse` (Write\|Edit) | **vazio → bloqueia (exit 2)** · incompleto → passa com aviso · pronto → **silêncio** |
| Fim de sessão | `Stop` | lista as saídas do dia e cobra o checkpoint factual |

`verificar_sentinelas.ps1` conta as sentinelas e devolve o estado por código de
saída: `0` pronto · `1` incompleto · `2` vazio · `3` ausente.

**Três decisões de desenho, e cada uma tem razão:**

1. **O gatilho principal é no `PreToolUse`, não na abertura.** Aviso no início da
   sessão é esquecido até a hora de escrever; aviso no fim chega depois do erro.
   O único momento em que importa é quando o capítulo está prestes a existir.
2. **Silêncio quando está tudo certo.** O `Stop` hook original repetia o mesmo
   texto sempre, inclusive sem nada a fazer — é assim que se ensina alguém a
   ignorar um aviso.
3. **Bloqueia só no estado VAZIO.** Escrever com zero sentinelas é o erro a
   impedir; escrever com 4 de 6 merece empurrão, não trava.

### 3.4 Skills do projeto (`.claude/skills/`)

`exegese-<abrev>.md` · `deep-research-<abrev>.md` · `sintese-capitulo.md` ·
`montar-notebook-pro.md` — todas com estrutura reaproveitável.

### 3.5 Kit de triagem (`_triagem_dr/`)

`GUIA_TRIAGEM_DR_PRO.md` + prompts `R1_inventario`, `R2_conflitos`,
`R3_centralidade`, `R4_lacunas`, `N1_notas`. **Integralmente agnóstico.**

---

# PARTE II — O CONHECIMENTO ADQUIRIDO

Esta é a parte que não se deduz da estrutura. São coisas que **custaram tempo de
CPU e erro** para descobrir.

## 4. Sobre OCR e qualidade de fonte

### 4.1 A métrica de pureza — e por que a densidade sozinha engana

**Densidade** = ocorrências do alfabeto original por 10 mil palavras.
**Pureza** = % das ocorrências que batem com um léxico de alta frequência.

O modelo `grc` do Tesseract **dispara sobre texto latino** e produz grego falso.
Uma obra pode ter densidade alta e ser lixo. Faixas medidas no corpus de João:

| Obra | Pureza | Leitura |
|---|---:|---|
| Klink | 42,6% | grego limpo, pouco frequente |
| Schnackenburg | 36,7% | boa |
| Barrett | 31,3% | boa |
| Owen | 28,4% | boa |
| *faixa normal* | ~20% | — |
| Crisóstomo | 4,8% | **ruído puro** |

⚠️ **A pureza precisa de piso amostral.** Com 3 ocorrências, "0% real" não
significa nada. Um falso positivo com Lloyd-Jones ensinou isso. Piso adotado: **n ≥ 30**.

### 4.2 "Run" não é palavra

Regex: `[\u0370-\u03FF\u1F00-\u1FFF]{2,}` — dois ou mais caracteres contíguos do
alfabeto. Lixo de OCR pode gerar uma única sequência de 50 caracteres.

### 4.3 O modo `--grego` injeta hebraico, e não há como desligar

`--grego` ativa OCR com `grc+heb`. O modelo hebraico dispara sobre texto inglês e
produz letras hebraicas inexistentes.

**Hipótese testada e refutada (27/07):** passar `--lang eng+grc` explicitamente
**não** resolve — o `heb` entra pela **detecção de fonte grega dentro do
conversor**, não pela flag. Medido nas páginas 100–112 do Klink: o hebraico
espúrio *subiu* de 2 para 8. Corrigir exige mexer no conversor.

O ruído é pequeno (8 fragmentos em 6.233 palavras) e o aviso de limitação já
cobre. Não é bloqueante.

### 4.4 DPI: mais nem sempre é melhor, e só se testa pelo caminho de produção

**Erro cometido, ~5h de CPU:** testar DPI com `pdftoppm` + `tesseract` cru, em 2
páginas. A produção roda `pdf_to_md.py` **com pré-processamento** (binarização,
deskew), o que muda tudo.

Resultado real, pelo caminho de produção: **Hutcheson a 500 dpi ficou PIOR** que
a 300 — 231 contra 299 palavras gregas reais, pureza 14,9% contra 17,0%.

**Regra:** testar DPI sempre por `pdf_to_md.py --paginas`, em dezenas de páginas.

### 4.5 A velocidade do OCR é dirigida por palavras/página, não por KB/página

Champlin 1.744 pal/pág → 16,4 s/pág. Bultmann 596 pal/pág → 4,1 s/pág. **KB/página
quase idêntico** (74 vs 76). O modelo de KB/página que usei antes estava errado.

### 4.6 O gargalo é serialização, não energia

Forçar `PROCTHROTTLEMIN 100` não mudou nada: ~25% de 12 núcleos lógicos antes e
depois. A conversão renderiza uma página, chama o tesseract, próxima — **nunca
passa de ~3 núcleos. Nove ficam ociosos.**

**Consequência prática comprovada (27/07):** rodar **dois streams em paralelo**
converteu 1.621 páginas em ~1h20 de relógio, contra ~2h50 em série.

### 4.7 A falha silenciosa — o padrão mais perigoso

Um PDF pode ter camada de texto **limpa e fluente em inglês** e **zero caracteres
do alfabeto original**. Dois casos medidos:

| Obra | Palavras | Grego |
|---|---:|---:|
| Harris, *EGGNT* | 148.958 | **0** |
| Bauckham, *Jesus and the Eyewitnesses* | 221.279 | **0** |

No Harris, a frase saía assim: *"John's use of the masc. **, rather than the
neut. ** (referring to ** ), shows..."* — as palavras gregas **apagadas sem
rastro**, a frase gramaticalmente inteira.

**Por que é pior que ruído:** o RAG devolve prosa fluente e o modelo responde com
confiança sobre uma análise gramatical de onde a gramática foi removida. Ruído de
OCR se anuncia; o buraco não.

⚠️ **O `diagnosticar_pdf.py` NÃO pega isso.** Ele classificou o Bauckham como
"PDF são — conversão normal, sem `--ocr`". Ele *reporta* "alfabetos não-latinos:
NENHUM", mas trata como observação neutra. **Numa obra de estudos bíblicos com
camada de texto limpa, alfabeto zerado deve ser alarme.**

**Verificação obrigatória antes de subir qualquer PDF "são":** extrair com
`pdftotext` e contar caracteres do alfabeto original. Zero em obra acadêmica = OCR.

## 5. Sobre o NotebookLM

### 5.1 O teto de palavras por fonte — medido, não documentado

| Obra | Palavras | Resultado |
|---|---:|---|
| Hutcheson | 540.267 | ❌ `error` |
| Bultmann | 461.813 | ✅ `ready` |

**Corte de trabalho: 450 mil** (margem). Acima, dividir com `dividir_md.py`, que
corta o `.md` pronto **sem refazer OCR** — preserva frontmatter e o bloco de
aviso em cada parte, e corta em fronteira de cabeçalho.

O original vira `*_COMPLETO.md`; o `subir_reocr.ps1` exclui esse padrão por filtro.

### 5.2 🚨 O NotebookLM completa o corpus com conhecimento externo, sem avisar

**O achado mais importante do projeto inteiro — e agora com dois casos medidos,
em capítulos independentes.**

| Capítulo | O que afirmou | Como caiu |
|---|---|---|
| **2** | que Bauckham (*GfAC*), Klink III e Nongbri estavam atestados nas fontes, **com números de citação** | a consulta seguinte abriu com **retratação explícita**: nenhum dos três estava lá |
| **3** | que Bauckham argumenta que João escreveu *"para os leitores de Marcos"* | retratação por escrito: *"introduzi esse conhecimento externo inadvertidamente"* — o ensaio existe (1998), **mas não está no corpus** |

**O padrão é constante e é o que o torna perigoso:** a atribuição é plausível,
específica, vem com número de citação, e é **falsa quanto ao corpus**. Não parece
alucinação — parece pesquisa.

**Regra permanente:** a consulta de verificação não serve só para achar o
contraditório — **serve para auditar a consulta anterior**. Nunca fechar seção
com atribuição bibliográfica que apareceu uma única vez.

**Como formular a auditoria** (o que funcionou nas duas vezes): pedir, para cada
autor citado, a classificação `[FONTE PRIMÁRIA NO CORPUS]` / `[CITADO POR
TERCEIROS — quem?]` / `[NÃO ENCONTRADO]`, e avisar explicitamente que numa
consulta anterior ele afirmou presença e precisou se retratar. A distinção que
precisa ser forçada é entre *"a posição do autor é discutida no corpus"* e *"a
obra do autor está no corpus"*.

### 5.3 O que você supõe ser "a posição conservadora" pode não ser — meça

Duas vezes, no cap. 3, eu teria escrito como consenso conservador algo que a
erudição conservadora **rejeita ou divide**:

| Eu escreveria | Estado real, medido |
|---|---|
| A **dupla limpeza do Templo** é a solução conservadora | **Dividida.** F. F. Bruce lê deslocamento programático; Gerald Borchert chama a tese de *"monstruosidade historiográfica"*; Keener a julga improvável. Carson, Morris, Köstenberger e Agostinho a sustentam |
| As **harmonizações da cronologia da Paixão** são a resposta conservadora | **Minoritárias, e Carson admite**: "não convenceu a maioria dos estudiosos". Jeremias declarou a tese de Jaubert *"infundada"* |

**Por que isso importa mais do que parece.** Apresentar como consenso o que é
posição dividida entrega ao crítico o alvo mais fácil possível: ele derruba o
capítulo **citando um conservador**. A honestidade aqui não é escrúpulo — é
blindagem.

**Regra:** antes de escrever "a posição conservadora é X", perguntar ao corpus
**quem entre os conservadores rejeita X**. Se a resposta não for vazia, o
capítulo apresenta as duas saídas e declara se decide entre elas.

### 5.3 Antes de reenviar obra que já está no notebook, medir o ganho

Três duplicatas flagradas: só uma valia a troca.

| Obra | PDF no notebook | MD re-OCR | Decisão |
|---|---|---|---|
| Harris, *EGGNT* | 0 grego | 582/10k, pureza 22,9% | **trocar** |
| ACCS Jo 1–10 | 0 grego | 24/10k, pureza 12,1% | não subir |
| Lindars, NCB | 0 grego | 18/10k, pureza 20,8% | não subir |

As duas últimas **transliteram por política editorial** — não havia grego a
recuperar. Subir duplicaria a obra e diluiria a recuperação.

**"Foi re-OCR'd" não é motivo suficiente.**

### 5.4 Armadilhas da CLI

- `source list --json` retorna `{notebook_id, notebook_title, sources, count}`,
  não um array. E às vezes emite uma linha **antes** do JSON — cortar no primeiro `{`.
- A tabela Rich quebra linhas e destrói regex. `$env:COLUMNS=400` + `Out-String -Width 400`.
- `source delete` exige confirmação: `cmd /c "echo y | notebooklm source delete <id>"`.
- **A auth expira com frequência**, inclusive ao desligar a máquina.
- `ask --new` é **destrutivo** — apaga a conversa do servidor.

## 6. Armadilhas de PowerShell 5.1 (custaram erro real)

| Armadilha | Correto |
|---|---|
| `&&` não é separador | `;` |
| `%VAR%` | `$env:VAR` |
| Caminho de exe entre aspas | `& "C:\..."` |
| `.ps1` lido como Windows-1252 | **script em ASCII puro**; prosa com acento em `.md` |
| `Get-Content` lê como ANSI | `-Encoding UTF8` |
| `[uint32]0x80000000` estoura | decimal `2147483648` |
| `Test-Path` trata `[` como curinga | `-LiteralPath` |
| `*.pdf` e `*.PDF` casam os mesmos arquivos | filtrar por extensão, não por glob duplo |
| `-ErrorAction SilentlyContinue` ainda falha o exit code | `try { ... -ErrorAction Stop } catch {}` |

---

# PARTE III — AS REGRAS

## 7. Regra Zero — inegociável

> **Jamais equiparar posição liberal ou progressista à conservadora.** Quando
> divergirem, a posição liberal/progressista é **objeção a ser refutada** — com
> base sólida, robusta e detalhada — nunca alternativa a ser registrada.

Vale nominalmente para **Bultmann e qualquer teólogo ou obra liberal**, e para o
feminismo e demais ideologias progressistas: leituras pós-coloniais, libertação
em chave marxista, revisionismo sexual, desconstrução pós-estruturalista.

**Proibido:** tabela lado a lado sem desfecho; fechar com "há debate" ou "cada
leitor decide"; terminar seção com a objeção sem resposta.

Ordem sempre: **tese → objeção → resposta**, e a resposta encerra.

⚠️ **Esta regra teve de ser reafirmada mais de uma vez**, embora escrita em três
arquivos. **A causa era mecânica:** o `CLAUDE.md` do projeto não carrega quando a
sessão abre em outro diretório de trabalho. **Só a memória persistente do Claude
Code carrega sempre.** É lá que a regra tem de estar em primeiro plano — e é por
isso que existe a `checagem_retomada.ps1`.

## 8. O padrão da refutação — cinco itens

Faltando um, **a seção não fecha**.

| # | Exigência | O que reprova |
|---|---|---|
| 1 | **Fonte primária citada**, referência localizável | resumo secundário |
| 2 | **A melhor versão** do argumento adversário | espantalho |
| 3 | **Ataque ao pressuposto** | responder só a conclusão |
| 4 | **Ancoragem tripla**: texto · recepção · consenso conservador | só autoridade |
| 5 | **Desfecho explícito** | terminar em "há debate" |

**Objeção que aparece em três linhas e é respondida em duas foi descartada, não
refutada.** Sem espaço para os cinco itens, **não se abre a objeção**.

## 9. As exceções — o que NÃO viola a Regra Zero

Esta seção existe porque o projeto errou **nos dois sentidos**.

### 9.1 Aliado que parece adversário — não refutar

| Caso | Diverge em | Sustenta |
|---|---|---|
| **Bauckham** | o Discípulo Amado não seria um dos Doze | **testemunho ocular** |
| **Hengel** | o autor seria João, o Presbítero | testemunha da geração apostólica |

⚠️ **Erro concreto:** a v1 do cap. 1 arrolou Hengel entre os defensores da autoria
por Zebedeu — no parágrafo que descartava o Presbítero. Atribuição errada é o erro
mais barato de verificar e o mais caro de sofrer.

### 9.2 Ressalva feita por conservador — absorver, não refutar

Quando Bauckham, Blomberg, Carson ou Barrett apontam a fragilidade de um argumento
tradicional, é correção interna. *Exemplo:* Polícrates e o *petalon* — a
consequência é **não usar Polícrates**, não "refutar Bauckham".

### 9.3 Rótulo de certeza baixo — obrigatório, não empate

`[HIPÓTESE DEBATIDA]` descreve **a força da evidência**, não a paridade das
posições. **Inflar rótulo é o flanco por onde o crítico entra.**

### 9.4 Lacuna real — declarar, não preencher

Se a resposta não existe no corpus, **declarar**. Declarar é desfecho honesto;
inventar destrói a obra.

### 9.5 Fonte presente mas silente — declarar o silêncio

**Presença da fonte não é cobertura do tema.** Medido: das oito obras adquiridas
para suprir escolas, três argumentam sobre autoria (Clarke, Tholuck, Hutcheson),
uma entra por citação de terceiros (Bengel) e **quatro são silentes** (Wesley,
Trapp, Owen, Flavel).

Declarar o silêncio ≠ declarar a ausência ≠ preencher a lacuna.

### 9.6 Grego vindo de OCR — nunca afirmar forma acentuada

Usar o texto para localizar onde o autor discute o termo; confirmar no PDF original.

## 10. As três consultas obrigatórias por capítulo

Evolução do método, e cada etapa nasceu de um erro:

| # | Consulta | O que pega |
|---|---|---|
| 1 | **Exegética** | o material do capítulo |
| 2 | **Verificação** — *quem, no dossiê, sustenta o contrário?* | atribuições erradas; e **audita a consulta 1** |
| 3 | **Refutação dirigida** — *quem responde a esta objeção?* | evita refutar por decreto |

**Placar real:** a consulta 2 pegou 3 erros no cap. 1 v1, mais 2 na reavaliação, e
a retratação bibliográfica no cap. 2. A consulta 3 nasceu no cap. 1 e salvou a
objeção do martírio precoce no cap. 2.

## 10-B. A Deep Research tem escopo, e errar o escopo polui o corpus

**Regra:** uma pauta de refutação só entra no notebook **da fase que a usa**.

*Caso medido (27/07):* a Pauta 1 do João — gênero e hermenêutica feminista — era
a prioridade declarada. Mas ela incide em Jo 2:4, 4, 11:27 e 20:11-18, e
**nenhum dos 16 prompts introdutórios toca esses textos**. Rodá-la no notebook
"João - Introdução" teria acrescentado dezenas de fontes sobre a samaritana e
Madalena a um corpus que discute autoria, data e gênero literário — diluindo o
retrieval de tudo o mais, sem servir a nenhum capítulo daquela fase.

**Como decidir:** para cada pauta, perguntar *qual prompt desta fase a consome?*
Sem resposta, a pauta espera o notebook de capítulo.

**Consequência de ordem prática:** as pautas que servem à Fase 1 são as de
questões introdutórias (autoria, data, anti-judaísmo em Prompt 15). As de
exegese de perícope são todas da Fase 2.

## 11. Regras operacionais

1. **Máx. 4 prompts exegéticos por sessão** — o contexto estoura e trunca arquivos.
2. **NUNCA** `notebooklm ask > arquivo.md` — despejo UTF-16. Redigir e usar Write.
3. **Fontes uma por vez**; todas `ready` antes de pesquisar.
4. **`source delete` manual ANTES** de qualquer `source clean` (bug conhecido).
5. **Sempre `-Simular` antes** de qualquer operação que remova ou envie.
6. **Rótulos obrigatórios** em toda afirmação.
7. **Checkpoint factual** ao fim de cada saída: sentinelas + atribuições.
8. **Retomada começa com relatório** — o que foi feito, pendências, próximas ações.

---

# PARTE IV — EXCLUSÕES

## 12. O que sai do corpus, e por quê

| Categoria | Destino | Critério |
|---|---|---|
| **Tier D** | `_fora_do_notebook/tier_d/` | sem valor exegético (sensacionalismo, devocional raso, KJV-onlyism) |
| **Duplicatas** | `_fora_do_notebook/duplicatas/` | mesma obra, edição pior |
| **Experimentos** | `_fora_do_notebook/experimento_dpi500/` | saídas de teste que não entram |
| **`*_COMPLETO.md`** | ficam em `_processados_md` | referência local; excluídos por filtro no upload |

⚠️ **O que NÃO é critério de exclusão: divergir da linha editorial.** Bultmann foi
**removido e reposto** justamente por ser o adversário principal; Beirne (*Women
and Men in the Fourth Gospel*) permanece pela mesma razão. **O padrão de cinco
itens torna a fonte adversária obrigatória** — não se cumpre o item 1 por citação
secundária.

**Regra:** obra adversária de peso **entra**. Obra ruim **sai**. São critérios
diferentes, e confundi-los empobrece a refutação.

## 13. Decisões adiadas (e por quê)

| Item | Estado |
|---|---|
| Paralelizar conversões no CSV | ⏸️ adiado; travas por etapa já implementadas e testadas. Rodar dois streams à mão já funciona |
| `--sem-hebraico` no conversor | pendente — hipótese do `--lang` **testada e refutada** |
| `lat.traineddata` para obras latinas | pendente (Bengel rodou com `--lang eng`) |

---

# PARTE V — O QUE É AGNÓSTICO E O QUE NÃO É

Esta é a tabela que gera o molde.

| Componente | Agnóstico | Observação |
|---|:---:|---|
| **Avisos automáticos de sentinela** (3 hooks) | ✅ | cobram o que o molde não pode gerar |
| Escala de certeza (6 níveis) | ✅ | integral |
| Protocolo anti-alucinação | ✅ | menos o bloco de sentinelas |
| Persona do NotebookLM | ✅ | integral |
| Padrão de refutação (5 itens) | ✅ | integral |
| As exceções (§9) | ✅ | os exemplos são de João, a lógica não |
| As 3 consultas por capítulo | ✅ | integral |
| Kit de triagem R1–R4 + N1 | ✅ | integral |
| Scripts de conversão, divisão, upload, backup, checagem | ✅ | caminhos e ID parametrizados |
| Arquitetura de 3 fases | ✅ | nº de capítulos varia com o livro |
| Pipeline de 5 estágios | ✅ | integral |
| Conhecimento de OCR (Parte II) | ✅ | **transfere inteiro** |
| Armadilhas de PS 5.1 | ✅ | integral |
| **Sentinelas factuais** | ❌ | **o que mais dá trabalho** — exige conhecer o livro |
| **Os 16 prompts da Fase 1** | 🟡 | a **grade temática** transfere; o conteúdo não |
| **Curadoria e tiers** | 🟡 | os critérios transferem; a lista não |
| **Pautas de refutação** | 🟡 | o método transfere; as pautas dependem do livro |
| Plano do livro | ❌ | específico |

**As sentinelas são o gargalo do molde.** São o conhecimento que impede o erro
factual caro, e não há como gerá-las automaticamente. O molde oferece um
**método para construí-las** (`moldes/sentinelas.md.tpl`) e exige que a Fase 0 as
produza antes de qualquer redação.
