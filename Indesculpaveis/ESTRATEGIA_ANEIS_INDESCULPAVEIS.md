# Estratégia de anéis — eixo focal Rm 1.29–2.2

*Aplicação de `../ESTRATEGIA_ANEIS.md` (29/09/2026) ao projeto Indesculpáveis.
Tudo o que lá está sobre cotas, limites da CLI e verificação **vale aqui sem
alteração** — este arquivo só define o recorte.*

## 1. Por que o eixo focal, e por que antes do relatório

O piloto de 29/09 já rodou **Rm 1.28–32** em quatro anéis, e o seu anel 2 era
"Rm 1.18–32 + 2.1". O eixo focal deste projeto (1.29–2.2) **é a continuação
natural daquele piloto**: o piloto termina onde a virada começa.

**Ordem (decidida pelo usuário em 03/10/2026): os anéis rodam ANTES do
relatório.** O fluxo do projeto fica:

```
Fase 0 → ANÉIS do eixo 1.29–2.2 (4 cadernos) → 16 prompts → relatório → série
```

**Consequências da ordem:**

1. **A semente do anel 1 não pode ser o relatório IND** (ainda não existe). Passa
   a ser o **estudo Rm 1.28-32 do piloto** + as seções 13–15 do
   `Relatorio_Cap1_Romanos.md` **auditado** (S11, S12 — Fase 0, Etapa 5).
2. **Os anéis passam a alimentar os prompts.** O relatório de cada anel entra
   como **fonte de apoio** no notebook `IND - Rm 1.18-3.20` (herança por
   síntese, nunca por fonte bruta). Os prompts 9–12 (o eixo focal) partem dos
   quatro relatórios dos anéis; o notebook principal **não decide de novo** o
   que os anéis já auditaram — detecta contradições e as devolve ao anel.
3. **A trava de sentinelas vale também para os anéis.** Nenhum relatório de
   anel é redigido, e nenhuma mídia é gerada, com a tabela verificada vazia.
   Mínimo para o anel 1: **S1–S8 e S11** verificadas (as que tocam 1.29–2.2).
4. **Relatório de cada anel:** redigido pelo Claude Code com as três consultas
   (exegética · verificação · refutação dirigida), salvo em
   `aneis/anelN_relatorio.md`, auditado **antes** de virar semente do anel
   seguinte. A mídia de um anel só é gerada **depois** do seu relatório
   auditado — assim os áudios e vídeos não carregam erro que a auditoria pegaria.

Herança por síntese, nunca por fonte bruta.

## 2. Os quatro anéis do eixo focal

| Anel | Escopo | Pergunta | Fontes típicas | Semente |
|---|---|---|---|---|
| **1 — Núcleo** | 1.32–2.2 (o versículo e a virada) | *O que o texto diz e como a virada está construída?* | NA28, BDAG, Metzger, comentários técnicos *ad loc.*, Bultmann (glosa), Thorsteinsson | estudo Rm 1.28-32 do piloto **+** `Relatorio_Cap1_Romanos.md` §§13–15 **auditado** |
| **2 — Contexto imediato** | 1.18–3.20 | *Como a virada governa a perícope?* | comentários da seção; Campbell e as respostas; Stowers (diatribe) | relatório completo do anel 1 |
| **3 — Corpus e intertexto** | Sabedoria 11–15; Mt 7.1-5; Rm 14.3-13 (não julgar o irmão); Tg 4.11-12; Sl 106; Is 52.5 | *Onde mais a Escritura e o judaísmo condenam quem julga?* | LXX, Linebaugh, Watson, literatura do Segundo Templo | relatório do anel 2 |
| **4 — Global** | moralismo e indiferença na tradição e na apologética | *Como a igreja leu e disputa 2.1?* | Crisóstomo, Agostinho, Calvino, Edwards, Bengel, Wesley; adversários em obra primária | relatório do anel 3 |

**Regra de encaixe herdada:** cada consulta de mídia termina com uma ponte
nominal ("isto será retomado no anel N+1"); **Regra Zero em todos os anéis**;
sem espaço para os cinco itens, não abrir a objeção — remeter ao anel que a
tratará (o revisionismo de 1.26-27 pertence ao anel 3 do **piloto 1.28-32**, não
a este eixo).

## 3. Artefatos por caderno (herdado)

4 áudios + 3 vídeos + flashcards + mapa mental + 2 infográficos = **11 por
caderno · 44 no eixo**.

| # | Áudio | Formato | Função neste eixo |
|---|---|---|---|
| A1 | novo convertido + pastor | deep-dive | "eu concordei com 1.32 — e 2.1 me alcançou" |
| A2 | estudante + hermeneuta | deep-dive | Διό, ἀναπολόγητος, as pontes verbais |
| A3 | pastor + exegeta | deep-dive | Campbell e o interlocutor — **conferir contra a Regra Zero** |
| A4 | estudante + exegeta | critique | a tese testada contra a melhor objeção |

⛔ **`debate` não se usa** (equipara os lados).

**Infográficos:** I1 (professional) — as pontes verbais 1.32 → 2.1-3;
I2 (sketch-note) — os grupos julgar/praticar/saber.

## 4. Limites a declarar antes de prometer (herdados)

Vídeo sem `--length`; marca d'água sem opção na CLI (a default traz "Gemini
Notebook"); persona só pelo prompt; flashcards sem `--language`. Medir duração
e idioma; parar em `RATE_LIMITED`.

## 5. Aritmética do eixo

Deep Research: 4 cadernos × 5 = **20** → um dia inteiro de uma conta.
Mídia: 16 áudios + 12 vídeos → cabe em **um dia** numa conta (cota medida: 20
áudios e 20 vídeos/dia). O IND roda na conta Pro própria
(`aleinstitutoreformado@gmail.com`), fora da cota da `default` compartilhada com
o projeto João — mas medir a janela de 24 h antes (`horarios_cota.py`), porque
a independência das cotas entre contas **ainda não foi testada**.

## 6. Sequência dos anéis (antes dos 16 prompts)

| Passo | Trabalho | Saída | Critério |
|---|---|---|---|
| 1 | caderno anel 1; obras locais; 5 DR; triagem R1–R4 | fontes `ready` | 0 erro; poda com backup |
| 2 | três consultas → relatório | `aneis/anel1_relatorio.md` | rótulos, sentinelas, Regra Zero, ponte 3.21-26 |
| 3 | mídia do anel 1 (11 artefatos) | — | contagem por identidade; idioma e duração medidos |
| 4–12 | idem para os anéis 2, 3 e 4, cada um semeado pelo relatório anterior | `aneis/anel2..4_relatorio.md` | idem |
| 13 | subir os 4 relatórios no notebook `IND - Rm 1.18-3.20` | — | `ready`; seguir para a Sessão 1 da `Sequencia_Indesculpaveis.md` |
