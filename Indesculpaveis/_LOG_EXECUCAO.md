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

## 3. Fase 0 iniciada (04/10/2026)

PR #1 incorporado à `main`; branch reiniciada a partir dela.

**O que se fez daqui (sessão em nuvem, sem a máquina Windows, sem a CLI do
NotebookLM, sem a biblioteca):**

| Etapa | Feito | Não feito, e por quê |
|---|---|---|
| 1 — perfil Pro | `_scripts/etapa1_perfil_pro.ps1` (ASCII, simula por padrão, não troca o perfil global, confere a conta na saída do `auth check`) — **não testado** | o login exige o navegador e a CLI da sua máquina |
| 2 — biblioteca | nota de FRONTEIRA JDD no checklist | a cópia do acervo JDD não pode ser feita por script do IND ("não entra") |
| 3, 6 — conversão, notebook | — | dependem da máquina local |
| 4 — sentinelas | — | **nenhuma migrada**: a verificação exige consulta + disco (NA28, Metzger, obras). Migrar sem isso seria a luz verde falsa |
| **5 — relatório-semente** | ✅ `semente/AUDITORIA_CAP1_S13-15.md` + `semente/Relatorio_Cap1_S13-15_auditado_IND.md` | itens A1–A11 aguardam a biblioteca |

**Achados da Etapa 5, além de S11 e S12:** 9 erros conferíveis no texto do
Cap1 — Gn 1.27 dado como "segundo dia"; 3.23 citado como "3.9–20"; κακοηθείας
posto no início do Bloco III; τὰ αὐτά atribuído a 1.32; o contexto de
Sl 106.41 trocado (bezerro de ouro é 106.19-20); transliteração inventada de
Sl 81.13; Oolá por Oolibá em Ez 23.28; três descrições incompatíveis da
"progressão"; φθόνος confundido com ἐπιχαιρεκακία. E um parágrafo sem fonte
sobre "as sinagogas", removido por tom e por risco de anti-judaísmo (L6).

**Lição para o molde:** o relatório do Cap1 passou pelos seus próprios
checkpoints "✓" com esses erros. Checkpoint de autoavaliação não é auditoria.

## 4. Auditoria das seções 10–12 do Cap1 (06/10/2026)

Executada por leitura integral (Rm 1.18–23). **17 erros** (E10–E26), 15 rótulos
rebaixados, 54 marcas no texto, 22 itens a conferir (A12–A33). Detalhe em
`semente/AUDITORIA_CAP1_S10-12.md`.

**Os três achados mais graves:** (1) Tomás de Aquino caracterizado como quem
chega à **essência divina** pela razão natural e a uma teologia natural
"salvífica" — o contrário do que ele ensina (E16–E17); (2) a "imagem verdadeira"
a ser adorada seria "o homem" (E24); (3) Jr 2.5 e 2Rs 17.15 dados como
idolatria "dos gentios", quando falam de **Israel** (E21) — o que tensiona a
leitura de 1.18-32 como "primariamente gentia".

**Nota de método:** os erros foram identificados de memória do grego e da
literatura, **não** por consulta ao NA28/Rahlfs/obras. Reconferir cada um na
Etapa 4. Nenhuma sentinela migrou.

**Padrão:** erro de **citação de passagem** (versículo, forma verbal, texto de
salmo) com a mesma segurança dos acertos. Seções 1–9 e 16 do Cap1 continuam não
auditadas e **não devem entrar** no notebook.

## 5. Prompts dos quatro anéis (06/10/2026)

`aneis/PROMPTS_COMUM.md` + `anel1..4_prompts.md`: 20 consultas de Deep Research
(sempre com o cabeçalho "quais objeções progressistas este texto atrai?" e busca
dos dois lados), a R4 trocada em cada anel, as três consultas (C1 exegética ·
C2 verificação · C3 refutação dirigida) e os 11 artefatos de mídia por anel.

**Decisões de desenho:**
- Os prompts **incorporam as correções da auditoria** do Cap1 (p. ex., o anel 3
  manda tratar Sl 106.20, Jr 2.5/2.11, 2Rs 17.15 e Dt 4.15-19 como textos sobre
  **Israel**; o anel 4 avisa que Tomás não afirma que a razão alcance a
  essência divina, e que Barth é aliado que diverge).
- **Escopo da DR:** nenhuma consulta trata de 1.26-27 (pertence ao Prompt 8 IND e
  ao anel 3 do piloto 1.28-32): evita poluir os cadernos.
- Cada anel traz **sentinelas em jogo** e **o que fica de fora**.

**Limites declarados:** a trava comum é a do IND (a `_trava_comum` original não
está neste repositório); a sintaxe da CLI é esboço; vários nomes de obra
estão marcados "verificar" (Das, Bassler, Allison, Lloyd-Jones, Tilling…) —
vieram de memória e a Deep Research os confirma ou os descarta.

## 6. Roteiro de verificação das sentinelas (06/10/2026)

`_artifacts/ROTEIRO_VERIFICACAO_SENTINELAS.md`: para S1–S14, a afirmação, o
risco, o método de conteúdo (consulta pronta), o método de fonte/disco, o
critério de migração e **os arquivos a corrigir se o rascunho falhar**. Ordem
em 5 lotes (A: só NA28 · B: léxico e LXX · C: leitura de comentários · D: Dodd,
Hanson, Hooker · E: as duas sentinelas sobre o Cap1). Registro de migração
incluído.

**Achado ao escrevê-lo:** a atribuição de **S8** (Bultmann, 1947, 2.1 como
glosa) vem de **memória** e **nunca foi vista em fonte**. Ela foi usada como
fato em `prompts_indesculpaveis.md` (Prompts 2 e 11), em `anel1_prompts.md`
(DR-1.1), em `ESCOPO_INDESCULPAVEIS.md`, em `ESTRATEGIA_ANEIS_INDESCULPAVEIS.md`
e em `sentinelas_IND.md` (conferido por `grep -i glosa`). O roteiro lista todos
para correção se a verificação a derrubar. Outras atribuições com
interrogação no rascunho (S10: "Fitzmyer? Moo?"; S13: "Moo?") **não devem ser
nomeadas** sem leitura.

## 7. Tentativa de verificar a S8 (07/10/2026)

Pedido do usuário: verificar a S8 primeiro. **Resultado: não verificada; não migrada.**

- **O que impediu:** nenhuma fonte primária acessível. Cambridge, biblia.com,
  dokumen.pub, vridar.org, earlywritings.com e peterkirby.com estão bloqueados no
  ambiente; sobraram resumos de busca (que são gerados a partir de páginas que não
  pude abrir).
- **O que os resumos indicam:** *TLZ* 72 (1947), col. 197–202; 2.1 entre as
  "glosas" (notas marginais) de Bultmann, com 7.25b, 8.1, 10.17, 13.5; 2.16 e
  6.17b como interpolações. **Isto sustenta a atribuição da S8 mais do que a
  contradiz, mas não a verifica.**
- **Matiz que muda a formulação:** em Bultmann "glosa" (nota marginal) ≠
  "interpolação". A sentinela deve falar em "glosa", e a lista de versículos é
  mais ampla do que "2.1".
- **Achado novo:** a busca trouxe **W. O. Walker, "Romans 1.18–2.29: A Non-Pauline
  Interpolation?", *NTS* 45 (1999)** — uma objeção de **muito maior alcance** que a
  de Bultmann (toda a perícope, com argumento de Marcião). Não estava na pauta.
  Entrou como **L9** em `LACUNAS_REFUTACAO.md`, como item 7 do Prompt 1 e na
  DR-2.1 do anel 2. **Título, autoria e conteúdo não verificados.**
- **Para fechar:** ler o artigo de Bultmann, ou Käsemann/Fitzmyer/Jewett *ad* 2.1,
  e conferir (a) 2.1 inteiro ou parte, (b) o argumento, (c) "o consenso rejeita" —
  esta parte **não tem nenhum apoio** até agora.

## 8. Verificação das sentinelas S1–S5 (08/10/2026)

Pedido: verificar S1–S5 pelo NA28. **O NA28 não esteve acessível** (texto protegido;
academic-bible.com não abre daqui; sem biblioteca). Usei SBLGNT+MorphGNT, Nestle 1904 e
Robinson–Pierpont, e o **aparato do SBLGNT, que registra a leitura do NA28** onde as
edições divergem. Detalhe e vereditos: `_artifacts/VERIFICACAO_S1-S5.md`; script:
`_scripts/verificar_s1_s5_edicoes_abertas.py`.

| # | Veredito |
|---|---|
| S1 | ❓ não decidida (o texto grego não decide; indício de segunda mão) |
| S2 | ✅ só Rm 1.20 e 2.1, nas três edições |
| S3 | ✅ παρέδωκεν 1.24/26/28; ἤλλαξαν 1.23; μετήλλαξαν 1.25/26 |
| S4 | 🟡 NA28 não lê πορνείᾳ nem ἀσπόνδους; "TR", "secundárias" e testemunhas abertas |
| S5 | 🟡 3 grupos sintáticos ✔; **contagem corrigida: 21 crítico / 23 bizantino (não "22")** |

**Nenhuma migrada:** falta o método de conteúdo (notebook) e a edição pedida (NA28);
aceitar as substitutas é decisão do usuário.

**Erro meu corrigido durante a verificação:** a primeira versão da busca ignorou
acentuação e normalização Unicode e deu resultados incompletos (ἀναπολογήτους de 1.20
não casava; os lemas do Nestle 1904 vêm em outra forma Unicode). Refeita antes de qualquer
conclusão.

**Efeito nos outros arquivos:** corrigidos o rascunho S5, o roteiro, o Prompt 9 e a DR-1.3
(contagem); marcados no Prompt 2 os pontos **sem variação entre edições** (1.32, 2.2, 3.9), que o
projeto supunha existir. **Correção ao roteiro:** os limites do P46 ("8.15–15.9; 16.25-27") eram
de memória; o indício aponta 15.11 e não confirma 16.25-27.

## Pendências abertas

- Ambiente: perfil da CLI para a conta Pro; login da Pro (bloqueio do
  `rookie_cookies.pyd`); `patch_rpc_limit.ps1` para a CLI 0.8.4.
- Fase 0: Etapas 1–4 e 6–8 (máquina local); A1–A33 da Etapa 5; seções 1–9 e 16 do Cap1 sem auditoria.
