# CLAUDE.md — Projeto Indesculpáveis (Rm 1.18–3.20)

> **Leia este arquivo inteiro antes de qualquer ação.** É o mapa de tudo.
> Gerado em 03/10/2026 a partir do molde dos projetos **JDD** (Justiça de Deus)
> e **Romanos-Cap1**, com o conteúdo de `../Projeto  Indesculpáveis — Romanos 1-18_2-29.md`.
> Atualizar a cada ciclo de sessões.

---

## 0. TL;DR — Retomada em 90 segundos

> ### ⛔ REGRA ZERO, antes de qualquer redação
>
> **Jamais equiparar posição liberal ou progressista à conservadora.** Quando
> divergirem, a posição liberal/progressista é **objeção a ser refutada**, com
> base sólida, robusta e detalhada — nunca alternativa a ser registrada.
>
> **Padrão de cinco itens: §2-B.** Nesta unidade a Regra Zero incide em cheio
> em **quatro** pontos: Rm 1.26-27 (revisionismo sexual), a ira impessoal
> (Dodd), a prosopopeia de Campbell e a leitura de Rm 2 como incoerente
> (Sanders/Räisänen). Ver `LACUNAS_REFUTACAO.md`.

> ### 🔁 DUPLA CHECAGEM ANTI-FALHA (herdada do JDD, 22/08/2026)
>
> **Nenhuma afirmação de ausência vale com uma única verificação.** "Não está
> no corpus", "não há comentário de X", "é preciso comprar" exigem **um método
> de conteúdo + um método de inventário** (RAG + `grep` no `.md`; `ls` +
> leitura do miolo). O JDD registrou **oito falsos negativos**, dois deles com
> recomendação de compra de obra que o usuário já tinha.

> ### 🔒 FRONTEIRA IND — rótulo e clausura
>
> **Rótulo do projeto: `IND`.** Toda obra usada aqui tem de estar **dentro de
> `biblioteca\` deste projeto**. Obra de outro projeto (JDD, Romanos-Cap1,
> Romanos-Cap2) entra por **cópia**, nunca por leitura cruzada. A cópia é o ato
> de entrada.

**Projeto:** pesquisa exegética de **Rm 1.18–3.20** — o diagnóstico do pecado
humano —, com **eixo focal em Rm 1.29–2.2**, onde a acusação contra o mundo se
volta contra quem julga.
**Título da série:** *Indesculpáveis — o juízo justo de Deus e a nossa
necessidade do evangelho*.
**Palavra-chave:** ἀναπολόγητος, "indesculpável" (1.20; 2.1).
**Moldura:** 1.16-17 (o evangelho revela a justiça de Deus) e 3.21-26 (a
justiça de Deus manifestada em Cristo).
**Rótulo:** `IND` · **Idiomas originais:** grego (núcleo) e hebraico (citações
do AT em 2.6, 2.24, 3.4, 3.10-18; Sl 106.20 e Jr 2.11 em 1.23).
**Público:** estudiosos da Palavra nas línguas originais — teólogos, mestres e
doutores em teologia. **O grego não se translitera no corpo do texto**; a
transliteração só aparece entre parênteses na primeira ocorrência.

**Escopo e delimitação:** `ESCOPO_INDESCULPAVEIS.md`.
**Os 16 prompts:** `prompts_indesculpaveis.md`.
**Execução sessão a sessão:** `Sequencia_Indesculpaveis.md`.

---

## 1. ARQUITETURA

O projeto **não é de livro** (como Romanos-Cap1) **nem de tema canônico**
(como JDD): é de **perícope argumentativa**. Por isso combina os dois moldes:

| Camada | Escopo | Notebooks | Entregável |
|---|---|---|---|
| **1. Anéis** (primeiro — decisão de 03/10) | eixo focal 1.29–2.2 em **4 anéis** (`ESTRATEGIA_ANEIS_INDESCULPAVEIS.md`) | 4 notebooks (núcleo → global) | 4 relatórios de anel + mídia |
| **2. Pesquisa** | 16 prompts em 5 blocos (A–E), com os 4 relatórios de anel como fonte de apoio | 1 notebook `IND - Rm 1.18-3.20` | 16 saídas + mapa de consistência |
| **Síntese** | relatório consolidado + roteiro da série | 1 notebook de síntese (só relatórios) | `Relatorio_Indesculpaveis.md` + `.docx`/`.pdf` |

**O notebook de síntese não recebe os PDFs.** Recebe os relatórios auditados
(regra herdada: os rótulos de certeza sobrevivem; o retrieval alcança tudo; a
coerência transversal aparece). **Não decide questões novas** — detecta
contradições e as devolve ao prompt de origem.

### Os cinco tópicos da série → os 16 prompts

| Tópico (da proposta) | Texto | Prompts |
|---|---|---|
| — Fundamentos | 1.18–3.20 | 1 · 2 · 3 |
| 1. O evangelho e a ira | 1.16-23 | 4 · 5 · 6 |
| 2. Deus os entregou | 1.24-28 | 7 · 8 |
| 3. Cheios de toda injustiça | 1.29-32 | 9 · 10 |
| 4. Tu, que julgas | 2.1-5 | 11 · 12 |
| 5. Deus não faz acepção | 2.6-29 | 13 · 14 |
| *6. Todos debaixo do pecado* | 3.1-20 | 15 |
| *7. A justiça manifestada* | 3.21-26 (moldura) | 16 (síntese) |

Os tópicos 6 e 7 **não estão na tabela da proposta** e foram acrescentados por
exigência da própria proposta: *"Não deixar a série terminar no encontro 4 ou 5;
a esperança de 3:21-26 precisa ser ensinada"*, e o texto-base declarado vai até
3.20. Ver `ESCOPO_INDESCULPAVEIS.md` §2.

### Relação com os projetos irmãos (o que se herda e o que não)

| Projeto | O que já cobre | Como entra aqui |
|---|---|---|
| **Romanos-Cap1** | Rm 1.18-32 nos prompts 10–15 do `Relatorio_Cap1_Romanos.md` | **semente**, como fonte de apoio no notebook — **com auditoria prévia** (ver §4, sentinelas S11–S12) |
| **JDD, U02** | Rm 1.18–3.20 como unidade da Justiça de Deus; Campbell, Stowers, Gathercole no acervo | **projetos paralelos** (decisão de 03/10/2026): nenhum alimenta o outro, nenhum relatório circula entre os dois. O acervo JDD pode ser **fonte de cópia** de obras para `biblioteca\` (FRONTEIRA IND). Divergência com a U02, se notada, é **registrada** no mapa de consistência IND como observação — não é resolvida aqui |
| **Piloto Rm 1.28–32** (anéis, 29/09) | estudo aprofundado com 54 citações conferidas | **semente do anel 1** do eixo focal, junto com o Cap1 auditado |
| **Romanos-Cap2** (Drive: `Relatorio_Cap2_Romanos.md`) | Rm 2 | **a copiar para `biblioteca\`** antes de qualquer uso (FRONTEIRA IND) |

---

## 2. ESTRUTURA DE PASTAS

```
Indesculpaveis/
├── CLAUDE.md                          ← este arquivo
├── MEMORIA_INDESCULPAVEIS.md          ← estado e próxima ação
├── REGRAS_RETOMADA.md                 ← diretrizes, regras, EXCEÇÕES
├── ESCOPO_INDESCULPAVEIS.md           ← círculos, eixos, tópicos, bordas
├── prompts_indesculpaveis.md          ← os 16 prompts (blocos A–E)
├── Sequencia_Indesculpaveis.md        ← sessão a sessão
├── ESTRATEGIA_ANEIS_INDESCULPAVEIS.md ← o eixo focal 1.29–2.2 em 4 anéis
├── LACUNAS_REFUTACAO.md               ← pauta de refutação (Regra Zero)
├── CURADORIA_FONTES_INDESCULPAVEIS.md ← bibliografia com tier e conferência
├── FASE_0_CHECKLIST.md                ← do zero ao primeiro prompt
├── _LOG_EXECUCAO.md                   ← histórico técnico
│
├── semente/                           ← relatório-semente do Cap1 auditado (Etapa 5)
├── _scripts/                          ← etapa1_perfil_pro.ps1 (ASCII)
├── _artifacts/
│   ├── sentinelas_IND.md              ← 🚩 armadilhas factuais — RASCUNHO
│   ├── escala_certeza.md              ← os 6 níveis
│   └── persona_notebooklm.txt
│
├── biblioteca/                        ← única origem legítima de fontes
├── _processados_md/                   ← saídas convertidas
├── _fora_do_notebook/                 ← Tier D, duplicatas, quarentena
├── aneis/                             ← anel1..4_relatorio.md (antes das saídas)
└── saidas/                            ← 00_mapa + 01..16
```

As pastas `biblioteca/`, `_processados_md/` e `_fora_do_notebook/` vivem
**na máquina local** e **não vão para o Git** (PDFs com direitos autorais).

---

## 2-B. LINHA EDITORIAL

O relatório é **obra confessional de nível acadêmico**, no registro de
Cranfield, Moo, Schreiner e Murray. Não é exposição neutra.

### A regra do desnível (não negociável)

**Jamais equiparar argumento teológico conservador e progressista.** Quando
divergirem, a posição progressista é objeção a ser **respondida**.

### O padrão da refutação: cinco itens

| # | Exigência | O que reprova |
|---|---|---|
| 1 | **Fonte primária citada**, localizável | resumo secundário |
| 2 | **A melhor versão** do argumento adversário | espantalho |
| 3 | **Ataque ao pressuposto** | responder só a conclusão |
| 4 | **Ancoragem tripla:** texto · recepção · consenso conservador | só autoridade |
| 5 | **Desfecho explícito** | terminar em "há debate" |

**Sem espaço para os cinco itens, não se abre a objeção.** As exceções
(aliado que diverge, ressalva conservadora, rótulo baixo, lacuna, silêncio)
estão em `REGRAS_RETOMADA.md` §4 — **leia antes de refutar um aliado por engano.**

### A regra pastoral desta perícope (da proposta, e não negociável)

A Regra Zero governa **o debate**; a regra abaixo governa **o tom**. As duas
não se contradizem — a segunda é aplicação de 2.1 ao próprio redator.

1. **Rm 1.24-27 com sobriedade:** sem linguagem de desprezo. O mesmo texto que
   condena a prática inclui, em 2.1, quem a condena. Refutar o revisionismo
   **não** autoriza retórica de superioridade.
2. **Não transformar a lista de vícios em hierarquia de pecadores.** O catálogo
   de 1.29-31 mistura homicídio e mexerico de propósito.
3. **A série não termina em 2.29 nem em 3.20.** Toda saída que trate do juízo
   fecha com a ponte para 3.21-26.
4. **2.1 inclui o professor.** Nenhuma saída fala de "eles" sem dizer "nós".

### Escolas a percorrer

| Escola | Onde a perícope dá matéria | Fontes a conferir |
|---|---|---|
| Patrística | 1.26-27; 2.14-15 (gentios cristãos?) | Crisóstomo, *Hom. Rom.* 3–6; Agostinho, *De spiritu et littera* 26–28; Orígenes/Rufino |
| Reformada | sensus divinitatis (1.19-21); 2.1 | Calvino, *Inst.* I.3–5 e comentário; Turretini |
| Puritana | 3.19 (toda boca se cale) | Edwards, *The Justice of God in the Damnation of Sinners*; Owen |
| Pietista | 2.4 (bondade que conduz ao arrependimento) | Bengel, *Gnomon* |
| Wesleyana | 2.14-15 (graça preveniente) | Wesley, *Notes*; sermões |
| Pentecostal | 2.29 (circuncisão ἐν πνεύματι) | Macchia — **provável silêncio, declarar** |

⚠️ **Presença da fonte não é cobertura do tema.** Onde a fonte existe mas cala,
**declarar o silêncio** — não reconstruir a tradição de memória.

---

## 3. PROTOCOLO DE SESSÃO

**Início:** ler `MEMORIA_INDESCULPAVEIS.md` → `auth check --test` → todas as
fontes `ready`.

**Durante:**
- **Máximo 4 prompts exegéticos por sessão.**
- **NUNCA** `notebooklm ask > arquivo.md`. Sempre redigir e salvar com a Write tool.
- **Três consultas por prompt:** exegética · verificação · refutação dirigida.
  A **verificação audita a consulta anterior** — o NotebookLM completa o corpus
  com conhecimento externo sem avisar.
- **`-p <perfil>` e `-n <id>` explícitos em todo comando** (estado global da CLI
  é compartilhado entre janelas).
- Rótulos obrigatórios em toda afirmação (`_artifacts/escala_certeza.md`).
- Conferir as sentinelas de `_artifacts/sentinelas_IND.md`.

**Fim:** atualizar `MEMORIA_INDESCULPAVEIS.md` (Próxima ação) e `_LOG_EXECUCAO.md`.

---

## 3-B. AS REGRAS QUE CUSTARAM CARO (herdadas, todas medidas)

- **Regra 11 — RAG para descobrir, disco para conferir.** A consulta confirma
  presença; **nunca** estabelece ausência.
- **Regra 11-C — nunca imputar vício de método** (espantalho, má-fé) sem ler a
  passagem inteira em fonte primária. Vale em dobro para Campbell e Stowers.
- **Regra 12 — o nome do arquivo não é evidência de autoria.** Ficha
  catalográfica → autor em 3ª pessoa no texto → créditos → frontmatter.
- **Regra 13 — inspecionar antes de decidir OCR.** E toda obra "PDF são" de
  estudos bíblicos com **zero** caracteres gregos é alarme (Harris, Bauckham).
- **O grego de OCR nunca autoriza forma acentuada.** Localizar no `.md`,
  confirmar no PDF ou no NA28.

---

## 4. SENTINELAS FACTUAIS

Ver `_artifacts/sentinelas_IND.md`.

🚩 **Estado em 03/10/2026: VAZIO (tabela verificada) — 14 rascunhos (S1–S14).**
Os rascunhos foram redigidos **de conhecimento prévio, sem consulta ao
notebook**, e por isso ficam **fora** da tabela contada. Migrar um rascunho é o
ato de dá-lo por verificado — um por vez, depois da consulta de verificação.

**Enquanto a tabela estiver vazia, nenhum prompt pode ser redigido em `saidas/`.**

Duas sentinelas (S11, S12) não são sobre o texto bíblico, mas sobre o
**relatório-semente** do Romanos-Cap1: ele classifica a identidade judaica do
interlocutor de 2.1 como certeza "altíssima" e descreve o debate de 1.26-27
com "equidade acadêmica". As duas coisas precisam de auditoria **antes** de o
relatório entrar no notebook como fonte.

---

## 5. NOTEBOOKS

| Notebook | ID | Status | Fontes |
|---|---|---|---|
| IND - Rm 1.18-3.20 | *(criar na Fase 0, Etapa 8)* | ⬜ | |
| IND - Eixo 1.29-2.2 · Anel 1–4 | *(criar na camada de aprofundamento)* | ⬜ | |
| IND - Síntese | *(criar ao fim)* | ⬜ | |

### Conta — decidida em 03/10/2026

**Conta Pro do NotebookLM: `aleinstitutoreformado@gmail.com`.**
**Perfil da CLI:** `<PERFIL_PRO>` — **ainda não criado/medido**. Na Fase 0,
Etapa 1: fazer o login dessa conta num perfil próprio, gravar o nome do perfil
em `perfil.config.txt` e substituir `<PERFIL_PRO>` nos documentos.

⚠️ **Não confundir com as outras contas citadas nos documentos irmãos** — cada
uma é de um papel ou projeto diferente:

| Conta | Onde aparece | Papel |
|---|---|---|
| `aleinstitutoreformado@gmail.com` | **este projeto** | **NotebookLM Pro do IND** |
| `alessandroinstitutoreformadosp@gmail.com` | `../CLAUDE.md` §6 (JDD) | NotebookLM + backup do JDD |
| `alesouza@gmail.com` | `../ESTADO_ATUAL_2026-10-03.md` §1 | Pro do piloto Rm 1.28–32 |
| `alessandronuvemti@gmail.com` | `../MEMORIA_CAP1.md` | Romanos-Cap1 (perfil `nuvemti`) |

**Só `auth check --test` decide** qual conta um perfil abre de fato
(`profile list` mente com token vencido). Conferir que o perfil abre
**`aleinstitutoreformado@gmail.com`** antes de criar o primeiro notebook —
notebook criado na conta errada é trabalho perdido.

⚠️ **Estado global:** o perfil global da CLI é compartilhado entre janelas.
**Não trocar o perfil global** — passar `-p <PERFIL_PRO>` em cada comando.
Pendências herdadas (`../ESTADO_ATUAL_2026-10-03.md` §6): o login por cookies
da Pro falhou no Windows (`rookie_cookies.pyd`, "DLL load failed … Acesso
negado"); `patch_rpc_limit.ps1` aponta o módulo da 0.7.3. As duas incidem
aqui.

**Cota:** a cota medida (20 áudios e 20 vídeos/dia, corte 21h BRT) é **por
conta** `[HIPÓTESE: independente das outras contas — não testada]`. Uma conta
própria livra o IND da cota de áudio compartilhada com o projeto João.

**Teto de fonte:** corte de trabalho em **450–500 mil palavras** (medido no
molde: 461.813 passou, 540.267 falhou). Acima, `dividir_md.py`.

---

## 6. PRÓXIMA AÇÃO

Ver `FASE_0_CHECKLIST.md` e `MEMORIA_INDESCULPAVEIS.md`.

---

*Este arquivo substitui qualquer chat anterior como fonte de verdade.*
