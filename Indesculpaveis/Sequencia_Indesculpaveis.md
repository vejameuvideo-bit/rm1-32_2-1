# Sequência de Execução — Indesculpáveis (Rm 1.18–3.20)

**Objetivo:** produzir 16 saídas de pesquisa + mapa de consistência + relatório
consolidado + roteiro da série de 6 encontros, executando no Claude Code
contra o notebook `IND - Rm 1.18-3.20`.

**Pré-requisito:** `FASE_0_CHECKLIST.md` concluído — em especial a **Etapa 4
(sentinelas)**: com a tabela vazia, a escrita em `saidas/` está travada.

---

## Etapa 1 — Ambiente e notebook

```powershell
cd C:\Users\admintrt9a\Projetos\Indesculpaveis
notebooklm -p default auth check --test
notebooklm -p default -n <ID-IND> source list --json   # todas ready?
```

⚠️ `-p` vem **antes** do subcomando; `-n` em **toda** chamada. Nunca
`notebooklm use` (estado global compartilhado entre janelas). Nunca trocar o
perfil global.

---

## Etapa 2 — As sessões (máx. 4 prompts cada)

Em cada sessão, para **cada** prompt:

1. **Consulta exegética** — o prompt de `prompts_indesculpaveis.md` + as cláusulas fixas, via `--prompt-file`.
2. **Consulta de verificação** — auditar a consulta 1: cada autor citado → `[FONTE PRIMÁRIA NO CORPUS]` / `[CITADO POR TERCEIROS — quem?]` / `[NÃO ENCONTRADO]`.
3. **Consulta de refutação dirigida** — se a 2 trouxe objeção sem réplica: *quem, no corpus, responde?*
4. **Conferência em disco** do que for decisivo (Regra 11): `grep` no `.md` da obra.
5. **Redigir** a saída e salvar com a Write tool. **NUNCA** `ask > arquivo.md`.
6. **Checkpoint factual** (3–5 linhas): sentinelas tocadas; rótulos; atribuições; cuidado pastoral cumprido?

| Sessão | Bloco | Prompts | Arquivos em `saidas/` |
|---|---|---|---|
| 1 | A — Fundamentos | 1, 2, 3 | `01_argumento_moldura.md` · `02_critica_textual.md` · `03_grupos_de_palavras.md` |
| 2 | B — O evangelho e a ira | 4, 5, 6 | `04_orge_theou.md` · `05_supressao_verdade.md` · `06_idolatria_troca.md` |
| 3 | C — Entregues; cheios de injustiça | 7, 8 | `07_paredoken.md` · `08_rm1_26-27.md` |
| 4 | C — (cont.) | 9, 10 | `09_catalogo_vicios.md` · `10_rm1_32_dobradica.md` |
| 5 | D — Tu, que julgas | 11, 12 | `11_rm2_1-2_virada.md` · `12_rm2_3-5_bondade.md` |
| 6 | D — Sem acepção | 13, 14 | `13_rm2_6-16_juizo.md` · `14_rm2_17-29_judeu.md` |
| 7 | E — Veredito | 15 + mapa | `15_rm3_1-20_todos.md` · `00_mapa_consistencia_ind.md` |
| 8 | E — Síntese | 16 | `16_sintese_moldura.md` |

**Por que o Bloco C e o D ocupam duas sessões cada:** os prompts 8 e 11 são os
mais pesados do projeto (Regra Zero em cheio; eixo A). Juntá-los com outros
três estouraria o contexto — regra medida: overflow perdeu 5 arquivos no
experimento anterior.

### Instrução-modelo de sessão (colar no Claude Code)

```
Leia CLAUDE.md, REGRAS_RETOMADA.md e _artifacts/sentinelas_IND.md.
Aplique _artifacts/persona_notebooklm.txt.
Notebook: -p default -n <ID-IND> em TODO comando.
Execute os prompts N, N+1 de prompts_indesculpaveis.md, cada um com as
CLÁUSULAS FIXAS anexadas, via --prompt-file.
Para cada prompt: consulta exegética → verificação (audita a anterior) →
refutação dirigida se houver objeção sem réplica → conferência em disco.
REDIJA a saída a partir das respostas e salve com o tool de escrita —
NUNCA via redirecionamento > do shell.
Salve em saidas/NN_nome.md. Checkpoint factual após cada saída.
NÃO execute mais de 4 prompts nesta sessão.
Ao fim: atualize MEMORIA_INDESCULPAVEIS.md (Próxima ação) e _LOG_EXECUCAO.md.
```

**Sinais de saída defeituosa (a auditoria reprova):** arquivo começando com
"Answer:"; codificação UTF-16; ausência de checkpoint; objeção progressista
sem resposta no fim da seção; "há debate" como fecho; P46 citado.

---

## Etapa 3 — Mapa de consistência (sessão 7)

`saidas/00_mapa_consistencia_ind.md`, lendo 01–15:

- dependências entre saídas;
- matriz de certeza (por tema);
- os cinco eixos (A–E): onde cada um foi decidido e com que rótulo;
- contradições internas a resolver — **e contradições com a U02 do JDD e com o
  `Relatorio_Cap1_Romanos.md`** (devolver ao prompt de origem, não decidir no mapa);
- o mapa estrutural de 1.18–3.20 com o eixo focal 1.29–2.2 destacado.

---

## Etapa 4 — Consolidação do relatório

`Relatorio_Indesculpaveis.md`:

- Folha de rosto (título da série; tese)
- Nota metodológica — corpus, persona, **Regra Zero declarada**, escala de certeza, advertência de IA
- Sumário
- **Parte I** — Fundamentos: argumento, texto, léxico (saídas 1–3)
- **Parte II** — O evangelho e a ira (4–6)
- **Parte III** — Entregues e cheios de injustiça (7–10)
- **Parte IV** — Tu, que julgas; Deus não faz acepção (11–14)
- **Parte V** — Todos debaixo do pecado (15)
- **Conclusão** — dos indesculpáveis à justiça manifestada (16)
- Apêndices — mapa de consistência; tabela lexical; lacunas declaradas
- Referências — só obras do corpus, com a edição usada

## Etapa 5 — Roteiro da série

`Roteiro_Serie_Indesculpaveis.md` — 6 encontros (ESCOPO §6.2), cada um
derivado do relatório, **sem afirmação nova**. Cada encontro: texto grego e
tradução de trabalho · observação · interpretação · aplicação (Conhecer /
Discernir / Responder) · nota de cuidado pastoral.

## Etapa 6 — Conversão

```powershell
pandoc Relatorio_Indesculpaveis.md -o Relatorio_Indesculpaveis.docx --from markdown --to docx
& "C:\Program Files\LibreOffice\program\soffice.exe" --headless --convert-to pdf Relatorio_Indesculpaveis.docx
```

Se as tabelas do DOCX perderem a segunda coluna: trocar `w:w="0.0"` por
`w:w="5000"` nas `<w:tblW>` de `word/document.xml` (mesmo fix do Cap1).

---

## Depois — a camada de anéis

Ver `ESTRATEGIA_ANEIS_INDESCULPAVEIS.md`. O relatório consolidado vira o
relatório-semente dos anéis do eixo focal.
