# Força-tarefa de 14/10/2026 — verificação por fontes abertas

*Pedido do usuário: "força tarefa imediatamente para finalizar as pendências; buscar alternativas". Esta sessão (nuvem) só alcança **GitHub e PyPI**; NA28, BDAG, Metzger, TDNT e o artigo de Bultmann estão fora de alcance. A alternativa foi trocar cada fonte licenciada por **edições abertas legítimas**, declarando a troca.*

## Fontes usadas (todas abertas, com versão)

| Fonte | O que substitui | Repositório @ commit (data) | Licença |
|---|---|---|---|
| Transcrição eletrônica do **P46** (CNTR, A. Bunning) | lista de papiros do NA28 | Center-for-New-Testament-Restoration/transcriptions @ 4e743a4 (2026-10-01) | CC BY-SA 4.0 |
| **LSJ** (Liddell–Scott–Jones, ed. Perseus) | BDAG (parcial) | PerseusDL/lexica @ 56061ca (2026-09-02) | CC BY-SA |
| **Abbott-Smith**, *Manual Greek Lexicon of the NT* (1922) | BDAG (parcial); marca LXX/clássicos | translatable-exegetical-tools/Abbott-Smith @ 8c00cb2 | domínio público / CC |
| **LXX Rahlfs 1935** | LXX Rahlfs (mesma edição) | eliranwong/LXX-Rahlfs-1935 @ a1b5ff1 | ver repositório |
| **WLC** (Westminster Leningrad Codex, morphhb) | BHS | openscriptures/morphhb @ 3d15126 | domínio público / CC BY 4.0 (morfologia) |
| **Aristóteles, *Política*** (Perseus) | — | PerseusDL/canonical-greekLit @ 01b725d | CC BY-SA |
| **Agostinho, *De spiritu et littera*** (CSEL 60, Urba–Zycha) | — | OpenGreekAndLatin/csel-dev @ 2813e3a | CC BY-SA |
| **notebooklm-py 0.8.4** (PyPI) | — (sintaxe da CLI) | pypi.org | — |

## Resultado por sentinela

| # | Antes | Agora | Base |
|---|---|---|---|
| **S1** P46 | ❓ indício | ✅ **migrada** | P46 (CNTR): 247 versículos de Rm, o primeiro é **5.17** (fragmentário). Faixas: 5.17–6.14; 8.15–25; 8.27–35; 8.37–11.22; 11.24–33; 11.35–16.27. Nenhum versículo de Rm 1–4. *Corrige também o roteiro: o P46 tem 16.25-27 nesta transcrição (a posição da doxologia no códice não foi conferida).* |
| S2 | migrada 10/10 | reforçada | LSJ e Abbott-Smith: Rm 1.20; 2.1 (Abbott-Smith dá a lista como completa) |
| **S6** θεοστυγεῖς | rascunho | ✅ **migrada** | LSJ: passivo nos clássicos (Eurípides, *Tr.* 1213; *Cyc.* 602); «some take it Act.» em Rm 1.30. Abbott-Smith: passivo «as freq. in cl.»; ativo na margem da RV |
| **S7** προσωπολημψία | rascunho | ✅ **migrada** | Rahlfs (lemas + texto corrido: 0); LSJ (só NT); Abbott-Smith * † (fora da LXX/versões gregas e dos clássicos). LXX tem a locução (Lv 19.15; Ml 1.8; 2.9) |
| **S14** Is 52.5 | rascunho | ✅ **migrada** | TM: «וְתָמִיד כָּל הַיּוֹם שְׁמִי מִנֹּאָץ» (sem «por vossa causa», sem «entre as nações»); LXX: «δι’ ὑμᾶς διὰ παντὸς τὸ ὄνομά μου βλασφημεῖται ἐν τοῖς ἔθνεσιν». Contexto de exílio: «כִּי לֻקַּח עַמִּי חִנָּם» |
| S13 gentios de 2.14-15 | rascunho | 🟡 **Agostinho conferido; não migra** | *De spir. et litt.* 26.44–47; 27.48 (lê como cristãos: «per gratiam reparata natura»); 28.49 deixa aberta a leitura «resquícios da imagem». Cranfield/Gathercole/Moo seguem sem leitura |
| **S8** Bultmann | rascunho | ❌ **sem alternativa** | *TLZ* 72 (1947) não está em nenhum repositório aberto alcançável. Continua rascunho |
| S9, S10, S11, S12 | — | não tocadas | dependem de comentários/monografias modernas protegidas |

**Tabela verificada: 8** (S1–S7, S14). **Para o anel 1 faltam S8 e S11.**

## Correções que a força-tarefa produziu na auditoria do texto de Rm 2.1-11

1. **Erro meu, corrigido (C4, 4.3):** eu tinha escrito que Lv 19.15 proíbe «levantar o rosto do **grande**». O TM diz «לֹא תִשָּׂא פְנֵי דָל» — נשא פנים vai com o **pobre**; o grande recebe outro verbo (הדר). LXX: «οὐ λήμψῃ πρόσωπον πτωχοῦ οὐδὲ θαυμάσεις πρόσωπον δυνάστου».
2. **C2:** o paralelo mais forte de Rm 2.5 é **Tb 4.9 (LXX)**: «θησαυρίζεις σεαυτῷ εἰς ἡμέραν ἀνάγκης» — mesma sequência verbal, sentido invertido. Sb 15.1-2 e 11.23 trazem χρηστός, μακρόθυμος e εἰς μετάνοιαν (pano de fundo de 2.4).
3. **C2:** δικαιοκρισία — LSJ só registra Rm 2.5, Heféstion e P.Oxy. 71 (séc. IV d.C.); ausente da LXX Rahlfs (só δικαιοκρίτης, 2Mc 12.41). **T. Levi 3.2 continua não conferido.**
4. **C3:** Rm 2.6 = LXX Sl 61.13 / Pv 24.12, quase palavra por palavra (conferido). Aristóteles, *Pol.* 1302b4/1303a14, conferido no grego: ἐριθεία = intriga eleitoral, **não** trabalho mercenário.
5. **C2:** Êx 34.6 TM «אֶרֶךְ אַפַּיִם» = LXX «μακρόθυμος» (conferido).

## O que nenhuma alternativa resolve daqui

- **S8** (Bultmann, *TLZ* 1947), **S11** e S9–S10, S12–S13 (comentários modernos protegidos).
- NA28 e Metzger para as **testemunhas** de S4.
- **Geração** de áudios e vídeos: exige o login da conta Pro na máquina do usuário.
- Método de **conteúdo** (consulta ao notebook): só existirá depois da Etapa 1.

⚠️ **Limite da substituição.** Abbott-Smith (1922) e LSJ não são o BDAG; o P46 do CNTR é transcrição, não a imagem nem a lista do NA28. Cada linha migrada traz essa ressalva na coluna «Verificado em».
