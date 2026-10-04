# Log de execução — Indesculpáveis

## 1. Projeto criado (03/10/2026)

**Insumo:** `../Projeto  Indesculpáveis — Romanos 1-18_2-29.md` (a proposta),
analisado junto com os documentos dos projetos JDD e Romanos-Cap1 enviados na
mesma pasta (`CLAUDE.md`, `ANATOMIA_DO_PROJETO.md`, `ESCOPO_JUSTICA_DE_DEUS.md`,
`MEMORIA_CAP1.md`, `prompts_cap1.md`, `Relatorio_Cap1_Romanos.md`,
`ESTRATEGIA_ANEIS.md`, `ESTADO_ATUAL_2026-10-03.md` etc.).

**Nenhuma consulta ao NotebookLM e nenhuma obra aberta.** Tudo o que depende
disso está marcado `[a conferir]`, `⬜ não conferido` ou como rascunho.

### Decisões tomadas, e por quê

| Decisão | Razão |
|---|---|
| Molde híbrido (prompts do Cap1 + governo do JDD) | o projeto é de **perícope**: nem livro, nem tema canônico |
| 16 prompts em 5 blocos | mesma granularidade do Cap1 — cabe em 8 sessões de ≤4 prompts |
| Tópicos 6 (3.1-20) e 7 (3.21-26) acrescentados | o texto-base vai até 3.20 e os *Cuidados* exigem 3.21-26; a tabela da proposta parava em 2.29. **Confirmado pelo usuário em 03/10** |
| Dois produtos (relatório + roteiro da série) | o público é acadêmico e os *Cuidados* são de escola bíblica — misturar os registros enfraquece os dois |
| Regra 1-A ("regra de 2.1") ao lado da Regra Zero | os *Cuidados* da proposta são regra de **tom**; a Regra Zero é regra de **debate**; escritas lado a lado, não se contradizem |
| Sentinelas como rascunho, tabela vazia | a mesma decisão do JDD em 02/08: preencher sem verificar seria luz verde falsa |
| ~~Anéis depois do relatório~~ → **anéis ANTES** | revisto por decisão do usuário (§2) |

### Achados na análise dos arquivos enviados

1. **O relatório do Cap1 já cobre 1.18-32** (prompts 10–15) — reaproveitável
   como semente, mas com **dois defeitos** frente à Regra Zero e à escala de
   certeza: a identidade judaica do interlocutor de 2.1 com certeza "altíssima"
   (S11) e a descrição do debate de 1.26-27 com "equidade acadêmica" (S12).
2. **O piloto de anéis Rm 1.28–32** (29/09) termina exatamente onde o eixo focal
   começa; o seu anel 2 já era "Rm 1.18–32 + 2.1".
3. **A U02 do JDD é Rm 1.18–3.20.** Decisão do usuário (§2): os dois projetos
   **correm em paralelo**.
4. **Romanos-Cap2 existe no Drive** (`Relatorio_Cap2_Romanos.md`), não nesta
   pasta — entra só por cópia (FRONTEIRA IND).
5. Lacunas herdadas que incidem aqui: Sanders ausente (aquisição suspensa);
   4QMMT em edição primária ausente; Brownson, Vines, Brooten (1996), Hays 1986
   limpo — pendentes desde o caderno παρέδωκεν; Hooker 1960, Jeremias 1954,
   Klostermann 1933 — na pauta de aquisição de 03/10.

## 2. Decisões do usuário (03/10/2026)

| # | Decisão | O que mudou nos documentos |
|---|---|---|
| 1 | Série: 6 encontros de 90 min | ESCOPO §1.3, §8 |
| 2 | Tópicos 6 e 7 confirmados | — |
| 3 | Conta Pro do NotebookLM: `aleinstitutoreformado@gmail.com` | `CLAUDE.md` §5 (quadro das quatro contas; perfil `<PERFIL_PRO>` a criar); `-p default` → `-p <PERFIL_PRO>` na Sequência e na Fase 0 |
| 4 | **Anéis antes do relatório** (contra a recomendação) | ESTRATEGIA §1 e §6 novos: semente do anel 1 = estudo Rm 1.28-32 + Cap1 auditado; os 4 relatórios de anel viram fonte de apoio dos 16 prompts; trava de sentinelas vale para os anéis (mín. S1–S8 e S11). `CLAUDE.md` §1; Sequência (pré-requisito); Fase 0 (Etapa 7-B); pasta `aneis/` |
| 5 | **Projeto paralelo à U02 do JDD** (contra a recomendação de "alimentar") | `CLAUDE.md` §1; ESCOPO §8; Sequência (mapa de consistência: divergência com a U02 só é registrada) |

⚠️ **A conta `aleinstitutoreformado@gmail.com` é diferente das três já citadas
nos documentos irmãos** (`alessandroinstitutoreformadosp@`, `alesouza@`,
`alessandronuvemti@`). Registrada como dada; conferir por `auth check --test`
que o perfil abre exatamente essa conta antes de criar o primeiro caderno.

## Pendências abertas

- Ambiente: perfil da CLI para a conta Pro; login da Pro (bloqueio do
  `rookie_cookies.pyd`); `patch_rpc_limit.ps1` para a CLI 0.8.4.
- Fase 0 inteira.
