# Justiça de Deus — delimitação de escopo e avaliação bibliográfica

*Escrito em 02/08/2026, antes de gerar o projeto. **Nada foi gravado ainda** — o
`novo_projeto.ps1` rodou só em `-Simular`. Este documento existe para que a
decisão de escopo seja tomada com os dados na mesa, não depois de 18 pastas
criadas.*

> **Aviso de método.** As avaliações bibliográficas abaixo foram feitas **contra
> os quatro arquivos enviados** e contra o `AQUISICOES.md` do molde. As
> divergências de data e atribuição que aponto na §2.3 são **conferíveis** e
> algumas estão marcadas `[a conferir]` — não as apresento como estabelecidas.
> Nenhuma consulta a NotebookLM foi feita: o notebook do projeto ainda não existe.

---

## 1. Ponto de partida: o molde é por livro, e este projeto não é

O `novo_projeto.ps1` pede `-Livro -Abrev -Capitulos`. A árvore, os 16 prompts da
Fase 1 e a Etapa 10 do `FASE_0_CHECKLIST` pressupõem **um livro com capítulos**:
autoria, data, proveniência, integridade textual, relação com os Sinóticos.

Para um tema transversal isso não serve como está. Mas o que **importa** do molde
— a Regra Zero, o padrão de cinco itens e suas exceções, a escala de certeza, o
protocolo anti-alucinação, as três consultas por unidade, os hooks de sentinela,
a camada local (`dossie.py`, `trecho.py`, `conferir_citacoes.py`) — é
**inteiramente agnóstico ao recorte**. A adaptação é de superfície, e está
detalhada na §6.

---

## 2. Avaliação das quatro bibliografias enviadas

### 2.1 O que veio

| Arquivo | Conteúdo | Estado |
|---|---|---|
| `Bibliografia_Justica_de_Deus_TABELA.xlsx` | **106 obras**, 8 colunas, aba de legenda com nota de direito autoral | ✅ o mais completo e o mais utilizável |
| `Bibliografia_Justica_de_Deus.md` | a mesma taxonomia em prosa, 11 seções (I–XI), 29,5 mil caracteres | ✅ redundante com o anterior, útil como texto |
| `Bibliografia_Justica_de_Deus.xlsx` | **22 obras**, 6 colunas | 🟡 subconjunto; recorte por tradição |
| `Autorobra-…-Pos.csv` | **20 linhas**, foco em Rm 1.16-17 e 3.21-26 | 🔴 **qualidade heterogênea — ver 2.3** |
| `Catalogo_…_Template_Profissional.xlsx` | 24 colunas, **200 linhas numeradas, 12 preenchidas** | ⬜ é um **template vazio**, não um catálogo |

⚠️ **O "Catálogo Profissional" não é uma bibliografia** — é uma grade de 24
campos com 188 linhas em branco. Como *ficha catalográfica* ele é excelente e
recomendo adotá-lo (§2.4); como *fonte* ele contribui 12 registros, todos já
contidos na TABELA.

### 2.2 A força — e ela é real

**Esta é a melhor situação de partida dos quatro projetos do molde.** O
`AQUISICOES.md` registra o padrão que atravessou João, Jeremias, Hebreus e
Romanos: *"a curadoria tende a montar biblioteca forte no lado que se defende e
fraca no lado que se refuta"*. Aqui isso **não** aconteceu no núcleo.

**O adversário está em fonte primária**, que é o item (1) do padrão de cinco e
foi exatamente o que travou o Capítulo 2 de Romanos:

| Adversário | Obra própria na lista | Cumpre o item (1)? |
|---|---|---|
| Käsemann | ensaio de 1961 **+** comentário | ✅ |
| Bultmann | *JBL* 83 (1964) | ✅ |
| Sanders | *Paul and Palestinian Judaism* (1977) | ✅ |
| Dunn | WBC 38 **+** *Theology of Paul* | ✅ |
| Wright | *WSPRS* (1997) **+** *PFG* (2013) | ✅ |
| Stuhlmacher | *Gerechtigkeit Gottes bei Paulus* (1965) | ✅ |

**E a resposta conservadora dedicada também está**: Piper, Seifrid, Westerholm,
Schreiner, Moo, e o *Justification and Variegated Nomism* de Carson/O'Brien/Seifrid.

**Segunda força, e é incomum:** a tabela de escolas que o `CLAUDE.md` §2-B manda
percorrer — Patrística · Reformada · Puritana · Pietista · Wesleyana · Pentecostal —
**nasce preenchível**. Nos projetos anteriores essa tabela ficou vazia. Aqui há
Bengel e Spener (pietismo), Wesley com quatro títulos e Collins/Maddox
(wesleyana), Macchia, Horton, Arrington, Yong, Land (pentecostal). Macchia,
*Justified in the Spirit* (2010), é a peça séria dessa coluna.

**Terceira:** McGrath, *Iustitia Dei*, cobre o eixo diacrônico inteiro; e Owen,
*A Dissertation on Divine Justice* (1653), mais Turretini cobrem a **justiça
retributiva** — o flanco que a literatura contemporânea sobre δικαιοσύνη θεοῦ
quase abandonou, e que a §Unidade 12 do meu recorte reabre.

### 2.3 As fraquezas — em ordem de consequência

**🔴 (a) O CSV não é bibliografia acadêmica em 7 das 20 linhas.**
As colunas de fonte trazem `pdfs.semanticscholar`, `bibliaplus`,
`conhecendodeus.com`, `youtubeacademia`, `biblehub+1`, `youtube`. E há três
entradas cujo autor é *"Diversos autores"*, *"Diversos – vários PDFs"*. Essas
**violam o item (1) do padrão** — fonte primária citada e **localizável**. Uma
pregação, um TCC de academia.edu e um vídeo não sustentam refutação.
→ *Destino:* Tier C no melhor caso, Tier D na maioria. Não descartar o CSV: as
linhas de Cranfield, Käsemann, Moo, Schreiner, Dunn, Barrett, Fitzmyer e Morris
são boas e trazem uma coluna que as outras listas não têm — **a posição exegética
declarada por autor**. Aproveitar essa coluna, podar o resto.

**🔴 (b) Cinco ausências que travam a refutação no ponto onde ela decide.**

| Ausente das 4 listas | Por que trava |
|---|---|
| **Irons, *The Righteousness of God*** (WUNT 2/386, Mohr Siebeck, 2015) `[ano/série a conferir]` | É a refutação **lexical** da leitura "fidelidade à aliança". A lista tem Wright e Dunn com obra própria e responde a eles no plano **teológico**. No plano lexical, que é onde a tese nasceu, não há resposta — e a tese ganha por ausência de contraditório. |
| **Cremer, *Die paulinische Rechtfertigungslehre*** (1899/1900) | É a **origem** da leitura relacional/aliancística. O item (3) do padrão manda atacar o **pressuposto**, não a conclusão. O pressuposto de Wright é Cremer. Sem Cremer, refuta-se a conclusão. |
| **Campbell, *The Deliverance of God*** (2009) | A herdeira radical de Käsemann e a tese da prosopopeia sobre Rm 1.18–3.20 — que é a **Unidade 02** inteira. Já constava como ausência crítica no `AQUISICOES.md` §2. |
| **Qumran em edição primária** (1QS X–XI; 1QH; **4QMMT**) | 4QMMT é onde מעשי התורה / ἔργα νόμου aparece — a pedra angular de Dunn. Há uma obra brasileira *sobre* Qumran na lista; obra sobre não é fonte primária. |
| **A objeção libertacionista em fonte primária** | Ex.: Elsa Tamez, *The Amnesty of Grace* — justificação lida em chave de libertação. É o alvo mais direto da Regra Zero, e o item (2) exige a objeção **na versão mais forte**. Hoje a lista só tangencia isso por Studebaker e Yong, que são pentecostais, não libertacionistas. |

**🟡 (c) A espinha verso-a-verso do Antigo Testamento não existe.**
Este é o **segundo padrão** do `AQUISICOES.md`, o de Hebreus: *"acervo forte em
monografia e obra devocional, fraco na espinha verso-a-verso"*. O Anel 2 do meu
recorte (Isaías 40–66, Salmos) tem apenas teologias bíblicas gerais — von Rad,
Eichrodt, Brueggemann. **Nenhum comentário técnico de Isaías ou dos Salmos.**
Monografia responde uma pergunta; comentário sustenta uma unidade.

**🟡 (d) Nenhum comentário de Gálatas.** Se Gl 2.16 e 3.10-14 entram (entram, na
Unidade 06), falta a base.

**🟡 (e) Concentração em Rm 1.17 e 3.21-26.** No CSV, 19 das 20 linhas tratam
desses dois textos. É o núcleo correto, mas a lista **não cobre** Rm 9.30–10.13,
2Co 5.21 e Fp 3.9, que são onde a locução se decide contra a leitura aliancística.

### 2.4 Erros checáveis já detectados nas listas

*Registro-os porque são exatamente a classe de coisa que o projeto existe para
não produzir — e porque três deles viram sentinela na §7.*

| # | O que a lista diz | O problema |
|---|---|---|
| 1 | CSV: *"Lutero — Prefácio à Epístola aos Romanos (1522)"* como fonte da justiça forense | O relato da **Turmerlebnis** está no **Prefácio às obras latinas, 1545** — que a TABELA registra corretamente e em separado. São dois textos, com 23 anos entre eles. Citar o de 1522 como relato da descoberta é erro conferível em trinta segundos. |
| 2 | CSV: Käsemann, *Commentary on Romans*, **1980** · TABELA: *An die Römer*, **1973** | **As duas estão certas, sobre objetos diferentes**: o alemão é 1973, a tradução inglesa 1980. Mas a paginação difere — e paginação diferente **quebra citação**. Decidir qual edição entra no corpus e registrar. |
| 3 | TABELA: *"Koch, Klaus — Verbete ṣdq, TDOT vol. XII"* | `[a conferir — confiança média]` O verbete **ṣdq** do *TDOT* XII é de **B. Johnson**. Koch assinou o verbete **ṣdq no THAT** (Jenni–Westermann). Se estiver trocado, a citação leva ao verbete errado. |
| 4 | TABELA: JDDJ 1999, *"adesões Metodista 2006, Reformada/Anglicana 2017"* | `[a conferir]` A adesão anglicana costuma ser datada de **2016**, e a da Comunhão Mundial de Igrejas Reformadas de 2017. As duas parecem fundidas numa linha. |
| 5 | TABELA: Orígenes, *Comentário a Romanos*, "c. 244" | O texto sobrevive sobretudo na **tradução latina de Rufino** (c. 405-406), que é notoriamente livre. Citar "Orígenes sobre Rm 1.17" é, salvo nos fragmentos gregos de Tura, citar **Rufino**. A lista não sinaliza isso. → **Sentinela 5.** |

**Recomendação de ficha:** adotar as 24 colunas do *Catálogo Profissional* como
esquema do `CURADORIA_FONTES_JUSTICA-DE-DEUS.md`, **acrescentando três colunas**
que o molde exige e ele não tem: `Tier (S/A1/A2/B/C/D)`, `Presente no acervo?` e
`Conferido? [conferido|não conferido]` — esta última é a lição do
`LACUNAS_REFUTACAO.md`, onde uma tabela feita de memória saiu **invertida**.

---

## 3. Os círculos concêntricos

### Círculo 0 — o núcleo duro: a locução

**Grego.** δικαιοσύνη θεοῦ e variantes: Rm 1.17; 3.5; 3.21; 3.22; 3.25; 3.26;
10.3 (duas vezes); 2Co 5.21; Fp 3.9 (τὴν ἐκ θεοῦ δικαιοσύνην).
**Fora de Paulo, a mesma locução:** Mt 6.33; Tg 1.20; 2Pe 1.1.

**Hebraico.** צֶדֶק / צְדָקָה predicados de YHWH: Sl 71.15-19; 98.2; 143.1,11;
Is 45.21-25; 46.13; 51.5-8; 56.1; Dn 9.7-16.

> Este círculo é **inegociável**. Qualquer recorte o contém inteiro.

### Círculo 1 — o campo semântico imediato

- **Hebraico:** צדק · צדקה · **משפט** · חסד · אמת/אמונה · ישועה · ישר · תמים
- **Grego:** δικαιοσύνη · δίκαιος · **δικαιόω** · δικαίωμα · δικαίωσις ·
  δικαιοκρισία · ἀδικία
- **O par מִשְׁפָּט וּצְדָקָה** como hendíadis da ordem social: Gn 18.19; Sl 33.5;
  Is 5.7; Jr 22.3; Am 5.24.
- **A ponte da LXX**, que é onde o mal-entendido nasce: צדקה traduzida ora por
  δικαιοσύνη, ora por **ἐλεημοσύνη** (misericórdia/esmola) — p. ex. Dt 6.25;
  24.13; Is 1.27 `[a conferir versículo a versículo]`. É essa alternância que dá
  a Wright e a Dunn a base para "justiça = fidelidade que salva", e é aqui que
  Cremer e Irons se enfrentam.

### Círculo 2 — os *loci* que o tema governa

Justificação forense · imputação · ἱλαστήριον e expiação (Rm 3.25) · ira de Deus
(Rm 1.18) · juízo segundo obras (Rm 2.6-16) · lei e "obras da lei" · πίστις
Χριστοῦ · união com Cristo · santificação · **teodiceia** (Rm 3.5; 9.14).

> **Ponto de decisão:** teodiceia e juízo final são *parte do tema* ou *tema
> vizinho*? Eu os incluo (Unidade 12), e explico por quê na §5.

### Círculo 3 — os corpora bíblicos, com peso

| Anel | Textos | Peso |
|---|---|---|
| **Núcleo** | Rm 1.16-17; 1.18–3.20; 3.21-31; 4; 9.30–10.13 · Gl 2.15-21; 3.10-14 · Fp 3.2-11 · 2Co 5.21 | 🔴 máximo |
| **Forte** | Is 40–66 · Sl 51, 71, 98, 103, 143 · Gn 15.6; 18.19,25 · Dt 6.25; 9.4-6; 24.13; 25.1 · Hc 2.4 · Dn 9 | 🔴 alto |
| **Médio** | Mt 5–6 · Tg 2.14-26 · Lc 18.9-14 · Am · Mq 6.8 · Jó · Pv · Ec 7.20 | 🟡 |
| **Externo** | Ap 15.3; 19.11; 20.11-15 · 1Jo 1.9 · Hb 7.2; 11.7 · 2Pe | 🟡 baixo |
| **Fora** | Ester, Cantares, narrativa histórica sem vocabulário de justiça | ⬜ |

### Círculo 4 — o fundo do Segundo Templo

**Não é opcional: é onde a Nova Perspectiva se decide.**
Qumran (1QS X–XI, com צדקת אל; 1QH; **4QMMT**) · 4 Esdras 7–8 · 2 Baruc ·
Salmos de Salomão 9 · Sabedoria 5 · Sirácida 44.19-21 · Jubileus 23 · Filo · Josefo.

> Sanders reconstruiu o "nomismo pactual" a partir deste corpus; Carson/O'Brien/
> Seifrid responderam **a partir do mesmo corpus**. Sem ele, a discussão vira
> troca de autoridades.

### Círculo 5 — a história da interpretação

Patrística (Orígenes/Rufino · Crisóstomo · **Agostinho**, e a fratura latina de
*iustificare* = *iustum facere*) → Medieval (Anselmo · Tomás) → **Trento, Sessão
VI (1547)**, decreto e cânones → Reforma (Lutero · Melanchthon · Calvino · a
controvérsia com **Osiander**) → Ortodoxia (Fórmula de Concórdia III ·
Westminster XI · Turretini · Owen) → Wesley → **Cremer (1899)** → Bultmann ·
**Käsemann (1961)** · Stuhlmacher → **Sanders (1977)** → Dunn · Wright →
a resposta (Westerholm · Seifrid · Piper · Gathercole · **Irons**).

### As bordas — o que fica de fora, e declarado

Justiça **entre humanos** sem predicação divina · ética social como tema autônomo
· doutrina da expiação como *locus* completo · escatologia geral · o problema
filosófico do mal fora de Rm 9.

⚠️ **Borda declarada não é borda ignorada.** O erro que o molde persegue é
harmonizar em silêncio; o equivalente aqui é **excluir em silêncio**. Cada borda
entra no relatório como exclusão nomeada, com a razão.

---

## 4. Os cinco eixos que decidem o recorte

| Eixo | A pergunta | Por que decide o escopo |
|---|---|---|
| **A — sintático** | O genitivo θεοῦ é subjetivo, objetivo, de origem, possessivo ou de autor? | Se de **origem** ("justiça que vem de Deus"), o projeto é soteriológico e o Anel 2 é pano de fundo. Se **subjetivo** ("a justiça de Deus agindo"), o AT vira o eixo. |
| **B — semântico** | Atributo distributivo · fidelidade à aliança · poder salvador escatológico · dom/status? | Determina se Is 40–66 é **raiz** ou é **ilustração**. |
| **C — soteriológico** | Forense-declaratório ou transformativo-efetivo? | Decide se a Unidade 11 (Mateus/Tiago) é núcleo ou borda. |
| **D — canônico** | Paulo é a medida do AT, ou o AT é a medida de Paulo? | É o eixo que separa a leitura reformada da NPP — e a resposta muda a **ordem** das unidades. |
| **E — social** | A justiça de Deus implica justiça social? | Decide se a Unidade 13 existe. **Regra Zero incide aqui em cheio.** |

> ⚠️ **Um projeto exegético não deve decidir os eixos A–E antes de pesquisar** —
> seria petição de princípio. O que a *linha editorial* fixa é o **desfecho
> esperado** (forense-imputativo, na tradição de Turretini, Owen, Murray,
> Westerholm, Seifrid). O que o **escopo** precisa fixar agora é apenas se os
> textos que decidem cada eixo estarão no corpus. Nas três opções abaixo, estão.

---

## 5. Três opções de recorte

### Opção A — núcleo paulino estrito · **8 unidades** · 10 notebooks

Só o Círculo 0 + Anel 1, com o AT como pano de fundo dentro das unidades paulinas.

**A favor:** rápido; a bibliografia enviada cobre ~90% disso sem compra nenhuma
além de Irons e Cremer.
**Contra:** deixa **fora** os dois flancos por onde a crítica entra — a justiça
social (eixo E) e o juízo retributivo. Fechar o projeto sem eles é fechar em
"há debate", que é o que a Regra Zero proíbe. **Não recomendo.**

### Opção B — canônica plena · **20 unidades** · 22 notebooks

Do Pentateuco ao Apocalipse, cada corpus com unidade própria.

**A favor:** nada fica de fora; o eixo D se decide com o AT inteiro na mesa.
**Contra:** a Fase 0 sozinha vira um projeto. Exige comentário técnico de Gênesis,
Deuteronômio, Salmos, Isaías, Jeremias, Amós, Mateus, Tiago e Apocalipse — o
`AQUISICOES.md` mostra que a espinha verso-a-verso é justamente o que falta, e
Hebreus provou o custo. **Desproporcional ao acervo atual.**

### ✅ Opção C — dois anéis: núcleo forense + bordas declaradas · **14 unidades** · 16 notebooks

**Recomendada.** Trata o núcleo com profundidade exegética plena e trata as
bordas como unidades **próprias e menores**, cuja função é fechar o flanco:
demonstrar que a leitura forense não ignora esses textos, mas os situa.

**Anel 1 — o núcleo paulino (6)**

| # | Unidade | Textos |
|---|---|---|
| 01 | A tese | Rm 1.16-17 |
| 02 | A justiça que condena — e a tese da prosopopeia (Campbell) | Rm 1.18–3.20 |
| 03 | A manifestação e o ἱλαστήριον | Rm 3.21-26 |
| 04 | Abraão e a imputação | Rm 3.27–4.25; Gn 15.6 |
| 05 | A justiça própria e a justiça de Deus | Rm 9.30–10.13 |
| 06 | O restante do corpus paulino | Gl 2.15-21; 3.10-14; Fp 3.2-11; 2Co 5.21 |

**Anel 2 — a raiz vetero-testamentária (4)**

| # | Unidade | Textos |
|---|---|---|
| 07 | Torá: justiça, aliança e o forense | Gn 15.6; 18.19,25; Dt 6.25; 9.4-6; 24.13; 25.1 |
| 08 | Salmos: a justiça que salva e a que não entra em juízo | Sl 51; 71; 98; 103; 143 |
| 09 | Isaías 40–66: o eixo צדק ‖ ישועה | Is 45.21-25; 46.13; 51.5-8; 53.11; 56.1; 61.10 |
| 10 | Profetas e Sabedoria | Am 5.24; Mq 6.8; Hc 2.4; Dn 9.7-16; Jó; Pv |

**Anel 3 — as bordas, declaradas e fechadas (4)**

| # | Unidade | Função |
|---|---|---|
| 11 | Justiça como conduta: Mt 5–6; Tg 2.14-26 | a mesma palavra, outro referente — **eixo C** |
| 12 | Justiça retributiva e juízo: Rm 2.6-16; Ap 19.11; 20.11-15 | reabre o flanco que a literatura contemporânea abandonou; é onde Owen e Turretini rendem |
| ~~13~~ | ~~Justiça de Deus e justiça social~~ | ⛔ **Excluída em 09/08/2026** — sem fonte primária do adversário no corpus. **Declarada como borda no capítulo de síntese (U14)**, não omitida. Ver §9 item 2 |
| 14 | Síntese sistemática: atributo · ação · dom | fecha, e percorre as seis escolas — **inclui a declaração da borda da U13 excluída** |

**Fase 1 — 16 prompts introdutórios, re-cortados para tema** (a grade de livro
não serve): Bloco A lexical (raiz צדק no AOP · δικαι- na LXX · a ponte
צדקה→ἐλεημοσύνη · campo semântico vizinho) · Bloco B sintático-semântico (o
genitivo θεοῦ · δικαιόω declarativo ou causativo · inventário das ocorrências ·
a locução fora de Paulo) · Bloco C fundo do Segundo Templo (Qumran · 4QMMT ·
apocalíptica · rabinismo) · Bloco D história da interpretação (patrística e a
fratura de *iustificare* · Trento · Reforma e ortodoxia · Cremer→Käsemann→Sanders→
Wright→resposta).

---

## 6. O que muda no molde — deltas concretos

| # | Delta | Detalhe |
|---|---|---|
| 1 | Parâmetros | `-Livro "Justica-de-Deus" -Abrev "JD" -Capitulos 14 -Idioma "grego" -CodIdioma "grc"` |
| 2 | **Não renomear `fase2-capitulos\`** | Os **hooks** são agnósticos (casam só `/saidas/`), mas o `settings.json` fixa `fase2-capitulos/*/…` no allowlist de escrita. Renomear não quebra a trava de sentinela — **quebra a permissão**. Adaptar a prosa, manter o caminho. |
| 3 | `CLAUDE.md` §0, §1, §2 | "JD 1–14" → "14 unidades temáticas"; "exegese capítulo a capítulo" → "unidade a unidade". A §2-B fica **intacta** (é a Regra Zero). |
| 4 | `prompts_JD.md` | **Substituição integral** pela grade da §5. A grade de livro (autoria, data, proveniência, integridade textual) não se aplica. |
| 5 | `FASE_0_CHECKLIST` Etapa 10.0 | Mantida e **reforçada**: aqui ela é a etapa de maior retorno, porque cada unidade traz adversário novo (Campbell na 02, Dunn na 05, Tamez na 13). |
| 6 | 🔴 **Idioma duplo** | O molde assume **um** `-CodIdioma`. O Anel 2 exige hebraico. E o `INICIAR_AQUI.md` registra que **`heb.traineddata` não está instalado nesta máquina**: o tesseract emite `Failed loading language` em stderr e **segue sem ele**, produzindo hebraico por aproximação — falha silenciosa. **Instalar antes da Etapa 5.** |
| 7 | Curadoria | Adotar as 24 colunas do *Catálogo Profissional* + `Tier`, `Presente no acervo?`, `Conferido?` |
| 8 | Sentinelas | Reordenar as sete fontes de erro: num tema, a nº1 (manuscritos/papiros) rende pouco e a **nº3 (polissemia)** rende quase tudo. |

---

## 7. Sentinelas — rascunho a verificar

> O molde diz, com razão, que **não pode gerar sentinelas** — elas exigem
> conhecer o objeto. Eu conheço este tema o bastante para **propor** oito, mas
> elas entram como **rascunho**: cada uma precisa passar pela consulta de
> verificação antes de valer. O critério de saída são 6; proponho 8 para que
> sobrem 6 depois da poda.

| # | Sentinela | O que NÃO fazer | Classificação correta |
|---|---|---|---|
| 1 | O genitivo θεοῦ | dizer que a **gramática** decide entre subjetivo/objetivo/origem | a gramática **não decide**; o caso é indeterminado e a decisão é contextual — HIPÓTESE DEBATIDA |
| 2 | δικαιόω | argumentar que verbo em -όω **não pode** ser causativo, logo é declarativo | verbos em -όω **são** frequentemente factitivos; o argumento correto é de **uso forense na LXX** (Êx 23.7; Dt 25.1; Pv 17.15), não de morfologia — INFERÊNCIA FORTE |
| 3 | Käsemann | tratá-lo como quem defendeu "justiça da aliança" | isso é **Wright**. Käsemann sustenta poder salvífico **apocalíptico**. E Käsemann rompeu com Bultmann — não são a mesma posição |
| 4 | Bultmann | contá-lo como aliado por defender a leitura "dom" | ele chega ao **mesmo resultado por caminho existencialista**, não forense. **Aliado aparente não é aliado**; rótulo obrigatório |
| 5 | Orígenes sobre Romanos | citar "Orígenes" a partir do texto latino sem ressalva | o que sobrevive é, em geral, a **tradução de Rufino** (c. 405/6), notoriamente livre; grego só nos fragmentos de Tura — DADO HISTÓRICO |
| 6 | Trento, Sessão VI | dizer que Trento "negou a graça" ou "ensinou salvação por obras" | Trento afirma a graça preveniente e **condena** a justificação por obras (cân. 1); o que nega é a **imputação extrínseca sozinha** (cân. 11). O espantalho reprova pelo item (2) |
| 7 | A Turmerlebnis | citar o Prefácio a Romanos de **1522** como relato da descoberta, ou datá-la com precisão | o relato está no Prefácio às obras latinas de **1545**, escrito 30 anos depois; a data do evento (1513–1519) é **disputada** — HIPÓTESE DEBATIDA |
| 8 | Qumran e "obras da lei" | afirmar que צדקת אל **não** ocorre em Qumran, ou que 4QMMT confirma sozinho a tese de Dunn | צדקת אל ocorre (1QS X–XI); e 4QMMT é objeto de leituras concorrentes. Nenhuma das duas afirmações fortes se sustenta |
| 9 | **Ambrósio × Ambrosiaster** | citar "Ambrósio" como autor do comentário latino a Romanos | são **duas pessoas**: o Ambrosiaster é anônimo, séc. IV, e é o mais antigo comentário latino a Romanos — DADO HISTÓRICO. *Origem: a planilha de referência traz "Ambrósio"* |
| 10 | Stendahl e a genealogia da NPP | tratar **Sanders (1977)** como a origem da Nova Perspectiva | **Stendahl (1963)** a antecede e é o pressuposto; atacar Sanders como origem deixa o pressuposto intocado — reprova pelo item (3) |

⚠️ **Nenhuma delas vale enquanto não passar pela consulta de verificação.** Elas
estão aqui para que a Etapa 4 comece com material, não para pulá-la.

---

## 8. Pauta de aquisição derivada

| Prioridade | Obra | Destrava |
|---|---|---|
| 🔴 1 | **Irons**, *The Righteousness of God* (WUNT 2/386) | a refutação **lexical** de Wright/Dunn — Unidades 01, 05, 14 |
| 🔴 2 | **Cremer**, *Die paulinische Rechtfertigungslehre* (1899) | o **pressuposto** a atacar, item (3) — domínio público, custo zero |
| 🔴 3 | **4QMMT** + 1QS/1QH em edição (Martínez–Tigchelaar) | a fonte primária sob a NPP — Fase 1 Bloco C, Unidade 05 |
| 🔴 4 | **Campbell**, *The Deliverance of God* | Unidade 02 inteira — **já pendente desde Romanos** |
| 🟡 5 | Comentário técnico de **Isaías 40–66** (Oswalt NICOT / Goldingay ICC) | Unidade 09 — hoje sem espinha |
| 🟡 6 | Comentário técnico de **Salmos** (Kraus / Goldingay / Ross) | Unidade 08 |
| 🟡 7 | Comentário de **Gálatas** (Moo BECNT / Longenecker WBC / de Boer NTL) | Unidade 06 |
| ⛔ 8 | ~~Tamez~~, *The Amnesty of Grace* (ou equivalente libertacionista) | **Despriorizado em 09/08/2026** — Unidade 13 excluída do escopo. Mantido aqui só como referência, caso a decisão seja revista |
| 🟢 9 | **Stowers**, *A Rereading of Romans* | compartilhado com o projeto Romanos |

**Acrescidos pela colheita da 5ª planilha** — ver `PAUTA_DR_NOMES_COLHIDOS.md`:

| Prioridade | Obra | Destrava |
|---|---|---|
| 🔴 1-bis | **Stendahl**, *The Introspective Conscience of the West* (HTR 56, 1963) | a **origem** da NPP, anterior a Sanders — corrige a genealogia do eixo D |
| 🔴 2-bis | **Schlatter**, *Gottes Gerechtigkeit* (1935) | comentário a Romanos cujo título **é** o tema |
| 🔴 3-bis | **Hays**, *The Faith of Jesus Christ* | abre o eixo **πίστις Χριστοῦ**, ausente por completo |
| 🔴 4-bis | **Barclay**, *Paul and the Gift* (2015) | graça e dom — **exceção §4: aliado que diverge, não se refuta** |
| 🔴 5-bis | **Oberman**, *The Harvest of Medieval Theology* → **Gabriel Biel** | o *facere quod in se est* é o pressuposto contra o qual Lutero reagiu |
| 🟡 6-bis | **Chemnitz**, *Examen Concilii Tridentini* | contraparte séria a Trento — Sentinela 6 |
| 🟡 7-bis | **Perkins**, *Commentary on Galatians* (1617) | puritano **e** Gálatas — duas lacunas de uma vez |

> **Sem ISBN, de propósito** — mesma razão do `AQUISICOES.md` §6: ISBN errado
> leva ao livro errado, e autor+título+série+ano identificam sem ambiguidade.
> **Conferir a edição na compra** (ver o caso Käsemann 1973/1980 na §2.4).

---

## 9. O que falta decidir

1. **Opção A, B ou C** — recomendo **C**, agora **13 unidades ativas** (ver item 2).
2. ✅ **DECIDIDO em 09/08/2026: a Unidade 13 sai do projeto.** Não será
   redigida como unidade própria — falta a fonte primária do adversário
   (Gutiérrez/Boff/Sobrino/Assmann/Tamez, confirmado ausente do corpus em
   `_triagem_dr/DEEP_RESEARCHES_REALIZADAS.md` §4) e a aquisição não foi
   priorizada. **A exclusão é declarada, não omitida**: o capítulo de
   síntese (U14) precisa registrar explicitamente que a leitura
   libertacionista da justiça de Deus foi identificada como objeção
   pertinente e deixada de fora por falta de fonte primária verificável no
   corpus — não por não ter sido considerada. Ver `LACUNAS_REFUTACAO.md`.
3. ✅ **Decidido em 09/08/2026 (formalizando o que já estava em prática):**
   Unidade 12 permanece dentro do Anel 3. Owen e Turretini — a bibliografia
   que a sustenta — já estão convertidos e no notebook desde 05-06/08/2026.
4. **Instalar `heb.traineddata`** antes da Fase 0 Etapa 5, ou restringir o Anel 2
   a obras com camada de texto nativa.
5. **Qual edição de Käsemann** entra — 1973 alemã ou 1980 inglesa.
6. **Destino:** ~~`Documents\Justica-de-Deus-Pesquisa`~~ -> **raiz propria** em `C:\Users\admintrt9a\Projetos\Justica-de-Deus` (02/08/2026). Fora de `Documents`, desacoplado do molde. Ver `_LOG_EXECUCAO.md`.

---

*Documento de decisão. Depois de escolhida a opção, o projeto é gerado em um
comando e os deltas da §6 são aplicados na sequência.*
