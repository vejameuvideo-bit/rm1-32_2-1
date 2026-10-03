# Regras de retomada — Justica-de-Deus

*Impresso por `_scripts\checagem_retomada.ps1`. Não editar sem atualizar
`CLAUDE.md` §2-B e `MEMORIA_PROJETO.md` — os três precisam concordar.*

---

## 1. REGRA ZERO — inegociável

> **Jamais equiparar posição liberal ou progressista à conservadora.**
> Quando divergirem, a posição liberal/progressista é **objeção a ser
> refutada** — com base sólida, robusta e detalhada — e nunca alternativa a
> ser registrada.

Vale nominalmente para **qualquer teólogo ou obra liberal**, e para o
**feminismo** e demais ideologias progressistas: leituras pós-coloniais,
libertação em chave marxista, revisionismo sexual, desconstrução
pós-estruturalista aplicada ao texto.

**Proibido:**
- tabela ou seção que ponha as duas posições lado a lado sem desfecho;
- fechar com "há debate", "cada leitor decide", "ambas as leituras são possíveis";
- terminar uma seção com a objeção por último e sem resposta.

A ordem é sempre **tese → objeção → resposta**, e a resposta é que encerra.

---

## 1-B. O RITO DE RETOMADA (obrigatório)

**Toda retomada após pausa, descanso ou sono começa com o relatório** — antes de
executar qualquer coisa nova.

| # | Parte | De onde sai |
|---|---|---|
| 1 | **O que foi feito** | `_LOG_EXECUCAO.md`, últimas seções |
| 2 | **Pendências abertas** | `_LOG_EXECUCAO.md`, última seção de pendências |
| 3 | **Próximas ações** | `MEMORIA_PROJETO.md`, *Próxima ação* |

Mais a **checagem de consistência**: arquivos de regra íntegros, notebook são,
sem trava órfã. Tudo num comando:

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\checagem_retomada.ps1
```

⚠️ **O relatório é do estado real, não do plano.** Se falhou, diz que falhou.

---

## 2. DIRETRIZES BÁSICAS

| # | Diretriz |
|---|---|
| 1 | O produto é **obra confessional de nível acadêmico**. Não é exposição neutra. |
| 2 | **Foco no que atravessa séculos.** Cortar curiosidade erudita e controvérsia circunstancial. |
| 3 | A **espinha do capítulo é o consenso conservador** — desenvolvido, não apenas registrado. |
| 4 | Estrutura: **tese → objeções → resposta**. Nunca catálogo de posições. |
| 5 | **Percorrer as escolas** onde a passagem der matéria: patrística, reformada, puritana, pietista, wesleyana, pentecostal. |

---

## 3. O PADRÃO DA REFUTAÇÃO — cinco itens

Faltando um, **a seção não fecha**.

| # | Exigência | O que reprova |
|---|---|---|
| 1 | **Fonte primária citada**, referência localizável | resumo secundário |
| 2 | **A melhor versão** do argumento adversário, inclusive o que acerta | espantalho |
| 3 | **Ataque ao pressuposto** — nomear a premissa e mostrar que o texto não a dá | responder só a conclusão |
| 4 | **Ancoragem tripla:** (a) texto (b) recepção (c) consenso conservador | só autoridade |
| 5 | **Desfecho explícito** | terminar em "há debate" |

**Objeção que aparece em três linhas e é respondida em duas foi descartada, não
refutada.** Sem espaço para os cinco itens, **não se abre a objeção**.

A refutação é **argumentada, nunca decretada**.

---

## 4. AS EXCEÇÕES — o que NÃO é violação da Regra Zero

### 4.1 Aliado que parece adversário — NÃO refutar
Quem diverge no **nível específico** mas sustenta o **fundamental** é reforço.
Refutá-lo perde o reforço e ataca quem não era o adversário.

*Preencher com os casos deste livro:*

| Caso | Diverge em | Sustenta |
|---|---|---|
| | | |

### 4.2 Ressalva feita por conservador — absorver, não refutar
Quando um aliado aponta a fragilidade de um argumento tradicional, é correção
interna. A consequência é **não usar o argumento fraco**, não refutar o aliado.

### 4.3 Rótulo de certeza baixo — obrigatório, não empate
`[HIPÓTESE DEBATIDA]` descreve **a força da evidência**, não a paridade das
posições. **Inflar rótulo é o flanco por onde o crítico entra.**

### 4.4 Lacuna real na literatura — declarar, não preencher
Declarar é o desfecho honesto; inventar destrói a obra.

### 4.5 Fonte presente mas silente — declarar o silêncio
**Presença da fonte não é cobertura do tema.** Declarar o silêncio ≠ declarar a
ausência ≠ preencher a lacuna.

### 4.6 grego vindo de OCR — nunca afirmar forma acentuada
Usar o texto para localizar; confirmar a forma no PDF original.

---

## 5. REGRAS OPERACIONAIS OBRIGATÓRIAS

1. **Máx. 4 prompts exegéticos por sessão** — o contexto estoura e trunca arquivos.
2. **NUNCA** `notebooklm ask > arquivo.md` — despejo UTF-16. Redigir e usar Write.
3. **Três consultas por capítulo:** exegética · verificação · refutação dirigida.
   ⚠️ **A verificação audita a consulta anterior** — o NotebookLM pode completar o
   corpus com conhecimento externo sem avisar. Nunca fechar seção com atribuição
   bibliográfica que apareceu uma única vez.
4. **Rótulos obrigatórios:** `[FATO TEXTUAL]` / `[DADO HISTÓRICO]` /
   `[INFERÊNCIA FORTE]` / `[INFERÊNCIA PLAUSÍVEL]` / `[HIPÓTESE DEBATIDA]` /
   `[ESPECULAÇÃO]`.
5. **Checkpoint factual** ao fim de cada saída: sentinelas + atribuições.
6. **Fontes uma por vez**; todas `ready` antes de pesquisar.
7. **`source delete` manual ANTES** de qualquer `source clean`.
8. **Sempre `-Simular` antes** de qualquer envio ou remoção.
9. **Scripts `.ps1` sem acentos** — PowerShell 5.1 corrompe. Prosa em `.md` UTF-8.
10. **Teto de fonte: 450 mil palavras** (medido: 461.813 passou, 540.267 falhou).
11. **Antes de reenviar obra já no notebook**, medir se há ganho real.

---

## 6. SENTINELAS FACTUAIS

Ver `_artifacts\sentinelas_JD.md`.

⚠️ **Se aquele arquivo ainda estiver vazio, nenhum capítulo pode ser redigido.**

---

## 7. ONDE ESTÁ CADA COISA

| Preciso de… | Arquivo |
|---|---|
| A regra completa e o padrão de cinco itens | `CLAUDE.md` §2-B |
| Estado, notebooks, próxima ação | `MEMORIA_PROJETO.md` |
| Histórico técnico, armadilhas, decisões | `_LOG_EXECUCAO.md` |
| Pauta de refutação e desequilíbrio do corpus | `LACUNAS_REFUTACAO.md` |
| Sentinelas em detalhe | `_artifacts\sentinelas_JD.md` |
| Os prompts da Fase 1 | `fase1-introducao\prompts_JD.md` |
| O método completo e o que ele custou a aprender | `ANATOMIA_DO_PROJETO.md` |
