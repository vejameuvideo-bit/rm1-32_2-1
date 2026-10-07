# Prompts de Pesquisa — Indesculpáveis (Rm 1.18–3.20)

**Projeto:** exegese e teologia de Rm 1.18–3.20, eixo focal em 1.29–2.2
**Notebook:** `IND - Rm 1.18-3.20` (criar na Fase 0, Etapa 8)
**Persona:** `_artifacts/persona_notebooklm.txt`
**Protocolo:** rótulos de `_artifacts/escala_certeza.md` em toda afirmação; sentinelas de `_artifacts/sentinelas_IND.md`
**Regra de execução:** máximo 4 prompts por sessão do Claude Code; três consultas por prompt (exegética · verificação · refutação dirigida)

---

## Cláusulas fixas — valem para TODOS os prompts

Anexar ao fim de cada prompt enviado ao notebook (`--prompt-file`):

```
CLÁUSULAS FIXAS
1. Público: doutores e mestres que leem grego e hebraico. Cite o texto grego
   (NA28) e o hebraico/LXX das citações; não translitere no corpo.
2. Rótulo obrigatório em cada afirmação: [FATO TEXTUAL] [DADO HISTÓRICO]
   [INFERÊNCIA FORTE] [INFERÊNCIA PLAUSÍVEL] [HIPÓTESE DEBATIDA] [ESPECULAÇÃO].
3. Toda posição atribuída a autor: nome + obra + página, SOMENTE se a obra
   estiver neste notebook. Se a posição só aparece citada por terceiros,
   escreva [CITADO POR TERCEIROS — quem?]. Não use conhecimento externo.
4. REGRA ZERO: quando a posição liberal/progressista divergir da conservadora,
   ela é OBJEÇÃO a ser refutada, nunca alternativa equivalente. Ordem: tese →
   objeção (na versão mais forte, com fonte primária) → ataque ao pressuposto
   → resposta ancorada em texto, recepção e consenso conservador → desfecho.
   Proibido fechar com "há debate" ou "cada leitor decide".
5. Se o corpus não tiver a fonte primária do adversário, DIGA ISSO e não abra
   a objeção. Se uma fonte do corpus existe mas silencia sobre o ponto, diga
   que silencia.
6. Termine com: (a) como este texto prepara ou desdobra o eixo focal
   1.29–2.2; (b) a ponte para 3.21-26.
```

---

## BLOCO A — Fundamentos (prompts 1–3)

### Prompt 1 — O argumento de Rm 1.18–3.20 e a sua moldura

1. **Delimitação:** justifique 1.18 como início (γάρ explicativo depois de 1.17) e 3.20 como fim (νυνὶ δέ em 3.21). Quem propõe outra delimitação (1.18–2.29; 1.18–3.31; 1.18–4.25) e com que argumento?
2. **A moldura** ἀποκαλύπτεται (1.17) / ἀποκαλύπτεται (1.18) / πεφανέρωται (3.21): os dois "revelar" de 1.17-18 são paralelos, contrastantes ou causais? Como 3.21 retoma 1.17 depois do diagnóstico?
3. **As subunidades:** 1.18-32 / 2.1-16 / 2.17-29 / 3.1-8 / 3.9-20 — onde estão as costuras (Διό 2.1; εἰ δέ 2.17; τί οὖν 3.1, 3.9)? A apóstrofe ὦ ἄνθρωπε (2.1, 2.3) e o Ἰουδαῖος nomeado (2.17) marcam o mesmo interlocutor ou dois?
4. **Gênero:** a diatribe (Bultmann, Stowers) e a apóstrofe; o padrão da polêmica judaica contra a idolatria (Sabedoria 13–15); o "processo" (rîb) do AT. Qual moldura explica melhor a sequência acusação → defesa negada → veredito (3.19)?
5. **A palavra-chave:** ἀναπολόγητος só em 1.20 e 2.1 no NT `[a conferir]`. Como as duas ocorrências articulam a seção — o gentio sem desculpa e quem julga sem desculpa — e como 3.19 (ἵνα πᾶν στόμα φραγῇ) as fecha?
6. **O eixo E (a voz):** apresente a tese de Douglas Campbell (*The Deliverance of God*) de que 1.18-32 é discurso de um "Mestre" que Paulo cita para refutar (prosopopeia). Aplique a cláusula 4 por inteiro: a melhor versão da tese, o pressuposto (a teoria "justificacionista" que Campbell atribui à leitura tradicional), e a resposta a partir do texto (as pontes verbais 1.32 → 2.1-3; a ausência de marcadores de mudança de voz em 1.18).
7. **A objeção de maior alcance — interpolação:** apresente a tese de W. O. Walker ("Romans 1.18–2.29: A Non-Pauline Interpolation?", *NTS* 45, 1999 — `[a confirmar título e autoria]`) de que toda a seção 1.18–2.29 é interpolação, e a proposta de Bultmann (2.1 como glosa — S8). Cláusula 4 por inteiro, **só** se as obras estiverem no corpus; senão **LACUNA**. Pontos a examinar: a evidência manuscrita (nenhuma, no NA28?) e a de Marcião (o que se sabe e o que se infere); o pressuposto (que o conteúdo de Rm 2 seja "não paulino"); as pontes verbais 1.32 → 2.1-3; Rm 2 em 3.9 ("já acusamos").

---

### Prompt 2 — Crítica textual de Rm 1.18–3.20

1. **Testemunhas:** quais manuscritos contêm esta seção? ⚠️ **P46 não contém Rm 1.1–5.16** `[sentinela S1]` — não o cite como testemunha. Avalie ℵ, A, B, C, D (06), F/G (010/012), Ψ, 33, 1739 e o texto bizantino.
2. **1.29:** a inserção de πορνείᾳ e as variações de ordem entre πονηρίᾳ, πλεονεξίᾳ, κακίᾳ — que testemunhas, que explicação (assimilação a listas paralelas?).
3. **1.31:** ἀσπόνδους depois de ἀστόργους (Bizantino; TR: *implacable*) — testemunhas a favor e contra; a explicação de Metzger (*TCGNT*) `[a conferir]`.
4. **1.32:** a variante "ocidental" que altera a relação entre fazer e aprovar `[a conferir: D*, latinas, Metzger]`. Se existir, ela **suaviza** ou **agrava** a acusação? Qual a implicação para o eixo focal?
5. **2.1–2.29:** variantes de conjunção em 2.2 (δέ/γάρ), em 2.14 (ποιῶσιν/ποιῇ), em 2.16 (ὅτε/ἐν ᾗ ἡμέρᾳ; ordem de Χριστοῦ Ἰησοῦ) e em 2.17 (εἰ δέ / ἴδε) — e qualquer outra relevante que o corpus registre.
6. **3.1-20:** 3.7 (εἰ δέ / εἰ γάρ); 3.9 (προεχόμεθα e as leituras alternativas); a catena de 3.10-18 e a interpolação de 3.13-18 no Sl 14 (LXX 13) em alguns manuscritos da LXX `[a conferir]`.
7. **A glosa:** Bultmann propôs 2.1 como glosa `[a conferir: "Glossen im Römerbrief", 1947]`. Há algum apoio manuscrito? Que critério interno a sustentou, e por que o consenso a rejeita?

Trabalhe com NA28/UBS5; registre onde o aparato diverge das traduções tradicionais (ARA, ACF, NVI).

---

### Prompt 3 — Os grupos de palavras: julgar, praticar, saber, justiça, entregar

1. **Inventário:** monte a concordância de Rm 1.18–3.20 para os seis grupos (ver `ESCOPO_INDESCULPAVEIS.md` §5) e verifique cada ocorrência contra o texto do corpus.
2. **κρίνω / κατακρίνω / κρίμα / δικαιοκρισία:** o jogo de 2.1 (ἐν ᾧ γὰρ κρίνεις τὸν ἕτερον, σεαυτὸν κατακρίνεις) — o composto κατα- é intensivo ou forense? δικαιοκρισία (2.5): ocorrências fora do NT (LXX? Test. XII Patr.?) `[a conferir]`.
3. **πράσσω / ποιέω:** Paulo alterna os dois em 1.32 (πράσσοντες … ποιοῦσιν … πράσσουσιν) e em 2.1-3. Há distinção semântica (prática habitual × ato) ou variação estilística? Quem sustenta cada leitura?
4. **Saber:** γνόντες τὸν θεόν (1.21), ἐπιγνόντες τὸ δικαίωμα (1.32), οἴδαμεν (2.2). A seção é construída sobre **conhecimento que não salva**? Como o grupo culmina em διὰ γὰρ νόμου ἐπίγνωσις ἁμαρτίας (3.20)?
5. **Justiça:** δικαίωμα (1.32 e 2.26), δικαιοσύνη θεοῦ (1.17; 3.5; 3.21), δικαιόω (2.13; 3.4; 3.20). O δικαίωμα τοῦ θεοῦ de 1.32 é o mesmo "decreto" para gentio e judeu?
6. **ἀλήθεια:** 1.18 (τὴν ἀλήθειαν ἐν ἀδικίᾳ κατεχόντων), 1.25 (ἡ ἀλήθεια τοῦ θεοῦ), 2.2 (κατὰ ἀλήθειαν), 2.8, 2.20, 3.7. A seção começa com a verdade suprimida e termina com Deus julgando κατὰ ἀλήθειαν — moldura intencional?
7. **Síntese lexical:** produza a tabela "palavra → onde aparece → função no argumento", que será o apêndice lexical do relatório e a base do encontro de observação da série.

---

## BLOCO B — Tópico 1: O evangelho e a ira (1.16-23) (prompts 4–6)

### Prompt 4 — ὀργὴ θεοῦ e a dupla revelação (1.16-18)

**Pergunta central:** por que Paulo começa a falar de ira logo depois de anunciar o evangelho?

1. **γάρ em 1.18:** explicativo de 1.17 (a justiça é necessária *porque* há ira), de 1.16 (o evangelho é poder *porque* a ira é real), ou marcador de nova seção sem nexo lógico? Quem sustenta cada leitura?
2. **ἀποκαλύπτεται (presente) ×2:** a ira é revelada **no evangelho** (Cranfield?) ou **na história** (os παρέδωκεν), ou nas duas? `[a conferir atribuições]`
3. **ἀπ' οὐρανοῦ:** que tradição veterotestamentária e apocalíptica está por trás? O céu como lugar do trono-tribunal?
4. **ἀσέβεια καὶ ἀδικία:** irreligião e injustiça — par sinonímico ou as duas tábuas da lei? Background na LXX e no judaísmo helenístico.
5. **O eixo B — a natureza da ira:** apresente C. H. Dodd (ira como processo impessoal de causa e efeito; Moffatt Commentary, 1932) e A. T. Hanson (*The Wrath of the Lamb*, 1957) em fonte primária, se estiverem no corpus. Aplique a cláusula 4: o pressuposto (Deus não pode ter "afeto" retributivo; impassibilidade lida como apatia moral), e a resposta (Leon Morris, *The Apostolic Preaching of the Cross*; o paralelo 1.17/1.18; 2.5 ἡμέρα ὀργῆς; 3.5 ὁ ἐπιφέρων τὴν ὀργήν — Deus como **sujeito** da ira). ⚠️ Hanson é **adversário**, não crítico de Dodd `[sentinela S9]`.
6. **Implicação pastoral (objetivo 3):** o evangelho que omite a ira deixa de ser "poder de Deus para salvação" — de quê?

---

### Prompt 5 — A supressão da verdade e a revelação natural (1.18-20)

**Tema transversal:** supressão da verdade.

1. **τῶν τὴν ἀλήθειαν ἐν ἀδικίᾳ κατεχόντων:** κατέχω = "reter/possuir" ou "suprimir/impedir"? Argumento lexical (uso paulino em 1Ts 5.21; 2Ts 2.6-7; 1Co 7.30; Rm 7.6) e contextual. A supressão é ato volitivo presente ou condição?
2. **τὸ γνωστὸν τοῦ θεοῦ φανερόν ἐστιν ἐν αὐτοῖς:** "conhecível" ou "conhecido"? ἐν αὐτοῖς = "neles" (consciência) ou "entre eles" (criação)?
3. **1.20:** τὰ ἀόρατα … καθορᾶται — o oxímoro; ἥ τε ἀΐδιος αὐτοῦ δύναμις καὶ θειότης (θειότης ≠ θεότης, Cl 2.9); ἀπὸ κτίσεως κόσμου — temporal ou instrumental?
4. **εἰς τὸ εἶναι αὐτοὺς ἀναπολογήτους:** εἰς τό + infinitivo — finalidade ("para que fossem") ou resultado ("de modo que são")? Quem defende cada leitura e qual a consequência teológica (Deus revela para condenar?) `[eixo central da palavra-chave]`.
5. **Barth × Brunner (1934) e a leitura reformada:** Barth (*Nein!*) e a negação da teologia natural; Brunner e o *Anknüpfungspunkt*; Calvino (*Inst.* I.3–5: *sensus divinitatis*, *semen religionis*) e Van Til. ⚠️ Barth **não é adversário liberal** nesta questão: diverge sobre a teologia natural, mas sustenta a culpa universal — tratar pela exceção §4.1 (aliado que diverge) `[REGRAS_RETOMADA.md]`.
6. **Paralelos:** Sb 13.1-9 (ἐκ γὰρ μεγέθους καὶ καλλονῆς κτισμάτων, 13.5); Cícero, *De natura deorum* II; Fílon. Paulo **assume** o argumento da Sabedoria ou o **corrige**? (Note Sb 13.6: ἐπὶ τούτοις ἐστὶ μέμψις ὀλίγη — a culpa "pequena" que Paulo **não** concede.)
7. **Implicação pastoral:** o que significa, para o mestre de teologia, que o problema humano não é falta de informação mas supressão de verdade possuída?

---

### Prompt 6 — A idolatria e a troca (1.21-23)

**Tema transversal:** idolatria humana.

1. **γνόντες τὸν θεόν (1.21):** que tipo de conhecimento? Primordial-histórico (Adão), presente-universal, ou ambos?
2. **A dupla omissão:** οὐχ ὡς θεὸν ἐδόξασαν ἢ ηὐχαρίστησαν — por que glória e gratidão são as respostas definidoras? A ingratidão como raiz da idolatria.
3. **ἐματαιώθησαν ἐν τοῖς διαλογισμοῖς / ἐσκοτίσθη ἡ ἀσύνετος αὐτῶν καρδία:** ματαιότης e os ídolos como τὰ μάταια na LXX (Jr 2.5; 8.19; Sl 94.11 LXX 93.11) — a futilidade como **retribuição adequada** (o idólatra fica como o ídolo, Sl 115.8).
4. **φάσκοντες εἶναι σοφοὶ ἐμωράνθησαν (1.22):** relação com 1Co 1.18-25 e com Jr 10.14.
5. **ἤλλαξαν τὴν δόξαν (1.23):** os ecos de **Sl 106.20 (LXX 105.20)** e **Jr 2.11** — os dois falam de **Israel** (o bezerro de ouro). Se Paulo os evoca, Israel já está dentro da acusação em 1.23? Grau de dependência: citação, alusão ou eco? Quem sustenta cada leitura?
6. **ἐν ὁμοιώματι εἰκόνος:** a sequência ἀνθρώπου → πετεινῶν → τετραπόδων → ἑρπετῶν e Gn 1.26 / Dt 4.16-18 — a idolatria como **inversão da criação**. O eixo D: Morna Hooker ("Adam in Romans 1", *NTS* 6, 1960) e a leitura adâmica — classificar com o rótulo honesto `[sentinela S10]`.
7. **Sabedoria 13–14:** mapa de paralelos (14.12: ἀρχὴ γὰρ πορνείας ἐπίνοια εἰδώλων; 14.22-27, a lista de vícios). Paulo segue a Sabedoria até 1.32 — e **onde a abandona**?
8. **Implicação pastoral:** que ídolos o leitor erudito costuma ter — e por que eles são sempre "imagens" de criaturas?

---

## BLOCO C — Tópicos 2 e 3: Deus os entregou; Cheios de toda injustiça (prompts 7–10)

### Prompt 7 — Os três παρέδωκεν e as duas trocas (1.24-28)

**Pergunta central:** como a ira já age no presente, deixando o pecado seguir seu curso?
**Tema transversal:** o abandono judicial de Deus.

1. **A estrutura:** troca → entrega, três vezes:

   | Troca | Entrega |
   |---|---|
   | ἤλλαξαν τὴν δόξαν (1.23) | παρέδωκεν … ἐν ταῖς ἐπιθυμίαις … εἰς ἀκαθαρσίαν (1.24) |
   | μετήλλαξαν τὴν ἀλήθειαν … ἐν τῷ ψεύδει (1.25) | παρέδωκεν … εἰς πάθη ἀτιμίας (1.26) |
   | οὐκ ἐδοκίμασαν τὸν θεὸν ἔχειν ἐν ἐπιγνώσει (1.28a) | παρέδωκεν … εἰς ἀδόκιμον νοῦν (1.28b) |

   É progressão (escalada) ou três descrições do mesmo juízo?
2. **παρέδωκεν como ato divino:** permissão passiva ("deixou"), retirada de restrição, ou entrega judicial ativa? O uso do verbo para Cristo (4.25; 8.32) ilumina o sentido?
3. **Background:** Sl 81.12 (LXX 80.13: ἐξαπέστειλα αὐτοὺς κατὰ τὰ ἐπιτηδεύματα τῶν καρδιῶν αὐτῶν); At 7.42 (παρέδωκεν αὐτοὺς λατρεύειν τῇ στρατιᾷ τοῦ οὐρανοῦ); At 14.16; Ez 20.25-26.
4. **A retribuição adequada (*ius talionis*):** o jogo οὐκ ἐδοκίμασαν / ἀδόκιμον νοῦν; a troca de glória que gera desonra (ἀτιμάζεσθαι 1.24; ἀτιμία 1.26); a ἀντιμισθία de 1.27. Klostermann ("Die adäquate Vergeltung in Rm 1,22-31", *ZNW* 32, 1933) `[a conferir: presença no corpus]`.
5. **1.25 — a doxologia:** ὅς ἐστιν εὐλογητὸς εἰς τοὺς αἰῶνας, ἀμήν — por que Paulo interrompe a acusação com uma bênção? O ψεῦδος de 1.25 é **o** ídolo (Is 44.20; Jr 13.25)?
6. **O tempo:** os aoristos descrevem evento primordial, padrão histórico, ou condição presente? Como se relacionam com o presente de 1.18 e com o futuro de 2.5 (ἡμέρα ὀργῆς)?
7. **Implicação pastoral:** se o juízo presente é "dar o que se quer", como ensinar que o "sucesso" do pecado é ele mesmo o juízo — sem fatalismo, à luz de 2.4 (a bondade que conduz ao arrependimento)?

---

### Prompt 8 — Rm 1.26-27 dentro do argumento

⚠️ **Cuidado da proposta:** sobriedade; sem linguagem de desprezo; 2.1 inclui o próprio professor. ⚠️ **Regra Zero** em cheio. Os dois cuidados valem juntos.

1. **A função no argumento:** por que Paulo escolhe esta ilustração para o segundo παρέδωκεν? A relação com a troca de 1.25 (o Criador pela criatura) e com Gn 1.27 (LXX: ἄρσεν καὶ θῆλυ — Paulo usa θήλειαι e ἄρσενες, não γυναῖκες e ἄνδρες).
2. **Exegese:** πάθη ἀτιμίας; μετήλλαξαν τὴν φυσικὴν χρῆσιν εἰς τὴν παρὰ φύσιν; ὁμοίως τε καὶ οἱ ἄρσενες; ἐξεκαύθησαν ἐν τῇ ὀρέξει; ἄρσενες ἐν ἄρσεσιν; τὴν ἀσχημοσύνην κατεργαζόμενοι; τὴν ἀντιμισθίαν … ἐν ἑαυτοῖς ἀπολαμβάνοντες.
3. **φύσις / παρὰ φύσιν:** uso paulino (1Co 11.14; Rm 2.14, 2.27; 11.21-24); Fílon e Josefo; o estoicismo. É norma criacional, convenção cultural ou constituição individual?
4. **A objeção revisionista (cláusula 4 por inteiro):** Boswell (1980), Scroggs (1983), Brownson (2013), Vines (2014) — em fonte primária, **somente se estiverem no corpus**. A melhor versão: Paulo condenaria excesso, exploração ou pederastia, e "natureza" seria expectativa cultural. O **pressuposto** a atacar: a categoria moderna de orientação lida retroativamente. A resposta: o texto (θήλειαι/ἄρσενες, a reciprocidade ἐν ἀλλήλοις, o eco de Gn 1.27), a recepção (Crisóstomo, *Hom. Rom.* 4 `[a conferir]`), o consenso (Hays, *The Moral Vision of the NT*, e "Relations Natural and Unnatural", *JRE* 14, 1986; Gagnon, *The Bible and Homosexual Practice*, 2001; Schreiner; Moo).
5. **O caso Brooten:** Bernadette Brooten (*Love Between Women*, 1996) concorda que Paulo condena todo ato homoerótico (inclusive feminino) e **rejeita a autoridade** do texto. Isso não é "concordância na exegese" que dispense refutação: é objeção **à autoridade**, e precisa dos cinco itens no plano hermenêutico `[sentinela S12]`.
6. **ἐν ἑαυτοῖς — a retribuição interna:** a ἀντιμισθία é a própria troca, doença, ou a desordem do desejo? Não especular além do texto.
7. **Implicação pastoral (cuidado da proposta):** como ensinar 1.26-27 a uma turma em que há pessoas com consciência ferida, mantendo a verdade do texto e a inclusão de 2.1? Redigir a nota pastoral do encontro 2.

---

### Prompt 9 — O catálogo de vícios (1.28-31)

**Pergunta central:** que pecados da lista eu costumo considerar "leves"?

1. **ἀδόκιμος νοῦς (1.28):** o jogo de palavras; o pecado cognitivo como origem do ético; τὰ μὴ καθήκοντα — termo técnico estoico ("o que não convém")?
2. **A sintaxe em blocos** `[sentinela S5]`:
   - πεπληρωμένους + 4 dativos: ἀδικίᾳ, πονηρίᾳ, πλεονεξίᾳ, κακίᾳ
   - μεστούς + 5 genitivos: φθόνου, φόνου, ἔριδος, δόλου, κακοηθείας
   - 12 acusativos em aposição: ψιθυριστάς, καταλάλους, θεοστυγεῖς, ὑβριστάς, ὑπερηφάνους, ἀλαζόνας, ἐφευρετὰς κακῶν, γονεῦσιν ἀπειθεῖς, ἀσυνέτους, ἀσυνθέτους, ἀστόργους, ἀνελεήμονας

   A divisão em **quatro blocos** da proposta separa os quatro α-privativos finais (ἀσυνέτους, ἀσυνθέτους, ἀστόργους, ἀνελεήμονας), unidos por assonância? É divisão do texto ou do intérprete? Registrar a contagem (21 no NA28; 22 com ἀσπόνδους) como dependente da crítica textual.
3. **Jogos sonoros:** φθόνου φόνου; ἀσυνέτους ἀσυνθέτους — retórica para memorização? Paralelos.
4. **Termos difíceis:** ψιθυριστάς × καταλάλους (o mexerico secreto e a calúnia aberta); **θεοστυγεῖς** — "odiados por Deus" (passivo, uso clássico) ou "que odeiam a Deus" (ativo)? `[sentinela S6]`; ὑβριστάς / ὑπερηφάνους / ἀλαζόνας — a tríade do orgulho; ἐφευρετὰς κακῶν; γονεῦσιν ἀπειθεῖς (por que a desobediência aos pais está aqui?).
5. **Paralelos:** Sb 14.22-27; 1QS IV.9-11; Fílon (*De sacrificiis* 32 `[a conferir]`); listas greco-romanas. Paulo copia uma lista recebida ou a compõe para o argumento?
6. **Contra a hierarquia (cuidado da proposta):** a lista mistura φόνος e ψιθυρισμός, ἀσέβεια social e mexerico. Como o próprio texto **desmonta a hierarquia de pecadores** que o leitor religioso constrói — e prepara 2.1?
7. **Implicação pastoral:** aplicar o objetivo 2 (Discernir) — quais destes vícios são os "vícios de quem julga" (inveja, contenda, maledicência, arrogância)?

---

### Prompt 10 — Rm 1.32: saber, fazer e aprovar — a dobradiça

**Eixo focal, primeira metade.**

1. **οἵτινες:** relativo qualitativo ("pessoas tais que…")?
2. **τὸ δικαίωμα τοῦ θεοῦ ἐπιγνόντες:** que "decreto"? A lei natural (2.14-15), o Decálogo, ou o juízo de morte de Gn 2.17? δικαίωμα como sentença ou como exigência?
3. **ἄξιοι θανάτου:** morte física, espiritual ou escatológica? Ecos de Gn 2.17; Dt 30.15-20.
4. **οὐ μόνον αὐτὰ ποιοῦσιν ἀλλὰ καὶ συνευδοκοῦσιν τοῖς πράσσουσιν:** aprovar é **pior** que praticar? Por quê (o pecado elevado a norma social; a corrupção do juízo moral)? Quem lê assim e quem discorda?
5. **A variante de 1.32** (ver Prompt 2, item 4): como ela altera a lógica?
6. **A dobradiça:** liste as pontes verbais 1.32 → 2.1-3 (ἐπιγνόντες / οἴδαμεν; τὰ τοιαῦτα πράσσοντες ×3; ποιεῖς / πράσσεις). Paulo constrói 1.32 **para** ser retomado em 2.1? Há aqui uma ironia: quem **aprova** o pecado (1.32) e quem **condena** o pecado (2.1) estão na mesma sentença?
7. **Implicação pastoral:** o leitor que acabou de concordar com a condenação de 1.18-32 já fez o que 2.1 vai denunciar? Redigir a observação-ponte para o encontro 3 → 4.

---

## BLOCO D — Tópicos 4 e 5: Tu, que julgas; Deus não faz acepção (prompts 11–14)

### Prompt 11 — A virada: Rm 2.1-2

**Eixo focal, segunda metade.** **Pergunta central:** onde eu condeno no outro aquilo que pratico?

1. **Διό:** a dificuldade lógica — como a culpa de quem julga **decorre** de 1.18-32? Soluções: (a) inferência de 1.32 (se quem aprova é culpado, quanto mais quem pratica e julga); (b) de 1.18-32 inteiro; (c) partícula de transição fraca; (d) glosa (Bultmann) `[sentinela S8]`. Avaliar com os critérios do texto.
2. **ἀναπολόγητος εἶ:** a segunda e última ocorrência; a passagem da 3ª pessoa plural (1.18-32) para a 2ª singular. O efeito retórico sobre o leitor que concordava.
3. **ὦ ἄνθρωπε πᾶς ὁ κρίνων — o eixo A (quem é o interlocutor):**
   - o **judeu**, antecipando 2.17 (Moo; Schreiner; Dunn) `[a conferir atribuições]`;
   - o **gentio moralista** / o pretensioso (Stowers, *A Rereading of Romans*; Thorsteinsson, *Paul's Interlocutor in Romans 2*, 2003) `[a conferir presença]`;
   - **todo ser humano** que julga (leitura universal);
   - o **"Mestre"** de Campbell, voz refutada.

   Para cada um: argumento a partir de 2.1-16 (sem 2.17, que nomeia o judeu **depois**), e o que muda na leitura de 1.18-32. ⚠️ Não classificar a identidade judaica como certeza: o rótulo honesto é o que a evidência permite `[sentinela S11]`. Stowers e Thorsteinsson **não são** automaticamente adversários pela Regra Zero: são leituras exegéticas do interlocutor; a Regra Zero incide sobre o **pressuposto** (quando a leitura serve para excluir Israel do diagnóstico universal de 3.9).
4. **ἐν ᾧ γὰρ κρίνεις τὸν ἕτερον, σεαυτὸν κατακρίνεις:** ἐν ᾧ = "naquilo em que" ou "pelo critério com que"? Relação com Mt 7.1-2 (ἐν ᾧ γὰρ κρίματι κρίνετε κριθήσεσθε) — Paulo ecoa a tradição de Jesus?
5. **τὰ γὰρ αὐτὰ πράσσεις ὁ κρίνων:** "as mesmas coisas" literalmente (os mesmos atos de 1.29-31), em espécie, ou em princípio (a mesma rebeldia)? Que vícios da lista o "juiz" pratica de fato?
6. **οἴδαμεν δὲ ὅτι τὸ κρίμα τοῦ θεοῦ ἐστιν κατὰ ἀλήθειαν (2.2):** "nós sabemos" — Paulo e o interlocutor concordam. κατὰ ἀλήθειαν: conforme os fatos (sem aparência) — prepara 2.11 (sem acepção).
7. **Sabedoria 15.1-6:** a autoexceção do justo (15.2: καὶ γὰρ ἐὰν ἁμάρτωμεν, σοί ἐσμεν) logo depois da polêmica anti-idolátrica. Paulo segue a Sabedoria em 1.18-32 e **a vira contra o seu leitor** em 2.1-5? (Linebaugh, *NTS* 57, 2011; Watson, *Paul, Judaism and the Gentiles*) `[a conferir]`.
8. **A recepção:** Orígenes/Rufino, Crisóstomo, Agostinho, Calvino e Lutero sobre 2.1 — quem identificaram como o "homem que julga"?
9. **Implicação pastoral (objetivos 2 e 3):** o moralismo que julga e a indiferença que relativiza — **os dois desvios** da proposta — como 2.1 responde ao primeiro sem cair no segundo? O professor incluído.

---

### Prompt 12 — A bondade que conduz ao arrependimento (2.3-5)

1. **λογίζῃ δὲ τοῦτο, ὦ ἄνθρωπε (2.3):** a pergunta retórica; ὅτι σὺ ἐκφεύξῃ τὸ κρίμα τοῦ θεοῦ — o que sustenta a presunção de escapar?
2. **2.4 — o tríplice dom desprezado:** τοῦ πλούτου τῆς χρηστότητος αὐτοῦ καὶ τῆς ἀνοχῆς καὶ τῆς μακροθυμίας καταφρονεῖς. ἀνοχή reaparece em 3.26 (ἐν τῇ ἀνοχῇ τοῦ θεοῦ) — ponte para a moldura.
3. **ἀγνοῶν ὅτι τὸ χρηστὸν τοῦ θεοῦ εἰς μετάνοιάν σε ἄγει:** ἄγει conativo ("tenta conduzir")? μετάνοια em Paulo (rara: 2Co 7.9-10; 2Tm 2.25). Sb 11.23; 12.10, 19 (Deus dá tempo para o arrependimento) — e Sb 15.1-2 (o "nós" que não precisa dele).
4. **2.5 — o tesouro de ira:** κατὰ δὲ τὴν σκληρότητά σου καὶ ἀμετανόητον καρδίαν θησαυρίζεις σεαυτῷ ὀργήν — o tesouro como ironia; ἐν ἡμέρᾳ ὀργῆς καὶ ἀποκαλύψεως δικαιοκρισίας τοῦ θεοῦ. Ecos de Dt 32.34-35; Sf 1.14-18.
5. **A ira presente (1.18) e a ira futura (2.5):** como a seção sustenta as duas? O eixo B fechado.
6. **A recepção pietista:** Bengel sobre 2.4 `[a conferir — provável fonte]`; Wesley.
7. **Implicação pastoral:** a paciência de Deus lida como aprovação — o erro do moralista e o do indiferente. Redigir a nota do encontro 4.

---

### Prompt 13 — O juízo segundo as obras e sem acepção (2.6-16)

**Pergunta central (tópico 5):** privilégio religioso protege alguém do juízo?

1. **2.6 — ὃς ἀποδώσει ἑκάστῳ κατὰ τὰ ἔργα αὐτοῦ:** Sl 62.13 (LXX 61.13) e Pv 24.12; a estrutura quiástica de 2.6-11 (Jeremias? Grobel?) `[a conferir]`.
2. **2.7-10:** os que buscam δόξαν καὶ τιμὴν καὶ ἀφθαρσίαν "pela perseverança em boa obra" — e Ἰουδαίου τε πρῶτον καὶ Ἕλληνος (2.9, 2.10), o eco de 1.16.
3. **2.11 — οὐ γάρ ἐστιν προσωπολημψία παρὰ τῷ θεῷ:** o termo (formação cristã? a LXX tem πρόσωπον λαμβάνειν) `[sentinela S7]`; Dt 10.17; 2Cr 19.7; Sir 35.12-13.
4. **2.12-13 — o eixo C:** ἀνόμως / ἐν νόμῳ; οὐ γὰρ οἱ ἀκροαταὶ νόμου … ἀλλ' οἱ ποιηταὶ νόμου δικαιωθήσονται. Três leituras:
   - **hipotética** — o princípio da lei, que ninguém cumpre (Moo; leitura luterana clássica) `[a conferir]`;
   - **real** — o juízo final dos crentes, cuja obediência é fruto do Espírito (2.29; 8.4) (Schreiner; Gathercole; Wright) `[a conferir]`;
   - **incoerente** — Paulo contradiz 3.20 (Sanders, *Paul, the Law and the Jewish People*, 1983, apêndice sobre Rm 2; Räisänen, *Paul and the Law*, 1983).

   A terceira é a **objeção** (cláusula 4 por inteiro). O pressuposto a atacar: a leitura de Rm 2 isolada do argumento que culmina em 3.9-20. As duas primeiras são **debate interno conservador** — apresentar as duas saídas e declarar se o texto decide (lição do molde: antes de escrever "a posição conservadora é X", perguntar quem entre os conservadores rejeita X).
5. **2.14-15 — os gentios que "por natureza" fazem a lei:**
   - φύσει com ἔχοντα ("que por natureza não têm a lei") ou com ποιῶσιν ("fazem por natureza")?
   - pagãos que fazem obras isoladas (Moo?) ou **gentios cristãos** (Agostinho, *De spiritu et littera* 26–28; Cranfield; Gathercole, "A Law unto Themselves", *JSNT* 85, 2002) `[a conferir]`?
   - τὸ ἔργον τοῦ νόμου γραπτὸν ἐν ταῖς καρδίαις αὐτῶν e Jr 31.33 (LXX 38.33);
   - συμμαρτυρούσης αὐτῶν τῆς συνειδήσεως; κατηγορούντων ἢ καὶ ἀπολογουμένων — a "defesa" (ἀπολογέομαι) e o ἀναπολόγητος de 2.1.
6. **A objeção inclusivista:** se 2.14-15 descreve pagãos justificados pela lei natural, há salvação sem o evangelho? Apresentar em fonte primária **só se estiver no corpus**; senão, declarar a lacuna. Resposta a partir de 3.9-20 e 3.21-26.
7. **2.16 — κατὰ τὸ εὐαγγέλιόν μου διὰ Χριστοῦ Ἰησοῦ:** o juízo **pertence** ao evangelho — volta a 1.16-18.
8. **Implicação pastoral:** privilégio de conhecimento (o doutor em teologia) é ἀκροατής ou ποιητής?

---

### Prompt 14 — O judeu nomeado e a circuncisão do coração (2.17-29)

1. **Εἰ δὲ σὺ Ἰουδαῖος ἐπονομάζῃ (2.17):** a mudança de interlocutor (ou a sua revelação). Os nove privilégios de 2.17-20 (ἐπαναπαύῃ νόμῳ, καυχᾶσαι ἐν θεῷ, γινώσκεις τὸ θέλημα, δοκιμάζεις τὰ διαφέροντα, ὁδηγὸν … τυφλῶν, φῶς τῶν ἐν σκότει, παιδευτήν, διδάσκαλον, τὴν μόρφωσιν τῆς γνώσεως) — são reais ou ironizados? Ecos de Is 42.6-7.
2. **As perguntas de 2.21-23:** furtar, adulterar, ἱεροσυλεῖς ("roubar templos" ou "cometer sacrilégio"?). Paulo acusa **todo** judeu dessas práticas, ou expõe a contradição de um representante? O problema da generalização.
3. **2.24 — Is 52.5 (LXX):** τὸ γὰρ ὄνομα τοῦ θεοῦ δι' ὑμᾶς βλασφημεῖται ἐν τοῖς ἔθνεσιν. No contexto de Isaías, o nome é blasfemado por causa do **exílio** (sofrimento de Israel), não do pecado de Israel — Paulo reaplica? (E Ez 36.20-23.)
4. **2.25-29 — a circuncisão:** περιτομὴ μὲν γὰρ ὠφελεῖ ἐὰν νόμον πράσσῃς; a "incircuncisão" que guarda τὰ δικαιώματα τοῦ νόμου (2.26) — os mesmos gentios de 2.14-15?; ἐν πνεύματι οὐ γράμματι (2.29) — Dt 30.6; Jr 4.4; Ez 36.26-27; o Espírito antecipado (cf. 7.6; 8.4).
5. **ὁ ἔπαινος οὐκ ἐξ ἀνθρώπων ἀλλ' ἐκ τοῦ θεοῦ (2.29):** o jogo com Ἰουδαῖος / יְהוּדָה / הוֹדָה ("louvor", Gn 29.35; 49.8) `[a conferir]`.
6. **A objeção do anti-judaísmo:** a leitura pós-Holocausto que vê em Rm 2.17-29 polêmica anti-judaica, e as respostas do *Sonderweg* (Gaston, Gager) ou do interlocutor gentio (Stowers). Aplicar a cláusula 4 **somente com fonte primária no corpus**; o pressuposto a atacar: que um diagnóstico universal (3.9: Ἰουδαίους τε καὶ Ἕλληνας πάντας ὑφ' ἁμαρτίαν) seja anti-judaico. A resposta a partir do próprio Paulo (3.1-2; 9.1-5; 11.1, 26-29).
7. **Implicação pastoral:** o "Ἰουδαῖος" de hoje é quem tem Bíblia, credo e cátedra. Redigir a nota do encontro 5 — sem transferir a acusação para "os judeus" e sem anulá-la.

---

## BLOCO E — Tópicos 6 e 7: o veredito e a moldura (prompts 15–16)

### Prompt 15 — Todos debaixo do pecado (3.1-20)

1. **3.1-8 — as objeções:** τί οὖν τὸ περισσὸν τοῦ Ἰουδαίου; (3.1); τὰ λόγια τοῦ θεοῦ (3.2); μὴ ἡ ἀπιστία αὐτῶν τὴν πίστιν τοῦ θεοῦ καταργήσει; (3.3) — a fidelidade de Deus; Sl 51.6 (LXX 50.6) em 3.4 (ὅπως ἂν δικαιωθῇς ἐν τοῖς λόγοις σου); a injustiça humana que "realça" a justiça de Deus (3.5) e a resposta μὴ γένοιτο; a calúnia de 3.8 (ποιήσωμεν τὰ κακά, ἵνα ἔλθῃ τὰ ἀγαθά).
2. **3.9 — προεχόμεθα:** médio ("temos vantagem?" / "nos defendemos?") ou passivo ("estamos em desvantagem?"); a variante textual (Prompt 2). προῃτιασάμεθα — Paulo diz que **já acusou** judeus e gregos: onde? (1.18–2.29 inteiro.)
3. **ὑφ' ἁμαρτίαν:** pecado como **poder** que domina (antecipa 5–7), não só como ato.
4. **A catena (3.10-18):** identificar cada citação (Sl 14.1-3/53.1-3; 5.9; 140.3; 10.7; Is 59.7-8; Sl 36.1) e a forma textual (LXX/TM); a estrutura (caráter 10-12; palavra 13-14; ação 15-17; raiz 18: οὐκ ἔστιν φόβος θεοῦ — o oposto de 1.21). Os textos falavam originalmente dos **ímpios** — Paulo os aplica a Israel ("aos que estão sob a lei", 3.19)?
5. **3.19 — ἵνα πᾶν στόμα φραγῇ καὶ ὑπόδικος γένηται πᾶς ὁ κόσμος τῷ θεῷ:** a cena do tribunal; ὑπόδικος (hapax NT) `[a conferir]`; a boca fechada como a forma narrativa de ἀναπολόγητος. Edwards, *The Justice of God in the Damnation of Sinners* (sermão sobre Rm 3.19) — recepção puritana.
6. **3.20 — ἐξ ἔργων νόμου οὐ δικαιωθήσεται πᾶσα σάρξ:** Sl 143.2 (LXX 142.2: πᾶς ζῶν → πᾶσα σάρξ); **ἔργα νόμου** — obras de obediência à lei em geral, ou marcadores identitários (Dunn, a partir de 4QMMT)? ⚠️ Sem 4QMMT em edição primária no corpus, **não abrir** a leitura de Dunn como refutada: declarar a ausência `[ver JDD LACUNAS]`. διὰ γὰρ νόμου ἐπίγνωσις ἁμαρτίας.
7. **A lógica completa:** como 3.9-20 recolhe todos os fios — gentio (1.18-32), quem julga (2.1-16), judeu (2.17-29) — e torna 2.13 coerente (eixo C)?
8. **Implicação pastoral:** a boca fechada é o fim do argumento e o começo da fé — como conduzir uma turma até aí sem esmagá-la?

---

### Prompt 16 — Síntese: dos indesculpáveis à justiça manifestada (3.21-26 como moldura)

Produza a síntese integradora do projeto:

1. **A tese posta à prova:** "Deus julga segundo a verdade e sem parcialidade; por isso todos — o idólatra e o moralista — são indesculpáveis." Para cada membro da tese, as evidências do texto (κατὰ ἀλήθειαν 2.2; οὐ … προσωπολημψία 2.11; ἀναπολόγητος 1.20, 2.1; πᾶν στόμα 3.19).
2. **A moldura:** νυνὶ δέ (3.21) — temporal ou lógico?; χωρὶς νόμου; μαρτυρουμένη ὑπὸ τοῦ νόμου καὶ τῶν προφητῶν; διὰ πίστεως Ἰησοῦ Χριστοῦ εἰς πάντας τοὺς πιστεύοντας — οὐ γάρ ἐστιν διαστολή (3.22) retoma οὐ γάρ ἐστιν προσωπολημψία (2.11): **a mesma imparcialidade que condena todos justifica todos os que creem**; πάντες γὰρ ἥμαρτον (3.23) retoma 3.9; ἐν τῇ ἀνοχῇ τοῦ θεοῦ (3.26) retoma 2.4; εἰς τὸ εἶναι αὐτὸν δίκαιον καὶ δικαιοῦντα (3.26) responde à pergunta da seção inteira. ⚠️ O ἱλαστήριον (3.25) é **borda**: só a ponte (ver JDD U03).
3. **Os cinco eixos (ESCOPO §4) — o desfecho de cada um**, com o rótulo honesto. Onde o debate é interno ao campo conservador, dizer.
4. **Os três temas transversais:** supressão da verdade, idolatria, abandono judicial — como se encadeiam de 1.18 a 3.20 e como o evangelho reverte cada um (a verdade recebida; a glória restaurada, 3.23 / 8.30; a entrega de Cristo, 4.25 / 8.32, como o avesso do παρέδωκεν).
5. **Mapa de certeza:** consenso amplo · maioria conservadora com dissidência séria · debate aberto · objeções refutadas (com o lugar da refutação) · lacunas declaradas.
6. **Os dois desvios pastorais da proposta:** o moralismo que julga e a indiferença que relativiza — por que "os dois são respondidos pela mesma graça" (formulação da proposta) é exatamente a lógica de 2.11 → 3.22.
7. **Os seis encontros:** derive o esqueleto do `Roteiro_Serie_Indesculpaveis.md` (ESCOPO §6.2), cada encontro com o fecho obrigatório.

Estruture conforme o mapa de consistência (`saidas/00_mapa_consistencia_ind.md`).

---

## Instrução geral de qualidade

- Toda alegação linguística: [FATO TEXTUAL] se verificável no grego/hebraico; [INFERÊNCIA] se interpretação.
- Toda posição de autor: nome + obra + página, **só se a obra estiver no corpus**; senão [CITADO POR TERCEIROS — quem?].
- **Consulta de verificação** depois de cada prompt: para cada autor citado, classificar [FONTE PRIMÁRIA NO CORPUS] / [CITADO POR TERCEIROS — quem?] / [NÃO ENCONTRADO], avisando ao notebook que, em projetos anteriores, ele afirmou presença e precisou se retratar.
- **Consulta de refutação dirigida** sempre que a verificação trouxer objeção sem réplica: *quem, no corpus, responde a esta objeção?*
- Salvar cada saída em `saidas/NN_nome.md` antes de avançar ao próximo prompt.
