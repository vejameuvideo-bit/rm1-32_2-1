# Regras de retomada — Indesculpáveis

*Não editar sem atualizar `CLAUDE.md` §2-B e `MEMORIA_INDESCULPAVEIS.md` — os
três precisam concordar.*

---

## 1. REGRA ZERO — inegociável

> **Jamais equiparar posição liberal ou progressista à conservadora.**
> Quando divergirem, a posição liberal/progressista é **objeção a ser
> refutada** — com base sólida, robusta e detalhada — e nunca alternativa a
> ser registrada.

Vale para qualquer teólogo ou obra liberal e para o feminismo e demais
ideologias progressistas: leituras pós-coloniais, libertação em chave marxista,
**revisionismo sexual**, desconstrução pós-estruturalista.

**Proibido:** tabela lado a lado sem desfecho; fechar com "há debate", "cada
leitor decide", "ambas as leituras são possíveis"; terminar a seção com a
objeção por último e sem resposta.

Ordem: **tese → objeção → resposta**, e a resposta encerra.

## 1-A. A REGRA DE 2.1 — o tom (própria deste projeto)

> *"Tu és indesculpável, ó homem, quem quer que sejas, que julgas."*

A Regra Zero governa **o debate**; esta governa **o tom**, e as duas não se
contradizem:

1. Rm 1.24-27 com **sobriedade**, sem linguagem de desprezo.
2. **Nenhuma hierarquia de pecadores** a partir do catálogo.
3. **Nenhuma saída de juízo sem a ponte para 3.21-26.**
4. **2.1 inclui o redator e o professor.** Refutar o adversário não autoriza
   superioridade sobre a pessoa.

## 1-B. O RITO DE RETOMADA

Toda retomada começa com o relatório: (1) o que foi feito
(`_LOG_EXECUCAO.md`); (2) pendências; (3) próximas ações
(`MEMORIA_INDESCULPAVEIS.md`). **O relatório é do estado real, não do plano.**

---

## 2. DIRETRIZES BÁSICAS

| # | Diretriz |
|---|---|
| 1 | Obra **confessional de nível acadêmico**. Não é exposição neutra. |
| 2 | **Foco no argumento.** Cada texto é lido pelo que faz em 1.18–3.20. |
| 3 | A espinha de cada saída é o **consenso conservador**, desenvolvido. |
| 4 | Estrutura **tese → objeções → resposta**. Nunca catálogo de posições. |
| 5 | Percorrer as escolas onde a passagem der matéria — e **declarar o silêncio** onde não der. |

## 3. O PADRÃO DA REFUTAÇÃO — cinco itens

| # | Exigência | O que reprova |
|---|---|---|
| 1 | **Fonte primária citada**, localizável | resumo secundário |
| 2 | **A melhor versão** do argumento adversário | espantalho |
| 3 | **Ataque ao pressuposto** | responder só a conclusão |
| 4 | **Ancoragem tripla:** texto · recepção · consenso conservador | só autoridade |
| 5 | **Desfecho explícito** | terminar em "há debate" |

**Sem espaço para os cinco itens, não se abre a objeção.**

---

## 4. AS EXCEÇÕES — o que NÃO é violação da Regra Zero

### 4.1 Aliado que parece adversário — NÃO refutar

| Caso | Diverge em | Sustenta |
|---|---|---|
| **Barth** | nega a teologia natural em 1.19-20 | a culpa universal; a revelação como juízo |
| **Wright** (só nesta perícope) | — | 2.13 como juízo real segundo as obras, contra a leitura "incoerente" |
| **Hays** (só nesta perícope) | πίστις Χριστοῦ (fora daqui) | a leitura tradicional de 1.26-27 |
| **Stowers / Thorsteinsson** | interlocutor gentio em 2.1 | (não negam 3.9) — debate exegético |

### 4.2 Ressalva feita por conservador — absorver, não refutar

Quando um aliado aponta a fragilidade de um argumento tradicional (p. ex., que
2.1 não identifica o judeu antes de 2.17), a consequência é **não usar o
argumento fraco**.

### 4.3 Rótulo de certeza baixo — obrigatório, não empate

`[HIPÓTESE DEBATIDA]` descreve a força da evidência. **Inflar rótulo é o flanco
por onde o crítico entra** (ver sentinela S11).

### 4.4 Lacuna real — declarar, não preencher

### 4.5 Fonte presente mas silente — declarar o silêncio

### 4.6 Grego vindo de OCR — nunca afirmar forma acentuada

Localizar no `.md`; confirmar no PDF ou no NA28.

### 4.7 Debate interno conservador — apresentar as saídas, declarar se o texto decide

Eixo C (2.13 hipotético × real; 2.14-15 pagãos × cristãos) e eixo A (judeu ×
universal). **Não é empate com o liberalismo**: é honestidade entre aliados.

---

## 5. REGRAS OPERACIONAIS OBRIGATÓRIAS

1. **Máx. 4 prompts exegéticos por sessão.**
2. **NUNCA** `notebooklm ask > arquivo.md`. Redigir e usar Write.
3. **Três consultas por prompt**; a verificação **audita** a anterior.
4. **Rótulos obrigatórios** (`_artifacts/escala_certeza.md`).
5. **Checkpoint factual** ao fim de cada saída.
6. **Fontes uma por vez**; todas `ready` antes de pesquisar.
7. **`source delete` manual ANTES** de qualquer `source clean`.
8. **Sempre `-Simular`** antes de enviar ou remover.
9. **Scripts `.ps1` sem acentos.** Prosa em `.md` UTF-8.
10. **Teto de fonte:** ~450–500 mil palavras.
11. **`-p` e `-n` explícitos** em todo comando da CLI.
12. **Dupla checagem** antes de qualquer "não existe" ou "é preciso comprar".

## 6. SENTINELAS

Ver `_artifacts/sentinelas_IND.md`. **Tabela vazia → nenhuma saída redigida.**

## 7. ONDE ESTÁ CADA COISA

| Preciso de… | Arquivo |
|---|---|
| Mapa, Regra Zero completa | `CLAUDE.md` |
| Estado e próxima ação | `MEMORIA_INDESCULPAVEIS.md` |
| Escopo, eixos, tópicos | `ESCOPO_INDESCULPAVEIS.md` |
| Os 16 prompts | `prompts_indesculpaveis.md` |
| Execução por sessão | `Sequencia_Indesculpaveis.md` |
| Pauta de refutação | `LACUNAS_REFUTACAO.md` |
| O método e o que ele custou | `../ANATOMIA_DO_PROJETO.md` |
