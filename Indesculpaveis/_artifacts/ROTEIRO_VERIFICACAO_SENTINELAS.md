# Roteiro de verificação das sentinelas — Fase 0, Etapa 4

*Escrito em 06/10/2026. **Nenhuma sentinela foi verificada**: este roteiro só
prepara a verificação. Cada item diz o que checar, por **dois métodos
independentes**, e o que precisa acontecer para migrar para a tabela contada
de `sentinelas_IND.md`.*

## Regras do roteiro

1. **Dupla checagem (CLAUDE.md §0).** Cada sentinela exige **um método de conteúdo**
   (consulta ao notebook **ou** leitura da fonte) **+ um método de inventário/
   fonte primária** (NA28, BHS, Rahlfs, BDAG, a obra em disco). RAG sozinho nunca
   basta; `ls` sozinho nunca basta.
2. **A consulta confirma presença, nunca estabelece ausência (Regra 11).**
   "O notebook não contradisse" **não é** "verificado".
3. **Migrar é um ato.** Uma sentinela de cada vez, com o registro abaixo preenchido.
   **Se a verificação contradisser o rascunho, corrige-se o rascunho — e todos os
   arquivos que o usaram** (coluna "Se falhar").
4. **Origem declarada.** Tudo o que está nas colunas "Afirmação" veio de memória
   do redator (ou das auditorias do Cap1, que também foram de memória). **Trate
   cada uma como suspeita até a fonte primária dizer o contrário.**
5. **A fonte primária decide, não o relatório do Cap1 nem o Claude.** Os erros do
   Cap1 mostram o padrão: citação de passagem errada, dita com segurança.

## Pré-requisitos em `biblioteca\` (conferir antes de começar)

| Fonte | Para | Já tenho? |
|---|---|---|
| **NA28 / UBS5** (texto + aparato) | S1–S6, S8, S13 | ⬜ |
| **BHS** e **LXX Rahlfs-Hanhart** | S14 (e A31) | ⬜ |
| **Metzger, *A Textual Commentary on the Greek NT*** (2ª ed.) | S4, S8 | ⬜ |
| **BDAG** (e/ou LSJ) | S2, S6, S7 | ⬜ |
| **TDNT** (Lohse, προσωπολημψία) | S7 | ⬜ |
| Moo; Schreiner; Cranfield; Dunn; Jewett *ad* 1.29–2.3 | S5, S6, S8, S13 | ⬜ |
| Dodd (1932); Hanson (1957); Morris | S9 | ⬜ |
| Hooker (NTS 1960) | S10 | ⬜ |
| Agostinho (*De spiritu et littera*); Gathercole (*JSNT* 85) | S13 | ⬜ |
| Stowers; Thorsteinsson; Campbell | S11 | ⬜ |
| Brooten (1996); Hays (1986); Gagnon | S12 | ⬜ |

⚠️ **Os scripts `dossie.py`, `trecho.py` e `conferir_citacoes.py` são do JDD** e
não estão neste repositório. A **cópia** para `_scripts\` do IND é o ato de
entrada (FRONTEIRA). Sem eles, usar `grep -n` nos `.md` de `_processados_md\`.

## Ordem sugerida (do que depende só do NA28 ao que depende de obras)

| Lote | Sentinelas | Depende de | Esforço |
|---|---|---|---|
| **A** | S1, S2, S3, S4, S5 | NA28 (+ Metzger p/ S4) | minutos cada |
| **B** | S6, S7, S14 | BDAG/TDNT; BHS/Rahlfs | 1 consulta cada |
| **C** | S8, S13 | comentários; Bultmann; Agostinho; Gathercole | exige leitura |
| **D** | S9, S10 | Dodd, Hanson, Hooker | exige as obras |
| **E** | S11, S12 | as duas auditorias + obras de Stowers/Thorsteinsson/Brooten | por último |

**Mínimo para o anel 1: S1–S8 e S11** (lotes A, B, C parcial e E parcial).

---

## S1 — P46 e Rm 1–5

| Item | |
|---|---|
| **Afirmação** | P46 (Chester Beatty II) **não contém** Rm 1.1–5.16; o texto de Romanos começa em 5.17 |
| **Origem do risco** | já custou uma correção no Cap1 (Rm 1.7). O relatório, nas seções 10–15, a respeita |
| **Método 1 (conteúdo)** | consulta: *"Quais passagens de Romanos o P46 contém? O P46 é testemunha de algum versículo de 1.1–5.16?"* — classificar cada autor citado |
| **Método 2 (fonte)** | NA28, lista de manuscritos (Papyri); Metzger, *TCGNT*; Comfort & Barrett, *The Text of the Earliest NT Greek Manuscripts* |
| **Grep** | `grep -n -i "P46\|P\.46\|Chester Beatty" _processados_md/*.md` — e **ler** cada ocorrência |
| **Migrar quando** | NA28 **e** uma obra erudita concordam; o RAG não contradiz |
| **Se falhar** | corrigir `prompts_indesculpaveis.md` (Prompt 2, item 1), `CLAUDE.md` e `sentinelas_IND.md` |

## S2 — ἀναπολόγητος só em 1.20 e 2.1

| Item | |
|---|---|
| **Afirmação** | no NT, ἀναπολόγητος ocorre **só** em Rm 1.20 e 2.1 |
| **Método 1** | consulta: *"Liste TODAS as ocorrências de ἀναπολόγητος no NT. Diga se ἀπολογέομαι/ἀπολογία são o mesmo lema (não são)."* |
| **Método 2** | concordância do NA28 (Accordance/BibleWorks/Logos) **e** BDAG s.v. |
| **Grep** | `grep -n "ἀναπολόγητ" _processados_md/*.md` (OCR de grego é frágil: ver "Armadilha OCR") |
| **Migrar quando** | concordância e BDAG concordam |
| **Se falhar** | `ESCOPO` §5 e §0 (palavra-chave), Prompts 1, 3, 5, 11, anel 1 |

## S3 — παρέδωκεν ×3, ἤλλαξαν ×1, μετήλλαξαν ×2

| Item | |
|---|---|
| **Afirmação** | παρέδωκεν: 1.24, 1.26, 1.28. ἤλλαξαν: 1.23. μετήλλαξαν: 1.25 e 1.26. A "troca" de 1.28 é οὐκ ἐδοκίμασαν (não usa o verbo) |
| **Evidência já colhida** | o Cap1 troca ἀλλάσσω por μεταλλάσσω (E23): erro **real** do tipo previsto |
| **Método 1** | consulta: *"Cite o grego de Rm 1.23, 1.25, 1.26 e 1.28 e diga qual verbo de 'trocar' aparece em cada versículo."* |
| **Método 2** | NA28 (texto) — **ler os quatro versículos** |
| **Migrar quando** | a leitura do NA28 confere as cinco ocorrências |
| **Se falhar** | Prompt 7 (a tabela troca/entrega), anel 3 (flashcards) |

## S4 — o catálogo e a crítica textual (πορνείᾳ, ἀσπόνδους)

| Item | |
|---|---|
| **Afirmação** | πορνείᾳ (1.29) e ἀσπόνδους (1.31) são leituras secundárias (bizantino/TR); o texto crítico **não** as traz |
| **Método 1** | consulta: *"O texto crítico (NA28) lê πορνείᾳ em 1.29? E ἀσπόνδους em 1.31? Que testemunhas?"* |
| **Método 2** | **aparato do NA28** + Metzger *ad loc.* — as **testemunhas exatas** (o rascunho diz "a conferir") |
| **Migrar quando** | aparato e Metzger concordam; **registrar as testemunhas** (a sentinela as nomeia) |
| **Se falhar** | Prompt 2 (itens 2–3), Prompt 9, anel 1 (DR-1.3) |

## S5 — "4 blocos" do catálogo: dado do texto ou análise?

| Item | |
|---|---|
| **Afirmação** | a sintaxe dá **três** grupos (4 dativos com πεπληρωμένους; 5 genitivos com μεστούς; 12 acusativos); o "quarto bloco" (4 α-privativos) é **análise**, e a contagem (21; 22 com ἀσπόνδους) depende da crítica textual |
| **Método 1** | consulta: *"Como Moo, Cranfield e Dunn dividem o catálogo de 1.29-31? A divisão em 4 blocos vem do texto ou do intérprete? Quantos vícios cada um conta?"* |
| **Método 2** | **contar no NA28** (leitura do texto) e conferir nos comentários *ad loc.* |
| **Cuidado** | o rascunho conta 21 contando "ἐφευρετὰς κακῶν" e "γονεῦσιν ἀπειθεῖς" como **um** item cada — **explicitar o critério** ao migrar |
| **Migrar quando** | contagem própria + dois comentários concordam sobre o que é texto e o que é análise |
| **Se falhar** | Prompt 9 (item 2), anel 1 |

## S6 — θεοστυγεῖς: ativo × passivo

| Item | |
|---|---|
| **Afirmação** | uso clássico tende ao **passivo** ("odiados por Deus"); o contexto (lista de agentes) favorece o **ativo** para muitos — HIPÓTESE DEBATIDA |
| **Método 1** | consulta: *"Como Cranfield, Moo, Jewett e Dunn traduzem θεοστυγεῖς? Que argumentos usam? Há divisão entre conservadores?"* |
| **Método 2** | **BDAG/LSJ s.v.**; ocorrências fora do NT (a conferir: 1 Clemente, lista de vícios) |
| **Atenção** | o Cap1 atribui o sentido ativo a "Calvino, Hendriksen e Moo" (A5): **conferir cada um** |
| **Migrar quando** | léxico + três comentários; o rótulo (debatida) permanece |
| **Se falhar** | Prompt 9 (item 4), anel 1 (DR-1.4) |

## S7 — προσωπολημψία não vem da LXX

| Item | |
|---|---|
| **Afirmação** | a LXX traz a locução **πρόσωπον λαμβάνειν**; o substantivo composto parece formação do cristianismo primitivo, primeiro atestado no NT |
| **Método 1** | consulta: *"προσωπολημψία ocorre na LXX? Qual é o primeiro atestado do substantivo?"* |
| **Método 2** | **BDAG** e **TDNT (Lohse)** *s.v.* |
| **Cuidado** | "primeiro atestado" é afirmação de **ausência** — vale a dupla checagem: BDAG/TDNT **e** busca no TLG/Accordance, se acessível |
| **Migrar quando** | BDAG e TDNT concordam e a busca nas bases não encontra o substantivo antes do NT |
| **Se falhar** | Prompt 13 (item 3), anel 3 (DR-3.4) |

## S8 — Διό e a "glosa" de Bultmann  ⚠️ **a mais arriscada**

| Item | |
|---|---|
| **Afirmação** | Bultmann propôs 2.1 como glosa (1947), **sem apoio manuscrito**; o consenso rejeita |
| **Risco** | **a atribuição veio de memória e não foi vista em fonte.** É possível que Bultmann tenha proposto **outro** versículo (p. ex., 2.16) ou que a ideia seja de outro autor |
| **Método 1** | consulta: *"Quem propôs que Rm 2.1 (ou parte dele) é glosa? Cite o autor, a obra e a página no corpus. Se ninguém, diga NÃO ENCONTRADO."* |
| **Método 2** | **ler** Bultmann, "Glossen im Römerbrief", *TLZ* 72 (1947), col. 197–202 `[a conferir]`; e a discussão em Cranfield/Käsemann/Moo *ad* 2.1 |
| **Migrar quando** | o artigo de Bultmann **ou** dois comentários **confirmam** a atribuição — senão **reescrever a sentinela** (ex.: "alguns propuseram glosa em 2.x") |
| **Tentativa de 07/10/2026 (busca na web; sem acesso a nenhuma fonte primária)** | **NÃO migrada.** Cambridge, biblia.com, dokumen.pub, vridar.org, earlywritings.com e peterkirby.com estão **bloqueados** neste ambiente; só li resumos de busca. O que os resumos **indicam** (não é verificação): a referência é **Bultmann, "Glossen im Römerbrief", *TLZ* 72 (1947), col. 197–202**; ele trata **2.1** entre as "glosas" — notas marginais sentenciosas que resumem o pensamento de Paulo (com 7.25b, 8.1, 10.17, 13.5) —, e trata **2.16** e **6.17b** como **interpolações** (outra categoria). Uma citação independente ("Bultmann, 'Glossen,' 199f.") aparece em discussão de glosa sem que o resumo diga qual versículo. **Matiz que muda a formulação:** "glosa" em Bultmann ≠ "interpolação"; a sentinela deve dizer **"nota marginal/glosa"** e não confundir com o juízo sobre 2.16. **Continua faltando:** ler o artigo (ou Käsemann/Fitzmyer *ad* 2.1) e conferir (a) que 2.1 é **inteiro** ou só parte; (b) o argumento de Bultmann; (c) "o consenso rejeita" — **sem apoio nos resumos**. |
| **Se falhar, corrigir** | `prompts_indesculpaveis.md` (Prompt 2 item 7; Prompt 11 item 1d); `anel1_prompts.md` (DR-1.1); `ESCOPO_INDESCULPAVEIS.md`; `ESTRATEGIA_ANEIS_INDESCULPAVEIS.md`; `sentinelas_IND.md` (S8). *(Conferido por `grep -i glosa` em 06/10/2026.)* |

## S9 — Dodd e Hanson

| Item | |
|---|---|
| **Afirmação** | A. T. Hanson (*The Wrath of the Lamb*, 1957) **segue e amplia** a ira impessoal de Dodd: é **adversário**, não crítico dele |
| **Origem** | "lido no texto" pelo caderno παρέδωκεν (`../MEMORIA_CAP1.md`) — **mas num caderno de outro projeto** |
| **Método 1** | consulta (no caderno IND, depois de a obra entrar): *"Hanson cita e adota a tese de Dodd sobre a ira? Cite a passagem."* |
| **Método 2** | **ler** Hanson (cap. sobre a ira) no `.md` do IND: `grep -n -i "Dodd" <Hanson>.md` |
| **Migrar quando** | leitura da passagem em **disco do IND** (a leitura do Cap1 não conta: fronteira) |
| **Se falhar** | Prompt 4, `anel1_prompts.md`, auditoria §4 |

## S10 — Hooker e Adão em Rm 1

| Item | |
|---|---|
| **Afirmação** | a leitura adâmica de 1.18-32 é tese de **M. D. Hooker** (*NTS* 6, 1960), **disputada**; HIPÓTESE DEBATIDA |
| **Evidência já colhida** | o Cap1 apresenta o eco adâmico como INFERÊNCIA FORTE, sem atribuição (auditoria S10-12 §2) |
| **Método 1** | consulta: *"Quem sustenta a leitura adâmica de Rm 1.18-32 e quem a rejeita? Cite autor, obra e página."* |
| **Método 2** | **ler** Hooker; e Moo/Fitzmyer/Jewett *ad* 1.23 |
| **Atenção** | o rascunho cita "Fitzmyer? Moo?" como opositores **com ponto de interrogação** — **não migrar** sem nomear quem nega |
| **Migrar quando** | Hooker lido **e** um opositor nomeado lido |
| **Se falhar** | Prompt 6 (item 6), anel 3 (DR-3.5) |

## S11 — a identidade do interlocutor de 2.1  (sobre o relatório-semente)

| Item | |
|---|---|
| **Afirmação** | o relatório do Cap1 dá certeza "altíssima" à identidade **judaica** do interlocutor; o rótulo honesto é HIPÓTESE DEBATIDA (o judeu só é nomeado em 2.17) |
| **Evidência já colhida** | confirmada em **4 pontos** (S13-15 §1; S10-12 §2) — **já corrigida** nas versões auditadas |
| **Método 1** | consulta: *"Quem identifica o interlocutor de 2.1 como judeu, quem como gentio, quem como universal? Cite as obras."* |
| **Método 2** | **verificar a versão auditada** (`semente/`): nenhum "Altíssima" restante para a identidade; e as obras de Stowers e Thorsteinsson **em disco** (por título **e** sobrenome) |
| **Migrar quando** | as duas versões auditadas conferidas (`grep -n "Altíssima"` nas linhas de 2.1) **e** as obras localizadas (ou a lacuna declarada) |

## S12 — "equidade" e Brooten  (sobre o relatório-semente)

| Item | |
|---|---|
| **Afirmação** | o relatório trata Brooten como aliada na exegese e descreve o debate com "equidade acadêmica"; isso viola a Regra Zero; a objeção de Brooten é à **autoridade** do texto |
| **Evidência já colhida** | confirmada (S13-15 §1) |
| **Método 1** | consulta: *"Qual é, segundo Brooten (Love Between Women, 1996), a relação entre o que Paulo condena em Rm 1.26-27 e a autoridade do texto para hoje? Cite a passagem."* — **Regra 11-C**: não imputar posição sem ler a passagem inteira |
| **Método 2** | **ler** Brooten (a conclusão do capítulo sobre Paulo) em disco |
| **Atenção** | a descrição "rejeita a autoridade normativa… produto do patriarcalismo" veio do Cap1 e **não foi verificada** |
| **Migrar quando** | Brooten lida; a formulação da auditoria **ajustada** ao que ela de fato escreve |

## S13 — os gentios de 2.14-15

| Item | |
|---|---|
| **Afirmação** | o campo conservador **se divide**: Agostinho, Cranfield e Gathercole leem **cristãos**; outros (Moo?) leem **pagãos com obras isoladas** |
| **Método 1** | consulta: *"Como Cranfield, Moo, Schreiner, Dunn e Gathercole leem os gentios de 2.14-15 (pagãos ou cristãos)? Quem entre os conservadores discorda de quem?"* |
| **Método 2** | **ler** cada comentário *ad* 2.14-15, mais Agostinho (*De spiritu et littera* 26–28) e Gathercole (*JSNT* 85) |
| **Atenção** | o rascunho põe **"Moo?"** com interrogação: **conferir antes de nomear** |
| **Migrar quando** | cada posição atribuída foi **lida** na obra |
| **Se falhar** | Prompt 13 (item 5), anel 2 (DR-2.4), anel 4 |

## S14 — Is 52.5 em Rm 2.24

| Item | |
|---|---|
| **Afirmação** | em Is 52.5 o nome é blasfemado por causa do **exílio**; a LXX acrescenta δι' ὑμᾶς … ἐν τοῖς ἔθνεσιν; Paulo **reaplica** |
| **Método 1** | consulta: *"Qual é o contexto de Is 52.5 e como Moo/Watson explicam o uso em Rm 2.24? A LXX acrescenta algo em relação ao TM?"* |
| **Método 2** | **ler BHS e Rahlfs** de Is 52.5 (o TM e a LXX) |
| **Migrar quando** | TM e LXX lidos; um comentário concorda |
| **Se falhar** | Prompt 14 (item 3), anel 3 |

---

## Armadilha OCR (vale para S2–S6, S14)

Grego e hebraico vindos de OCR **não autorizam afirmar forma acentuada**
(REGRAS §4.6). O `grep` serve para **localizar** a passagem; a forma se **confirma no
PDF ou no NA28**. E **zero** caracteres gregos numa obra de estudos bíblicos é
**alarme** (Harris, Bauckham): medir antes de confiar no `grep`.

## Registro de verificação (um por sentinela, no momento da migração)

```
Sentinela: S__          Data: __/__/2026
Método 1 (conteúdo):  consulta __ (caderno <ID>, resposta salva em ...) → resultado: ...
Método 2 (fonte):     <obra, página/versículo, edição> → resultado: ...
Contradiz o rascunho? ( ) não  ( ) sim → corrigido em: <arquivos>
Rótulo final: ...
Formulação final (a que entra na tabela): ...
Verificado por: ...
```

Ao migrar: copiar a linha para a **Tabela verificada** de `sentinelas_IND.md` e
mover o rascunho para `Histórico`. Quando a tabela chegar a **8 sentinelas** (e
S11–S12 resolvidas), a trava da Etapa 4 se cumpre.
