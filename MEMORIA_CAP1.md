# MEMÓRIA DO PROJETO — Romanos Capítulo 1

> **Prompt de retomada em novo chat:**
> "CONTEXTO: Projeto de pesquisa exegética sobre Romanos Capítulo 1 (Rm 1.1–32). Leia o arquivo MEMORIA_CAP1.md na pasta Romanos-Pesquisa/Romanos-Cap1. Siga as instruções da Seção 8 (prompt de retomada) para entender o estado atual e o que fazer a seguir."

---

## Seção 0 — Como Usar Este Arquivo

Este arquivo é a memória completa do sub-projeto "Romanos Capítulo 1". Ao abrir um novo chat:

1. Conecte a pasta `C:\Users\admintrt9a\Documents\Romanos-Pesquisa` como pasta de trabalho.
2. Peça ao assistente para ler este arquivo (`MEMORIA_CAP1.md`).
3. O assistente saberá exatamente onde o projeto parou e o que fazer.

**Relação com o projeto-pai:** este sub-projeto herda todos os recursos do projeto principal (notebook, fontes, persona, sistema_erudito.md). Os arquivos do projeto-pai ficam em `C:\Users\admintrt9a\Documents\Romanos-Pesquisa\` (um nível acima desta pasta).

---

## Seção 1 — Estado do Projeto

> **PRÓXIMA AÇÃO (atualizado 2026-07-20):** Sessão 4 — Bloco D parte 1 (prompts 10–12) no Claude Code, notebook `1f3b529f`. Instrução pronta na Seção 8.1 abaixo. Após a saída do Claude Code, o assistente deve AUDITAR os capítulos (teste P46, atribuições, fontes DR L3) antes de autorizar a Sessão 5.

| Item | Status |
|------|--------|
| Pasta criada | ✅ `Romanos-Cap1/` com `saidas/` |
| prompts_cap1.md | ✅ 16 prompts em 5 blocos (A–E) |
| Sequencia_Cap1.md | ✅ Guia completo de execução |
| Este arquivo (MEMORIA_CAP1.md) | ✅ |
| Expansão de fontes (14 PDFs + Champlin 3 partes) | ✅ 2026-07-20 |
| Deep Research (4 rodadas) + triagem R1–R4 + poda | ✅ 62 fontes finais, todas ready |
| Decisão: arquitetura 1 notebook/capítulo + scripts | ✅ exportar_fontes_dr.ps1 + montar_notebook_capitulo.ps1 |
| Exportar fulltexts DR (exportar_fontes_dr.ps1) | ✅ 20 fulltexts em fontes_dr\ (2 textos colados eram lixo — descartados) |
| Montar notebook "Romanos - Cap 1" | ✅ ID 1f3b529f · **61 fontes, todas ready** (validado 2026-07-20 20:40) |
| Correções pós-montagem | ✅ Barrett re-add · Brooten recuperada por OCR · Poythress e Gagnon por URL direta |
| Sessão 1 (Bloco A: prompts 1–4) | ✅ saidas/01–04 salvos (2026-07-20). Correção pós-sessão: cap. 01 citava P46 como testemunha de Rm 1.7 — removido (P46 não contém Rm 1; começa em 5.17). Cap. 04 já estava correto. |
| Sessão 2 (Bloco B: prompts 5–6) | ✅ saidas/05–06 salvos (2026-07-20). Auditados: P46 respeitado, fontes DR L4 citadas, sem correções. |
| Sessão 3 (Bloco C: prompts 7–9) | ✅ saidas/07–09 salvos (2026-07-20). Auditados: Hab 2.4 MT/LXX/Paulo correto, fontes L1 usadas no debate δικαιοσύνη, sem correções. |
| Sessão 4 (Bloco D-1: prompts 10–12) | ✅ saidas/10–12 salvos e auditados (2026-07-20). Nota: 1ª execução veio como despejo bruto UTF-16 — refeita em sessão de redação a partir dos brutos. |
| Sessão 5 (Bloco D-2: prompts 13–15) | ✅ saidas/13–15 salvos e auditados (2026-07-21). Fontes L2 usadas com equidade no cap. 14. Sem correções. |
| Sessão 6 (Mapa + Síntese: prompt 16) | ✅ 00_mapa (17 KB) + 16_sintese (27 KB) salvos e auditados (2026-07-21). Pesquisa completa: 17 arquivos em saidas/. |
| Consolidação do Relatório | ✅ Relatorio_Cap1_Romanos.md (237 KB; capa + nota metodológica + sumário + 4 partes + conclusão + apêndice-mapa) |
| Conversão DOCX/PDF | ✅ .docx (fix de tabelas aplicado) + .pdf (100 páginas) — 2026-07-21 |

**🏁 PROJETO ROMANOS CAPÍTULO 1: CONCLUÍDO em 2026-07-21.**

> Atualize esta tabela conforme o projeto avança (substitua ⬜ por ✅).

---

## Seção 2 — Ambiente e Dependências

**Mesmo ambiente do projeto principal.** Ver `MEMORIA_PROJETO.md` Seção 2 para detalhes completos.

Verificação rápida:
```powershell
cd C:\Users\admintrt9a\Documents\Romanos-Pesquisa
powershell -ExecutionPolicy Bypass -File .\checar_ambiente.ps1
```

Se auth expirada: `notebooklm login` (conta: alessandronuvemti@gmail.com).

---

## Seção 3 — Notebooks e Fontes

**ARQUITETURA (decidida em 2026-07-20): um notebook por capítulo.**

| Notebook | ID | Papel |
|----------|-----|-------|
| "Romanos - Introducao" | `c0b6f27a-d6b4-4b4d-9f1a-36266e38bd2c` | **Congelado como referência** — 62 fontes, histórico da pesquisa de Introdução. Não alterar mais. |
| "Romanos - Cap 1" | `1f3b529f-ab8c-49dc-822c-697843e919d4` | **Notebook de trabalho do capítulo 1** (criado 2026-07-20; 61 fontes; persona configurada) |
| "Romanos - Cap N" (futuros) | — | Um por capítulo, criado com o mesmo script |

**Racional:** conversas isoladas por capítulo, retrieval mais preciso, escalabilidade (o acúmulo de fontes Deep Research de 16 capítulos estouraria um notebook único), e poda de um capítulo sem risco aos demais.

**Scripts da arquitetura (nesta pasta):**
- `exportar_fontes_dr.ps1` — roda **uma vez** com o notebook Introducao ativo; baixa o fulltext das 20 fontes Deep Research + 2 textos colados para `fontes_dr\` (arquivos locais reutilizáveis — não há duplicação nativa de notebooks no NotebookLM).
- `montar_notebook_capitulo.ps1 -Capitulo N` — cria e povoa o notebook do capítulo: corpus técnico (27 arquivos em Romanos-Pesquisa) + 13 comentários (pasta TESTAMENTO-NOVO\06-ROMANOS\COMENTARIOS-2026) + fulltexts de `fontes_dr\` + `Relatorio_Romanos.md` (conclusões da Introdução) + persona.

| Item | Valor |
|------|-------|
| Persona | persona_notebooklm.txt (aplicada pelo script em cada notebook novo) |
| Idioma | pt_BR (configuração global) |

### Inventário de fontes (atualizado 2026-07-20, pós-expansão e poda)

**Corpus principal — 42 fontes** (39 + Champlin em 3 partes):
- Os 26 originais do projeto de Introdução (Cranfield, Moo, Schreiner, Barrett, Morris, Keener, Bruce, Murray, Hodge, Osborne, Achtemeier, Gaventa, Bassler, Gorman, Pate, Westerholm, Orígenes, Abelardo*, Lutero, Calvino, Barth, Godet*, Hendriksen*, William de St. Thierry*, Sproul-texto, Gospel According to Paul-texto) — *convertidos em .txt
- 13 adicionados em 2026-07-20: EBC (Expositor's), Harvey/Köstenberger/Yarbrough, Matthew Henry, Keller, Sproul PDF, Boice, Hughes, Hernandes Lopes, Comentário Esperança, Baker Illustrated, Smyth & Helwys, Ultimate Commentary, Pulpit Commentary
- Champlin NT V.3 em 3 partes .txt (arquivo original tinha 1.038.000 palavras — acima do limite de ~500 mil/fonte; dividido em Parte 1de3/2de3/3de3)

**Deep Research aprovadas — 20 fontes** (sobreviventes do protocolo R1–R4; ver revisao_fontes_deep_research.md):
- *Lacuna 1 (δικαιοσύνη θεοῦ, 1.17):* Yongbom Lee (Bible Translator) · N.T. Wright "On Becoming the Righteousness of God" · Irons "Lexical Examination" (JRTS) · "Paul's Use of dikaio Terminology" (Theological Studies) · "Incorporated Righteousness" · síntese DR
- *Lacuna 2 (Rm 1.26–27):* Hays "Relations Natural and Unnatural" · Brooten "Patristic Interpretations" · Gagnon "Why the Disagreement" · tese Rawlings (PhD) · síntese DR Gagnon/Brooten/Brownson
- *Lacuna 3 (Sabedoria 13–15):* Linebaugh (NTS) · tese Alec Lucas (Sl 106, PhD Loyola) · estudo Roebuck (re-add por URL) · síntese DR
- *Lacuna 4 (Rm 1.3–4):* Craine (Érudit) · Adimula (Érudit, re-add por URL) · Dodson & Scalise (ὁρίζω) · Poythress (Frame-Poythress.org) · síntese DR

**Histórico da curadoria:** as 4 rodadas de `add-research --mode deep --import-all --cited-only` importaram ~200 fontes web; o protocolo R1–R4 + poda (`podar_fontes.ps1`) removeu ~180 (blogs, fóruns, agregadores, devocionais, artigos isolados). Lição: `--import-all` é agressivo — sempre seguir de triagem R1–R4.

**Fluxo de ativação (após montar o notebook do capítulo):**
```powershell
notebooklm use <id-do-notebook-Cap1>
notebooklm status
notebooklm source list --no-truncate    # esperar todas ready antes de pesquisar
```

> O comando `ask --new` não é mais necessário — cada notebook novo já nasce com conversa limpa.

---

## Seção 4 — Estrutura de Prompts

**16 prompts em 5 blocos — arquivo:** `prompts_cap1.md`

| Bloco | Prompts | Tema | Sessão Claude Code |
|-------|---------|------|--------------------|
| A | 1–4 | Praescriptum, Proem, Estrutura, Crítica Textual | Sessão 1 |
| B | 5–6 | Cristologia (1.3–4), Obediência da Fé (1.5) | Sessão 2 |
| C | 7–9 | Propositio (1.16–17), δικαιοσύνη θεοῦ, ἐκ πίστεως / Hab 2.4 | Sessão 3 |
| D | 10–15 | Ira de Deus, Revelação Natural, Idolatria, παρέδωκεν, Ética Sexual, Catálogo | Sessões 4 e 5 |
| E | 16 | Síntese final | Sessão 6 |

**Regra crítica:** máximo 4 prompts por sessão do Claude Code. Bloco D é dividido em 2 sessões (10–12 e 13–15).

---

## Seção 5 — Inventário de Arquivos Esperados

```
Romanos-Cap1/
├── prompts_cap1.md
├── Sequencia_Cap1.md
├── MEMORIA_CAP1.md
├── Relatorio_Cap1_Romanos.md       ← a criar
├── Relatorio_Cap1_Romanos.docx     ← a criar
├── Relatorio_Cap1_Romanos.pdf      ← a criar
└── saidas/
    ├── 00_mapa_consistencia_cap1.md  ← a criar
    ├── 01_praescriptum.md            ← a criar
    ├── 02_proem.md                   ← a criar
    ├── 03_estrutura.md               ← a criar
    ├── 04_critica_textual.md         ← a criar
    ├── 05_cristologia_1_3_4.md       ← a criar
    ├── 06_obediencia_fe.md           ← a criar
    ├── 07_propositio.md              ← a criar
    ├── 08_dikaiosyne.md              ← a criar
    ├── 09_ek_pisteos.md              ← a criar
    ├── 10_orge_theou.md              ← a criar
    ├── 11_revelacao_natural.md       ← a criar
    ├── 12_idolatria.md               ← a criar
    ├── 13_paredoken.md               ← a criar
    ├── 14_etica_sexual.md            ← a criar
    ├── 15_catalogo_vicios.md         ← a criar
    └── 16_sintese_cap1.md            ← a criar
```

---

## Seção 6 — Fluxo de Trabalho (7 Passos)

1. **Checar ambiente:** `checar_ambiente.ps1` — tudo [OK]?
2. **Ativar notebook:** `notebooklm use c0b6f27a` + nova conversa
3. **Sessão 1 Claude Code:** Bloco A (prompts 1–4) → salvar saidas/01–04
4. **Sessões 2–5:** Blocos B, C, D-1, D-2 → salvar saidas/05–15
5. **Sessão 6:** Mapa de consistência (00) + Síntese (16)
6. **Sessão de consolidação:** produzir `Relatorio_Cap1_Romanos.md`
7. **Conversão:** pandoc → DOCX; LibreOffice → PDF

---

## Seção 7 — Decisões Editoriais

- **Fontes:** notebook expandido para 62 fontes (ver Seção 3). O corpus técnico (Cranfield, Moo, Schreiner, Harvey/EGGNT etc.) segue sendo a autoridade primária; as obras devocionais/expositivas (Keller, Sproul, Boice, Hughes, Lopes, Champlin etc.) servem para história da recepção e aplicação pastoral.
- **Estratégia de filtro `-s` (anti-diluição):** nos prompts técnicos (1, 4, 5, 8, 9, 14 — morfologia, crítica textual, debates acadêmicos), considerar limitar as fontes consultadas com `notebooklm ask -s <id> -s <id> ...` usando apenas o corpus técnico + as fontes DR da lacuna correspondente. Nos prompts de teologia geral e história da interpretação, usar o notebook completo. A persona já prioriza fontes técnicas, então o filtro é reforço opcional, não obrigatório.
- **Profundidade:** mesma do projeto anterior — análise do grego original obrigatória, história da interpretação em cada tema, posições dos comentaristas identificadas por nome.
- **Temas sensíveis:** Rm 1.26–27 (ética sexual) — o prompt 14 instrui análise acadêmica rigorosa cobrindo ambos os lados do debate; nenhuma posição suprimida; clareza sobre onde o consenso acadêmico conservador se posiciona.
- **Crítica textual:** o prompt 4 cobre variantes textuais; notar especialmente a questão de "em Roma" em 1.7 (já tratada no projeto de Introdução — ver 15_leituras_criticas.md, corrigido: testemunha é G/Boernerianus, não P46).
- **Consistência com o projeto principal:** quando o capítulo 1 retomar temas do projeto de Introdução (propositio de 1.16–17, estrutura retórica, NP Paulo), verificar coerência com as saídas de `../saidas/` para evitar contradições.

---

## Seção 8 — Prompt de Retomada para Novo Chat

```
CONTEXTO: Retomando sub-projeto de pesquisa sobre Romanos Capítulo 1 (Rm 1.1-32).

Leia o arquivo MEMORIA_CAP1.md na pasta Romanos-Cap1 que está dentro de Romanos-Pesquisa.

Com base na Seção 1 (estado do projeto) e Seção 5 (inventário de arquivos), identifique:
1. Quais saídas já existem em Romanos-Cap1/saidas/?
2. Qual é o próximo prompt a executar?
3. Cheque o ambiente com checar_ambiente.ps1 (um nível acima, em Romanos-Pesquisa).
4. Confirme que o notebook c0b6f27a está ativo com notebooklm status.
5. Continue de onde parou, seguindo a Sequencia_Cap1.md.

Regra: máximo 4 prompts por sessão. Não pule o checkpoint de qualidade após cada saída.
```

---

## Seção 8.1 — Instrução Pronta para a Sessão 4 (Claude Code)

> **REGRA CRÍTICA DE EXECUÇÃO:** as sessões de pesquisa rodam SOMENTE no **Claude Code (terminal)**. O assistente do chat NUNCA executa os prompts diretamente (ex.: `notebooklm ask > arquivo.md`) — isso gera resposta bruta sem redação do erudito e com encoding UTF-16 corrompido (ocorrido em 2026-07-20; arquivo 10 refeito). O papel do chat é: preparar instruções → usuário executa no Claude Code → chat audita as saídas.
>
> **REGRA ADICIONAL (incidente da Sessão 4, 2026-07-20):** o PRÓPRIO Claude Code também pode preguiçar e despejar `ask > arquivo` em vez de redigir. Toda instrução de sessão deve conter: "REDIJA o capítulo a partir da resposta do notebook e salve com o tool de escrita de arquivos — NUNCA via redirecionamento > do shell". Auditoria detecta: arquivo começando com "Answer:", encoding UTF-16, ausência de checkpoint.

O usuário deve abrir o **terminal**, rodar `cd C:\Users\admintrt9a\Documents\Romanos-Pesquisa\Romanos-Cap1` e `claude`, e colar:

```
Leia ../sistema_erudito.md e aplique como persona.
Confirme notebook ativo 1f3b529f (notebooklm status).
Execute os prompts 10, 11 e 12 de prompts_cap1.md (via notebooklm ask --prompt-file).
Salve em saidas/10_orge_theou.md, saidas/11_revelacao_natural.md, saidas/12_idolatria.md.

Orientações específicas:
- Prompt 10 (ira de Deus): as 3 posições (personalista, Dodd impessoal, judicial) com atribuição precisa.
- Prompt 11 (revelação natural): o debate Barth vs. Brunner vs. Tomás/católica vs. reformada é o núcleo — desenvolvimento extenso.
- Prompt 12 (idolatria): consultar as fontes L3 (Linebaugh, Lucas, Roebuck, síntese) para os paralelos com Sabedoria de Salomão 13-15 e Sl 106.

ATENÇÃO FACTUAL: o P46 NÃO contém Romanos 1 (folhas iniciais perdidas; texto começa em Rm 5.17).
Checkpoint de qualidade após cada capítulo.
NÃO execute mais de 4 prompts nesta sessão.
```

Sessões seguintes (mesma estrutura, adaptar):
- **Sessão 5:** prompts 13–15 → saidas/13_paredoken.md, 14_etica_sexual.md, 15_catalogo_vicios.md. No prompt 14, consultar fontes L2 (Hays, Brooten, Gagnon, Rawlings, síntese) — ambos os lados do debate com vozes primárias.
- **Sessão 6:** mapa de consistência (ler saidas/01–15 → saidas/00_mapa_consistencia_cap1.md) + prompt 16 → saidas/16_sintese_cap1.md.
- **Consolidação:** ver Sequencia_Cap1.md Etapas 5–6.

---

## Seção 9 — Troubleshooting

| Problema | Solução |
|----------|---------|
| `source fulltext -f markdown` erro "requires the 'markdownify' package" | `uv tool install "notebooklm-py[browser,markdown]" --force` — NUNCA usar pip direto: cria cópia-sombra sem Playwright que quebra o `login` (ocorrido em 2026-07-20; corrigido com `--force` + `pip uninstall notebooklm-py -y`) |
| `[FALTA]` em arquivos com acento ao rodar .ps1 | PowerShell 5.1 lê .ps1 como ANSI e corrompe acentos. Solução: usar curingas ASCII (`Coment*rio`, `Jo*o`) via Get-ChildItem — ver corrigir_faltas.ps1 |
| `fulltext` de PDF escaneado vem como imagens base64 (inútil como fonte; dá `error` no re-upload) | Ou re-adicionar pela URL original do PDF, ou extrair as imagens base64 e passar OCR (tesseract) — caso Brooten resolvido por OCR; Poythress/Gagnon por URL direta (usar URL de *download*, não a página "view") |
| Fonte >500 mil palavras dá `error` no upload | Dividir o arquivo em partes (caso Champlin: 1.038.000 palavras → 3 partes) |
| `source clean` remove duplicata "errada" durante poda | Deletar duplicatas manualmente ANTES de rodar `clean`; conferir fontes aprovadas após qualquer poda |
| `--title` ignorado em `source add` por URL | Adicionar e depois `notebooklm source rename <id> "Título"` |
| Auth expirada | `notebooklm login` (conta: alessandronuvemti@gmail.com) |
| Notebook não encontrado | `notebooklm list` → verificar ID; `notebooklm use <id>` |
| Conversa anterior interferindo | `notebooklm ask --new -y "nova pesquisa"` |
| Prompt muito longo (>4000 chars) | Salvar em `.txt` → `notebooklm ask --prompt-file prompt.txt` |
| Overflow de contexto no Claude Code | Encerrar sessão → abrir nova → continuar do próximo prompt |
| Saída truncada | Pedir ao Claude Code para continuar: "complete o capítulo anterior que ficou truncado" |
| DOCX sem segunda coluna nas tabelas | Descompactar .docx → editar `w:w="0.0"` para `w:w="5000"` em `word/document.xml` → recompactar |
| Contradição com projeto de Introdução | Verificar `../saidas/` para o tema correspondente; priorizar a versão mais recente e documentar a contradição no mapa de consistência |

## Caderno Paredoken (Rm 1.24, 26, 28) — 26-27/09/2026

Caderno `800b9959`, só o verbo παρέδωκεν. Pasta `Romanos-Cap1/paredoken/` (queries de DR P1/P2, 6 queries de mídia P1-P6 prontas e NÃO executadas, `triagem/`, `logs/`).
- **Estado:** 57 fontes `ready`, 0 erro (88 antes da poda das 31 candidatas do R1; backup em `logs/poda_R1_backup.json`).
- **Triagem R1-R4 e R4b feitas e verificadas.** R4b pediu trecho literal das 5 obras primárias novas; os 8 trechos conferem nos arquivos locais.
- **Hanson (*Wrath of the Lamb*) é adversário**, não crítico de Dodd — lido no texto.
- **Fontes markdown sem URL = relatórios da própria Deep Research** (circulares): não contar como evidência.
- **Faltam:** Crisóstomo e Lutero integrais, Brooten (1996), Brownson (2013), Vines, Hays 1986 (limpar imagens base64 do arquivo local).
- **Mídia:** não gerada; cota de 20 áudios/dia e o Cap.2-E ainda deve 5.
