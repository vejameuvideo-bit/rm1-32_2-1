# Estratégia de anéis — eixo focal Rm 1.29–2.2

*Aplicação de `../ESTRATEGIA_ANEIS.md` (29/09/2026) ao projeto Indesculpáveis.
Tudo o que lá está sobre cotas, limites da CLI e verificação **vale aqui sem
alteração** — este arquivo só define o recorte.*

## 1. Por que o eixo focal, e por que depois do relatório

O piloto de 29/09 já rodou **Rm 1.28–32** em quatro anéis, e o seu anel 2 era
"Rm 1.18–32 + 2.1". O eixo focal deste projeto (1.29–2.2) **é a continuação
natural daquele piloto**: o piloto termina onde a virada começa.

**Ordem recomendada:** primeiro o relatório (16 prompts), depois os anéis.
O relatório é a semente do anel 1 — mesma lógica do estudo Rm 1.28-32 no piloto.
Herança por síntese, nunca por fonte bruta.

## 2. Os quatro anéis do eixo focal

| Anel | Escopo | Pergunta | Fontes típicas | Semente |
|---|---|---|---|---|
| **1 — Núcleo** | 1.32–2.2 (o versículo e a virada) | *O que o texto diz e como a virada está construída?* | NA28, BDAG, Metzger, comentários técnicos *ad loc.*, Bultmann (glosa), Thorsteinsson | `Relatorio_Indesculpaveis.md` (saídas 9–12) **+** estudo Rm 1.28-32 do piloto |
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
áudios e 20 vídeos/dia). ⚠️ A cota de áudio da default é **compartilhada com o
projeto João** — medir a janela de 24 h antes (`horarios_cota.py`).
