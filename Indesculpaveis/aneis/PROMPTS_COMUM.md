# Prompts dos anéis — parte comum

*Vale para os quatro anéis. Cada `anelN_prompts.md` traz só o que muda.
Escrito em 06/10/2026. **Nada daqui foi executado**: o NotebookLM ainda não foi
tocado e a sintaxe da CLI abaixo é esboço.*

⚠️ **Sintaxe da CLI a conferir.** Os comandos usam os nomes citados em
`../../ESTRATEGIA_ANEIS.md` e `../../MEMORIA_CAP1.md` (`source add-research
--mode deep --import-all --cited-only`; `generate audio|video|…`;
`artifact list|wait`). **Conferir cada flag com `notebooklm generate --help`
na versão instalada** (a 0.8.4 mudou módulos em relação à 0.7.3) antes de rodar
em lote. `<PERFIL_PRO>` e `<ID>` são marcadores: perfil de
`aleinstitutoreformado@gmail.com` (Etapa 1) e ID do caderno do anel.

---

## 1. A TRAVA COMUM — vai no início de TODA consulta e de todo prompt de mídia

> ⚠️ A `_trava_comum` original (6 regras, fecho cristocêntrico) vive nos
> projetos de origem e **não está neste repositório**. Esta é a versão IND,
> escrita a partir das regras do molde. **Se a original diferir, conciliar** — e
> registrar no `_LOG_EXECUCAO.md`.

```
TRAVA (6 regras)
1. Use SOMENTE as fontes deste caderno. Se algo não está nelas, responda
   "NÃO ENCONTRADO NO CORPUS". Nunca complete com conhecimento externo.
2. Marque cada afirmação: [FATO TEXTUAL] [DADO HISTÓRICO] [INFERÊNCIA FORTE]
   [INFERÊNCIA PLAUSÍVEL] [HIPÓTESE DEBATIDA] [ESPECULAÇÃO].
3. Atribua posição a um autor SÓ se a OBRA dele estiver no caderno. Se a posição
   aparece só citada por terceiros: [CITADO POR TERCEIROS — quem?].
4. REGRA ZERO: posição liberal ou progressista que diverge da conservadora é
   OBJEÇÃO a refutar, nunca alternativa equivalente. Cinco itens: fonte
   primária; versão mais forte; ataque ao pressuposto; texto + recepção +
   consenso conservador; desfecho explícito. Sem fonte primária no caderno ou
   sem espaço para os cinco itens: NÃO abra a objeção — diga que a remete a
   outro anel.
5. Grego e hebraico: cite NA28, BHS e LXX (Rahlfs); não translitere no corpo;
   nunca afirme forma acentuada vinda de OCR sem dizer que precisa de conferência.
6. Tom: sóbrio. Rm 2.1 inclui quem fala: use "nós". Sem desprezo, sem hierarquia
   de pecadores.

FECHO OBRIGATÓRIO: termine com a ponte para Romanos 3.21-26 (a justiça de Deus
manifestada em Cristo) e, se for o caso, com a ponte nominal "isto será
retomado no anel N+1, caderno X".
```

**Cabeçalho fixo de toda Deep Research** (vai antes da pergunta do anel):

```
ANTES DE BUSCAR: liste as objeções liberais/progressistas que este texto atrai.
Para cada uma, busque (a) a OBRA PRIMÁRIA do adversário — por título E por
sobrenome — e (b) a RESPOSTA CONSERVADORA DEDICADA. Priorize artigos revisados
por pares (NTS, JBL, NovT, JSNT, ZNW, JETS, TynBul), comentários técnicos
(NICNT, BECNT, ICC, WBC, Hermeneia, NIGTC) e monografias. EXCLUA blogs,
sermões, vídeos, fóruns e agregadores. Se não houver obra primária ou resposta
dedicada, DECLARE A LACUNA — nunca a preencha.
```

---

## 2. Rotina de cada anel (resumo; detalhe em `../ESTRATEGIA_ANEIS_INDESCULPAVEIS.md` §6)

1. **Caderno:** criar `IND - Anel N`; aplicar `../_artifacts/persona_notebooklm.txt`; subir as obras locais (só de `biblioteca\`, **`-Simular` antes**).
2. **Deep Research:** 5 consultas (as do `anelN_prompts.md`), `--mode deep`. **Parar em `RATE_LIMITED`**; nunca retentar às cegas. Cota ~20 DR/dia/conta.
3. **Triagem R1–R4** (`../../revisao_fontes_deep_research.md`, com a R4 trocada pela do anel) e poda **com backup**; `source delete` manual **antes** de `source clean`.
4. **Três consultas** (C1 exegética · C2 verificação · C3 refutação dirigida) → relatório redigido com a Write tool em `aneis/anelN_relatorio.md`. **Nunca** `ask > arquivo`.
5. **Auditoria** do relatório (checkpoint factual + sentinelas) **antes** de semear o anel seguinte.
6. **Mídia** (11 artefatos) — só **depois** do relatório auditado.
7. **Verificação do lote** (§5 abaixo).

⚠️ **Trava de sentinelas:** nenhum relatório de anel e nenhuma mídia com a tabela
verificada vazia. Mínimo para o anel 1: **S1–S8 e S11**.

⚠️ **`-p <PERFIL_PRO>` e `-n <ID>` em todo comando.** Não trocar o perfil global.

---

## 3. Os 11 artefatos — modelos (cada anel preenche `{FOCO}` e `{PONTE}`)

### 3.1 Áudios (4) — `--length long`, `--language pt_BR`

| # | Dupla | `--format` | Função |
|---|---|---|---|
| A1 | novo convertido + pastor | `deep-dive` | porta de entrada, "por que importa" |
| A2 | estudante + hermeneuta | `deep-dive` | método, gramática, léxico |
| A3 | pastor + exegeta | `deep-dive` | refutação (Regra Zero) |
| A4 | estudante + exegeta | `critique` | tese testada contra a melhor objeção |

⛔ **Não usar `debate`:** equipara os lados e conflita com a Regra Zero.

```
[TRAVA]
Episódio de áudio em português do Brasil, longo. Dupla: {PERSONA}.
Tema: {FOCO}. Texto: {TEXTO}.
Instruções:
- Os apresentadores leem o grego (NA28) e explicam em português; não
  transliteram no corpo.
- Pelo menos uma vez, ambos dizem "nós": o texto de Rm 2.1 alcança quem fala.
- {INSTRUÇÃO ESPECÍFICA DO PAPEL: ver tabela do anel}
- Nenhuma afirmação sem rótulo falado de certeza ("isto é fato textual…",
  "isto é inferência plausível…").
- Objeção progressista: só se a obra primária estiver no caderno; abra, refute
  nos cinco itens e feche com desfecho. Senão, diga "este ponto é tratado no
  anel {N+1}".
- Encerre com {PONTE} e com Romanos 3.21-26.
```

### 3.2 Vídeos (3) — sem `--length`; **a duração medir depois**

| # | `--format` | `--style` | Função |
|---|---|---|---|
| V1 | `explainer` | `classic` | exposição |
| V2 | `explainer` | `whiteboard` | estrutura e grego |
| V3 | `cinematic` | `auto` | síntese e aplicação |

Persona **só pelo prompt** (não há flag). **Marca d'água:** não há opção na CLI;
gerar **um** vídeo, extrair um quadro e inspecionar os cantos **antes** de gerar
os demais. Se houver marca, é restrição do produto — **não** remover por edição.

```
[TRAVA]
Vídeo em português do Brasil, formato longo. Narração: {PERSONA}.
Tema: {FOCO}. Texto: {TEXTO}.
Mostrar na tela: o texto grego (NA28) com a tradução de trabalho, as pontes
verbais e os rótulos de certeza.
Tom: "nós". Sem hierarquia de pecadores.
Encerrar com {PONTE} e Romanos 3.21-26.
```

### 3.3 Flashcards, mapa, infográficos

| Artefato | Opções | Observação |
|---|---|---|
| Flashcards (1) | `--quantity more --difficulty hard` | **sem `--language`:** exigir pt-BR no prompt e **medir** o idioma dos cartões |
| Mapa mental (1) | `--kind interactive --language pt_BR` | — |
| Infográfico I1 | `--language pt_BR --orientation portrait --detail detailed --style professional` | estrutura do argumento |
| Infográfico I2 | idem, `--style sketch-note` | mapa de termos |

```
[TRAVA — versão curta]
Flashcards em português do Brasil. Frente: termo ou frase grega (NA28) + referência.
Verso: tradução, categoria gramatical, função no argumento de {TEXTO}, rótulo de
certeza. Incluir cartões "armadilha" (erros comuns: ver sentinelas do anel).
Nenhum cartão sem fonte no caderno.
```

---

## 4. Idioma e identidade — verificação obrigatória

- **Idioma:** áudio e vídeo por Whisper em amostra de 30 s do meio (vídeo: extrair o áudio antes); flashcards por leitura de amostra.
- **Duração:** `ffprobe`; registrar no `_LOG_EXECUCAO.md`.
- **Identidade:** contar artefatos por **ID distinto**, nunca só pelo total. `artifact get <id>` para status (`artifact list` pode mostrar `pending` para artefato já completo).
- **Regra 11-D:** `CREATE_ARTIFACT timeout` é **falso negativo**. **Não repetir** o comando (duplica): `artifact list`, depois `artifact wait <id>`.
- **Regra Zero na mídia:** **conferir o áudio A3 de cada anel** (refutação) contra a Regra Zero antes de dar o anel por fechado. Ele ainda não existe — o piloto 1.28–32 já tinha essa pendência.

## 5. Verificação do lote — deve poder falhar

| Item | Como | Falha se |
|---|---|---|
| fontes | `source list -n <ID> --json` (campo `count`) | qualquer `error`, ou contagem ≠ registrada |
| podas | comparar com o backup | fonte apagada presente ≠ 0; local preservada < N/N |
| mídia | IDs distintos | menos de 4 + 3 + 1 + 1 + 2 |
| idioma | Whisper / leitura | qualquer artefato fora do pt-BR |
| Regra Zero | ouvir A3; ler V2 | objeção aberta sem desfecho, ou "há debate" |
| tom | ouvir A1 | "eles" sem "nós" |
| fecho | ler o final de cada item | sem ponte para 3.21-26 |
