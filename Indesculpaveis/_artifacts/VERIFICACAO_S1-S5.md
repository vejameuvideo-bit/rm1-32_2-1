# Verificação das sentinelas S1–S5 — 08/10/2026

*Lote A do `ROTEIRO_VERIFICACAO_SENTINELAS.md`. **Resultado: nenhuma sentinela foi
migrada para a tabela contada.** Três têm o método de fonte cumprido (com uma
ressalva sobre a edição usada), uma cumpre em parte e uma não pôde ser decidida.
O método de conteúdo — a consulta ao notebook — não existe ainda.*

## O que foi pedido e o que foi possível

Pedido: verificar S1–S5 **pelo NA28**.

**O NA28 não esteve acessível.** É texto protegido; o site que o publica
(academic-bible.com) não abre deste ambiente e não há `biblioteca\` aqui. Usei no
lugar, **e declaro a substituição**:

| Fonte | O que é | Versão consultada |
|---|---|---|
| **SBLGNT + MorphGNT** | edição crítica aberta (CC BY 4.0), com lema e parsing por palavra | morphgnt `aaed91e` (2024-01-21) |
| **Aparato do SBLGNT** | registra, onde as edições divergem, a leitura de **WH, Treg, NA28 e RP** | LogosBible `c4d241a` (2025-01-19) |
| **Nestle 1904** | edição crítica antiga, domínio público | `713f28a` (2023-05-11) |
| **Robinson–Pierpont (RP)** | texto bizantino, domínio público | `27a45ff` (2024-12-31) |

Reprodução: `_scripts/verificar_s1_s5_edicoes_abertas.py`; saída completa em
`_artifacts/saida_verificacao_S1-S5.txt`.

⚠️ **Limites desta substituição**
1. O aparato do SBLGNT mostra **a leitura do NA28 como os editores do SBLGNT a
   registraram**, não o aparato do NA28 (que lista as **testemunhas**). Serve para
   "o NA28 lê X"; **não** serve para "quais manuscritos".
2. O aparato só traz **unidades em que as edições comparadas divergem**. Silêncio
   significa que **WH, Treg, NA28 e RP concordam** — **não** que não existam variantes
   manuscritas ali.
3. A dupla checagem exige **um método de conteúdo + um de fonte**. Aqui há duas
   leituras da fonte (lema por edição e aparato), **sem** consulta ao notebook.

## Resultado por sentinela

| # | Veredito | Em uma linha |
|---|---|---|
| **S1** | ❓ **não decidida** | o texto grego não decide; só há indício de segunda mão |
| **S2** | ✅ **confirmada** nas três edições | ἀναπολόγητος: só Rm 1.20 e 2.1 |
| **S3** | ✅ **confirmada** nas três edições | παρέδωκεν ×3; ἤλλαξαν ×1; μετήλλαξαν ×2 |
| **S4** | 🟡 **confirmada em parte** | NA28 não lê πορνείᾳ nem ἀσπόνδους; "TR", "secundárias" e testemunhas **ficam abertos** |
| **S5** | 🟡 **confirmada em parte + o rascunho tem um erro de contagem** | 3 grupos sintáticos ✔; **21** (crítico) / **23** (bizantino) — **não** "22" |

---

### S1 — P46 e Rm 1–5  ❓

- **Não é verificável pelo texto grego.** Nenhuma das fontes acima cita manuscritos.
- **Indício de segunda mão** (resumo de busca; as páginas não puderam ser abertas):
  a tabela de fólios do P46 indicaria **fólios 1–7 perdidos (Rm 1.1–5.17)** e o
  **fólio 8 começando em Rm 5.17** ([reference.org](https://reference.org/facts/papyrus_46/GPWVBVA4);
  [exposição da Univ. de Michigan](https://apps.lib.umich.edu/files/collections/papyrus/exhibits/reading/Paul/contents.html);
  [Bible Research](https://bible-researcher.com/papy46.html)). Isso **concorda** com a
  correção já feita no Cap1 (`../MEMORIA_CAP1.md`), mas **não é fonte primária**.
- **Correção ao roteiro:** o `ROTEIRO` dava "Rm 5.17–6.14; 8.15–15.9; 16.25–27" **de memória**.
  O indício aponta o fragmento final até **15.11** e **não confirma** 16.25-27. Irrelevante para a
  sentinela (que fala só de 1.1–5.16), mas **não repetir esses limites** sem fonte.
- **Para decidir:** NA28 (lista de papiros) **e** uma obra erudita (Comfort & Barrett; Metzger).
  Status: **rascunho, com indício a favor**.

### S2 — ἀναπολόγητος só em 1.20 e 2.1  ✅

| Edição | Ocorrências no NT inteiro |
|---|---|
| SBLGNT | **Rm 1.20** (ἀναπολογήτους) · **Rm 2.1** (ἀναπολόγητος) — **2** |
| Nestle 1904 | idem — **2** |
| RP (bizantino) | idem — **2** |

- Busca **sem acentos**, porque a forma de 1.20 desloca o acento (a primeira versão
  do meu script, sem isso, achou só 2.1 no bizantino — **corrigida**).
- ἀπολογέομαι (Rm 2.15, ἀπολογουμένων) é **outro lema** e foi excluído, como a sentinela prevê.
- O aparato do SBLGNT **não registra variação entre edições** em 1.20 nem em 2.1.
- **Falta:** BDAG (o critério do roteiro) e a concordância do NA28. Não há ocorrência em outra edição
  consultada, mas isso **não substitui** a concordância.

### S3 — παρέδωκεν ×3, ἤλλαξαν ×1, μετήλλαξαν ×2  ✅

| Versículo | Verbo | SBLGNT | Nestle 1904 | RP |
|---|---|---|---|---|
| 1.23 | **ἤλλαξαν** (ἀλλάσσω) | ✔ | ✔ | ✔ |
| 1.24 | **παρέδωκεν** | ✔ | ✔ | ✔ |
| 1.25 | **μετήλλαξαν** (μεταλλάσσω) | ✔ | ✔ | ✔ |
| 1.26 | **παρέδωκεν** + **μετήλλαξαν** | ✔ | ✔ | ✔ |
| 1.28 | **παρέδωκεν** | ✔ | ✔ | ✔ |

- **1.28 não usa verbo de "trocar":** SBLGNT — *Καὶ καθὼς οὐκ ἐδοκίμασαν τὸν θεὸν ἔχειν ἐν
  ἐπιγνώσει, παρέδωκεν αὐτοὺς ὁ θεὸς εἰς ἀδόκιμον νοῦν* ✔.
- Sem outra ocorrência de ἀλλάσσω/μεταλλάσσω em Rm 1.18-32. O aparato **não registra variação**
  nesses versículos (só em 1.24: Διὸ / + καὶ RP; αὐτοῖς / ἑαυτοῖς RP).
- **Isto confirma o erro do Cap1 (E23):** o relatório pôs μεταλλάσσω no v. 23, onde está ἀλλάσσω.

### S4 — o catálogo e a crítica textual  🟡

| Edição | 1.29: πορνείᾳ? | 1.31: ἀσπόνδους? |
|---|---|---|
| SBLGNT | **não** | **não** |
| Nestle 1904 | **não** | **não** |
| **Aparato — leitura do NA28** | **não** (*"ἀδικίᾳ WH Treg NA28 ] + πορνείᾳ RP"*) | **não** (*"ἀστόργους WH Treg NA28 ] + ἀσπόνδους RP"*) |
| RP (bizantino) | **sim** (ἀδικίᾳ, πορνείᾳ, πονηρίᾳ…) | **sim** (ἀστόργους, ἀσπόνδους, ἀνελεήμονας) |

- ✅ **Confirmado:** o NA28 (via aparato do SBLGNT), WH, Treg, SBLGNT e Nestle 1904 **não** trazem
  πορνείᾳ em 1.29 nem ἀσπόνδους em 1.31; o texto bizantino traz as duas.
- 🟡 **Fica aberto:** (a) **"TR"** — o rascunho dizia "bizantino/TR"; **não consultei um Textus
  Receptus**, só o bizantino RP; (b) **"secundárias"** — é juízo crítico (Metzger), não dado do
  texto; (c) **as testemunhas** — o rascunho as nomeia; o aparato do SBLGNT **não** as lista.
- **Formulação que a verificação sustenta:** *"πορνείᾳ (1.29) e ἀσπόνδους (1.31) constam no texto
  bizantino (RP) e não constam nas edições críticas WH, Treg, NA28 e SBLGNT; testemunhas a
  conferir no aparato do NA28 e em Metzger."*

### S5 — os "4 blocos" e a contagem  🟡

**Confirmado — a sintaxe dá três grupos (SBLGNT, caso pelo parsing):**

| Grupo | Regente | Itens |
|---|---|---|
| 1 | πεπληρωμένους + **dativo** | ἀδικίᾳ · πονηρίᾳ · πλεονεξίᾳ · κακίᾳ → **4** |
| 2 | μεστοὺς + **genitivo** | φθόνου · φόνου · ἔριδος · δόλου · κακοηθείας → **5** |
| 3 | **acusativos** em aposição | ψιθυριστάς · καταλάλους · θεοστυγεῖς · ὑβριστάς · ὑπερηφάνους · ἀλαζόνας · ἐφευρετὰς (+ κακῶν, gen.) · ἀπειθεῖς (+ γονεῦσιν, dat.) · ἀσυνέτους · ἀσυνθέτους · ἀστόργους · ἀνελεήμονας → **12** |

**Corrige o rascunho:**
- **Contagem.** Texto crítico: 4 + 5 + 12 = **21**. Bizantino (RP): + πορνείᾳ + ἀσπόνδους = **23**.
  O rascunho dizia "21 no NA28; **22 com ἀσπόνδους**": **não existe edição consultada com 22** — quem
  traz ἀσπόνδους traz também πορνείᾳ. (E o "23" que o rascunho mandava **não fixar** é exatamente a
  contagem do texto bizantino: o prompt 15 do Cap1 pedia "23 (ou mais)".) **Critério de contagem a
  declarar:** ἐφευρετὰς κακῶν e γονεῦσιν ἀπειθεῖς valem **um item** cada.
- **O "quarto bloco" de α-privativos.** O relatório e o rascunho falam de **quatro** (ἀσυνέτους,
  ἀσυνθέτους, ἀστόργους, ἀνελεήμονας). Mas **ἀπειθεῖς** (ἀ-πείθομαι) também é α-privativo e vem
  **logo antes**: a sequência é de **cinco** (e **seis** no bizantino, com ἀσπόνδους). O "bloco de quatro"
  é um **recorte do intérprete** — o que reforça a sentinela (é análise, não dado).

**Fica aberto:** o que Moo, Cranfield e Dunn dizem da divisão — o roteiro pede **dois comentários**.

---

## Efeito colateral útil — o aparato em Rm 1.18–3.26

O aparato cita as leituras de WH, Treg, NA28 e RP. Há **unidades de variação entre edições** em:
**1.19, 1.24, 1.27, 1.29, 1.31** · **2.5, 2.8, 2.13, 2.14, 2.16, 2.17, 2.26** · **3.2, 3.4, 3.7, 3.11, 3.12, 3.22, 3.25, 3.26**.
Isso **cruza com o Prompt 2** do projeto:

| O Prompt 2 supõe | O aparato mostra |
|---|---|
| 2.14 ποιῶσιν/ποιῇ | ✔ (ποιῶσιν WH Treg NA28 ] ποιῇ RP) |
| 2.16 ὅτε / ᾗ ἡμέρᾳ; Χριστοῦ Ἰησοῦ | ✔ (e κρίνει/κρινεῖ) |
| 2.17 εἰ δέ / ἴδε | ✔ |
| 3.7 εἰ δέ / εἰ γάρ | ✔ (δέ WH NA28 ] γάρ Treg RP) |
| **1.32 variante "ocidental"** | ❌ **nenhuma unidade de variação entre as edições** em 1.32, 2.1 ou 2.2 |
| **2.2 δέ/γάρ** | ❌ idem — só o aparato do NA28 poderia dizer |
| **3.9 προεχόμεθα** | ❌ idem |

⚠️ Isso **não prova** que não há variante manuscrita nesses lugares: prova que **as cinco edições
concordam**. Os três itens foram marcados no Prompt 2 como **a conferir no aparato do NA28**; **não
pressupor** a variante de 1.32.

## Recomendação

| # | Migrar? | Condição |
|---|---|---|
| S2 | **sim, se você aceitar as edições substitutas** | registrar "SBLGNT + Nestle 1904 + RP; BDAG pendente" |
| S3 | **sim, se você aceitar** | idem; o critério do roteiro era a leitura do NA28 |
| S5 | **sim, com a formulação corrigida** | 21/23 e "recorte do intérprete"; dois comentários pendentes |
| S4 | **só a parte confirmada** | reescrever sem "TR" e sem "secundárias"; testemunhas pendentes |
| S1 | **não** | falta fonte primária |

Nada foi migrado: **a decisão de aceitar edições substitutas ao NA28 é sua** (o roteiro dizia
NA28, e o método de conteúdo — o notebook — também falta). Com S2, S3 e S5 migradas, a tabela teria
**3** das 8 sentinelas exigidas.
