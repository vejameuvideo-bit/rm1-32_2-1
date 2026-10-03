# MEMORIA_PROJETO — Justica-de-Deus

*Contexto portátil mestre. Atualizar ao fim de cada sessão.*
*Leitura obrigatória no início de cada sessão.*

---

## ⛔ REGRA ZERO — INEGOCIÁVEL (lida antes de tudo)

> **Jamais equiparar posições liberais e conservadoras. Jamais equiparar
> argumentos teológicos conservadores e progressistas.** Quando divergirem, a
> posição liberal ou progressista **é objeção a ser refutada** — com base sólida,
> robusta e detalhada — e nunca alternativa a ser registrada.

**O padrão de cinco itens** (detalhe em `CLAUDE.md` §2-B): (1) fonte primária
citada e localizável; (2) a objeção na sua versão mais forte; (3) ataque ao
**pressuposto**; (4) ancoragem tripla — texto, recepção, consenso conservador;
(5) desfecho explícito. Faltando um, a seção não fecha.

**Proibido:** tabela lado a lado sem desfecho; fechar com "há debate"; deixar a
objeção por último e sem resposta.

**Os rótulos de certeza não são exceção — são o que a serve.** Inflar rótulo é o
flanco por onde o crítico entra.

⚠️ **Esta regra vive também em `CLAUDE.md` §2-B, que NÃO carrega se a sessão
abrir com outro diretório de trabalho.** Por isso ela está aqui, e por isso
existe a `checagem_retomada.ps1`.

---

## TL;DR

Pesquisa exegética de **Justica-de-Deus** em **NotebookLM Pro**, com Claude Code como
redator sob protocolo anti-alucinação.

**Pasta:** `C:\Users\admintrt9a\Projetos\Justica-de-Deus`
**Idioma original:** grego · **Capítulos:** 14
**Método completo:** `ANATOMIA_DO_PROJETO.md`

---

## Estado atual

**Criado em:** 02/08/2026
**Fase:** [x] Fase 0 ✅ (09/08/2026) | [x] **Fase 1 ✅ completa em 13/08/2026** (16 prompts + relatório consolidado) | [ ] Fase 2 (13 unidades — próximo bloco) | [ ] Fase 3

| Notebook | ID | Fontes | Status |
|---|---|---|---|
| Justica de Deus | `d878e2b0-e950-4ee1-b78c-ce0fb8152a0b` | **82** (verificado 09/08/2026 via `source list -n <id> --json`) | ✅ todas `ready` |

⚠️ **Correção 09/08/2026 (mesmo dia):** este número passou por 109 mais cedo
hoje — valor errado, produzido por um bug real do `checagem_retomada.ps1`
(linha 146 chamava `source list --json` sem `-n`, herdando o notebook
"corrente" global da máquina, que no momento era outro projeto). Corrigido
no script. **82 é o número confirmado pela API oficial do NotebookLM**
(`count` field do JSON), batendo com a contagem incremental feita ao longo
desta sessão (77→81→82). Ver `_scripts/checagem_retomada.ps1` para o fix.

---

## Regras operacionais (nunca mudar)

1. **Máx. 4 prompts exegéticos por sessão.**
2. **NUNCA** `notebooklm ask > arquivo.md` — despejo UTF-16. Sempre redigir.
3. **Três consultas por capítulo:** exegética · verificação · refutação dirigida.
4. ⚠️ **A verificação audita a consulta anterior.** O NotebookLM pode completar o
   corpus com conhecimento externo sem avisar. Nunca fechar seção com atribuição
   bibliográfica que apareceu uma única vez.
5. **Fontes uma por vez**; todas `ready` antes de pesquisar.
6. **`source delete` manual ANTES** de `source clean`.
7. **Sempre `-Simular`** antes de enviar ou remover.
8. **Scripts `.ps1` sem acentos**; prosa em `.md` UTF-8.
9. **Teto de fonte: 450 mil palavras.**
10. **Auth expira** com frequência → `notebooklm login`.
11. 🔴 **Lembrete de aquisição no ponto de uso — regra ativa desde 09/08/2026.**
    Käsemann (*Commentary on Romans*), Sanders (*Paul and Palestinian
    Judaism*), Hays (*The Faith of Jesus Christ*) e um comentário dedicado
    de Filipenses seguem **ausentes do corpus por decisão** (aquisição
    suspensa por ora — ver `LACUNAS_REFUTACAO.md`).
    🆕 **13/08/2026:** a Fase 1 descobriu mais 3 ausências relevantes —
    *Justification and Variegated Nomism*, os pseudepígrafes apocalípticos
    (4 Esdras, 1 Enoque, 2 Baruc) e Westerholm/Seifrid. E **rebaixou**
    Filipenses: o volume de Hawthorne (Word Biblical Themes) estava
    escondido dentro da coletânea `WBTheme_Collection_15vol`. **Sempre que a redação
    tocar um destes três eixos — poder salvífico apocalíptico de
    δικαιοσύνη θεοῦ, nomismo pactual/NPP, πίστις Χριστοῦ como genitivo
    subjetivo, ou exegese de Filipenses —, declarar explicitamente a
    ausência da fonte primária no próprio ponto do texto**, não só uma vez
    no documento de lacunas. Ver `SUBSTITUTOS_KASEMANN_HAYS.md` para os
    candidatos já mapeados (Jewett, Martyn, Beker, Stuhlmacher, Hooker,
    Wallis) e `_artifacts/LISTA_COMPRAS_AQUISICOES.md` para a lista de
    compra quando a aquisição for retomada.

---

## Sentinelas factuais

Ver `_artifacts/sentinelas_JD.md`.

🚩 **Se aquele arquivo estiver vazio, a Fase 0 não terminou.**

---

## Histórico de sessões

| Data | Fase | O que foi feito |
|---|---|---|
| 02/08/2026 | 0 | Projeto gerado pelo molde |
| 05/08/2026 | 0 | `subir_reocr.ps1` corrigido (perfil, ID do notebook, `-n` explicito por chamada em vez de `use` global, retry); Chemnitz e Bengel divididos (3 partes cada, sob o teto de 450k); Etapa 6 rodada (`injetar_aviso.py` — existia em `~/.claude/skills/pdf-para-md/`, nao estava ausente, so nao tinha sido procurado no lugar certo antes) e Etapa 7-8 concluidas: 26 fontes `.md` no notebook, todas `ready`, todas com o bloco de aviso OCR no corpo. 4 PDFs obsoletos removidos (Chemnitz x2, Bertschmann, Stendahl). Vazamento cruzado de 10 fontes de outra sessao concorrente (projeto Romanos-Pesquisa) identificado e corrigido pela outra sessao; risco documentado em memoria de protecao (`notebooklm_cli_estado_global_compartilhado.md` e `notebooklm_cli_opcoes_globais_vs_subcomando.md`, na memoria do molde). Pendencia nova: 7 obras (Bengel, Chemnitz, Cremer, Macchia, Schlatter, Stephenson, Warrington) com **0 caracteres gregos detectados** — possivel falha de OCR no alfabeto grego a investigar (mesmo padrao ja visto com Harris e Bauckham).|
| 09-13/08/2026 | 0→1 | **Fase 0 fechada e Fase 1 inteira executada.** Fase 0: Unidade 13 excluída (declarada como borda em U14), `heb.traineddata` instalado, curadoria por tier fechada (82 fontes), 10 sentinelas migradas e verificadas. Dois bugs reais corrigidos no `checagem_retomada.ps1` (contagem lia notebook errado por estado global da CLI; parsing do notebook_id). Rótulo **JDD** criado com 3 mecanismos: trava de janela única, hash do estado do notebook, ping de autenticação no SessionStart. Fase 1: os 16 prompts + relatório consolidado, com auditoria em 11 deles. **Achado central:** em 5 casos onde se pôde comparar, a caracterização que os críticos fazem do adversário precisou de correção sempre que a fonte primária existia (Dunn, Käsemann ×2, Irons) e foi inverificável quando faltava (Sanders, Osiander). **Achado do lote noturno:** o Filipenses de Hawthorne estava oculto dentro da `WBTheme_Collection_15vol` — lacuna de Filipenses rebaixada de total para parcial. Falso negativo do RAG detectado e corrigido por conferência em disco (Ambrosiaster/séc. IV).|

---

## Próxima ação

**Sempre começar por aqui, após qualquer pausa:**

```powershell
cd C:\Users\admintrt9a\Projetos\Justica-de-Deus
powershell -ExecutionPolicy Bypass -File _scripts\checagem_retomada.ps1
```

**Fila de trabalho:**

0-A. 🔴 **Backup remoto — REGRA ATIVA, PENDENTE.** Todos os arquivos do projeto
   devem ir para o Google Drive na conta **`alessandrocrianca@gmail.com`**.
   **Ela NÃO está montada nesta máquina.** G: é `alessandrosouza@trt9.jus.br`
   (institucional) e H: é `alessandronuvemti@gmail.com`. ⛔ **Não apontar o backup
   para G: nem H:.** Ver `_LOG_EXECUCAO.md` §3.
0. ✅ **Conta/perfil — corrigido em 05/08/2026.** `subir_reocr.ps1` agora le
   `perfil.config.txt` (`default`) e `projeto.config.txt`
   (`notebooklm_notebook_id=`) automaticamente, passa `-p default` global e
   `-n <id>` em cada chamada individual de `source list/add/delete` — nao
   depende mais de `notebooklm use` nem do perfil ativo global. Ver
   `_LOG_EXECUCAO.md`, seção "Conta e perfil".
0-B. **Ler `ESCOPO_JUSTICA_DE_DEUS.md`** — este projeto é **temático**, não de livro.
   Sem ele, os documentos herdados do molde induzem a tratar as 14 unidades como
   capítulos de um livro que não existe.
1. ✅ **Decidido em 09/08/2026: a Unidade 13 (justiça social) sai do projeto.**
   Declarada como borda no capítulo de síntese (U14) — ver
   `ESCOPO_JUSTICA_DE_DEUS.md` §9.2 e `LACUNAS_REFUTACAO.md`. Projeto
   passa de 14 para **13 unidades ativas**.
2. ✅ **`heb.traineddata` instalado em 09/08/2026** — baixado via WebFetch,
   copiado para `Program Files\Tesseract-OCR\tessdata\` pelo usuário (exigia
   admin). Confirmado por `tesseract --list-langs`. Anel 2 (U07–U10) liberado.
3. **Fase 0** — seguir `FASE_0_CHECKLIST.md`, etapa por etapa.
   - ✅ **Etapa 3 (curadoria por tier) fechada em 09/08/2026** — as 82
     fontes do notebook agora têm tier em `CURADORIA_FONTES_JUSTICA-DE-DEUS.md`
     (número corrigido de 109 para 82 — ver nota na tabela "Estado atual" acima).
   - ✅ **Etapa 9 (pauta de refutação)** em execução ativa desde 05/08 —
     `LACUNAS_REFUTACAO.md` com 4 consultas reais já rodadas.
   - ✅ **Etapa 4 (sentinelas) fechada em 09/08/2026** — as 4 últimas
     (Turmerlebnis, Qumran/obras da lei, Ambrosiaster, genealogia da NPP)
     verificadas por consulta real. `verificar_sentinelas.ps1` retorna
     **exit 0, PRONTO — 10 sentinelas**. R9 migrou com correção: a cláusula
     "mais antigo comentário latino a Romanos" não tem base no corpus e foi
     removida da formulação. **Fase 0 tecnicamente completa.**
4. ✅ **`PAUTA_DR_NOMES_COLHIDOS.md`** — varredura de presença feita em
   09/08/2026: 7 das 21 obras já convertidas (Stendahl, Schlatter, Campbell,
   Chemnitz, Gathercole, Oberman, Irons — este último confirmado presente
   apesar de listado como pauta), 3 só na biblioteca (Barclay, Gaventa,
   Keener — não convertidas), 11 ainda ausentes (Hays, Ridderbos, Vos,
   Gaffin, Jewett, Thielman, Hooker, Bates, Fee, Perkins, Ambrosiaster,
   Kolb & Wengert). Cremer **já confirmado no notebook** desde 05/08.
5. Fase 1 — Prompt 1 (a raiz צדק) e seguintes, por `fase1-introducao\prompts_JD.md`.
