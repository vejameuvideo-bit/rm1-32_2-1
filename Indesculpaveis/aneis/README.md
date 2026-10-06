# aneis/ — eixo focal Rm 1.29–2.2

Roda **antes** dos 16 prompts (decisão de 03/10/2026). Ver `../ESTRATEGIA_ANEIS_INDESCULPAVEIS.md`.

🚩 Nenhum relatório de anel é redigido, e nenhuma mídia é gerada, com a tabela verificada de `../_artifacts/sentinelas_IND.md` vazia. Mínimo para o anel 1: S1–S8 e S11.

## Prompts (prontos para colar; **nada foi executado**)

| Arquivo | Conteúdo |
|---|---|
| `PROMPTS_COMUM.md` | a trava (6 regras + fecho), o cabeçalho fixo da Deep Research, a rotina, os modelos dos 11 artefatos, a verificação do lote |
| `anel1_prompts.md` | Anel 1 — Núcleo (1.32–2.2): 5 DR · R4 própria · C1–C3 · 11 itens de mídia |
| `anel2_prompts.md` | Anel 2 — Contexto (1.18–3.20): idem; Campbell, 2.13, 2.14-15, 4QMMT |
| `anel3_prompts.md` | Anel 3 — Corpus e intertexto: idem; Sabedoria, Israel, "não julgueis", προσωπολημψία |
| `anel4_prompts.md` | Anel 4 — Global: idem; as seis escolas e os dois desvios |

⚠️ A sintaxe da CLI nos prompts é esboço: conferir cada flag com `notebooklm generate --help` na versão instalada.
⚠️ A `_trava_comum` original está nos projetos de origem, não aqui: a versão do `PROMPTS_COMUM.md` é a do IND — conciliar.

## Relatórios (a produzir)

| Arquivo | Anel | Semente |
|---|---|---|
| `anel1_relatorio.md` | 1 — Núcleo (1.32–2.2) | estudo Rm 1.28-32 do piloto + `../semente/Relatorio_Cap1_S13-15_auditado_IND.md` |
| `anel2_relatorio.md` | 2 — Contexto (1.18–3.20) | `anel1_relatorio.md` + `../semente/Relatorio_Cap1_S10-12_auditado_IND.md` |
| `anel3_relatorio.md` | 3 — Corpus e intertexto | `anel2_relatorio.md` |
| `anel4_relatorio.md` | 4 — Global | `anel3_relatorio.md` |

Os quatro relatórios entram como fontes de apoio no notebook `IND - Rm 1.18-3.20`.
