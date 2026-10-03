# Estratégia de cadernos em anéis + artefatos (proposta de 29/09/2026)

*Regra do usuário: cada tópico relevante = 1 conjunto de 4 cadernos (um por anel). Por caderno: 4 áudios (personas variadas), 3 vídeos longos (personas variadas, sem marca d'água), flashcards, mapa mental e 2 infográficos.*

## 1. Os anéis (o que entra em cada caderno)

| Anel | Escopo | Pergunta que o caderno responde | Fontes típicas |
|---|---|---|---|
| **1 — Núcleo** | o versículo ou termo | *O que o texto diz e como está construído?* | léxicos, gramáticas, comentários técnicos *ad loc.*, artigos sobre o termo, o adversário em obra primária |
| **2 — Contexto imediato** | a perícope (ex.: Rm 1.18–32 + 2.1) | *Como o núcleo funciona no argumento?* | comentários da seção, estudos de retórica/estrutura, textos adjacentes |
| **3 — Corpus e intertexto** | Romanos inteiro, Paulo, AT e intertestamentário | *Onde mais Paulo e a Bíblia dizem isto?* | teologia paulina, LXX, Sabedoria, Qumran, paralelos (Ef 4.17–19, 2Tm 3) |
| **4 — Global** | teologia bíblica, sistemática, história da interpretação, apologética | *Como a igreja e o mundo leem e disputam isto?* | patrística, reformada, pietista, wesleyana, pentecostal, adversários liberais em obra primária |

**Regras de encaixe**
- **Herança por síntese, não por fonte bruta.** O anel N recebe do anel N−1 só o **relatório completo** (como fonte de apoio) e o mapa de "pontes" — nunca as fontes brutas. Mantém cada caderno abaixo de 300 fontes e evita duplicar obra.
- **Cada consulta de mídia termina com uma ponte nominal** ("isto será retomado no anel N+1, caderno X").
- **Regra Zero em todos os anéis.** Antes de abrir uma objeção, conferir se o adversário tem obra própria **no caderno daquele anel** (título e sobrenome). Sem espaço para os cinco itens da refutação, não abrir; remeter ao anel que a tratará.

## 2. Aritmética

Por caderno: 4 + 3 + 1 + 1 + 2 = **11 artefatos**. Por tópico (4 anéis): **16 áudios · 12 vídeos · 4 flashcards · 4 mapas · 8 infográficos = 44 artefatos**.

| Tópicos | Cadernos | Áudios | Vídeos | Infográficos | Total de artefatos |
|---|---|---|---|---|---|
| 1 | 4 | 16 | 12 | 8 | 44 |
| 5 | 20 | 80 | 60 | 40 | 220 |
| 10 | 40 | 160 | 120 | 80 | 440 |

**Cotas medidas (conta com plano Pro):** 20 áudios e 20 vídeos por dia por conta, corte 00:00 UTC (21h BRT); ~20 Deep Researches aceitas por dia. Cota de flashcards, mapa e infográfico: **não medida**.
- 1 tópico = 16 áudios e 12 vídeos → cabe em **1 dia numa conta**, nunca 2 tópicos.
- Deep Research: 4 cadernos × 5 consultas = **20** → gasta o dia inteiro. Logo o gargalo é o **Deep Research**, não a mídia.
- Duas contas (`default` e `pro`) dobram o ritmo **[HIPÓTESE: cotas independentes por conta — ainda não testada]**. A conta `default` é compartilhada com outras janelas.

## 3. Pipeline por tópico (3 dias por conta, escalonável)

| Dia | Trabalho | Verificação (com número) |
|---|---|---|
| D1 | criar 4 cadernos; subir obras locais; 5 DR por caderno (20) | fontes `ready` por identidade; 0 erro |
| D2 | triagem R1–R4, poda com backup, aquisição de obras faltantes | fontes apagadas presentes = 0; locais preservadas = N/N |
| D3 | mídia: 16 áudios + 12 vídeos + 4 flashcards + 4 mapas + 8 infográficos | contagem por identidade; idioma medido; duração medida |

Duas contas em fase: A faz D1 enquanto B faz D3 → 1 tópico concluído por dia.

## 4. Os 11 artefatos de cada caderno

**Áudios (4)** — variar **persona e formato** (`--format deep-dive|brief|critique|debate`, `--length long`):

| # | Dupla (molde Metallaxan) | Formato | Função |
|---|---|---|---|
| A1 | novo convertido + pastor | deep-dive | porta de entrada, o "porquê importa" |
| A2 | estudante + hermeneuta | deep-dive | método e gramática |
| A3 | pastor + exegeta | deep-dive | refutação (Regra Zero) |
| A4 | estudante + exegeta | critique | teste da tese contra a melhor objeção |

⚠ **`debate` não deve ser usado**: pela sua natureza equipara os lados e conflita com a Regra Zero ("jamais equiparar…"). Só com trava explícita que force desfecho.

**Vídeos (3)** — `--format explainer|brief|cinematic`, `--style auto|classic|whiteboard|…`. **Personas só entram pelo prompt** (não há flag). Sugestão: V1 explainer/classic (exposição), V2 explainer/whiteboard (estrutura e grego), V3 cinematic (síntese e aplicação).

**Flashcards (1)** — `--quantity more --difficulty hard`; **não há `--language`**: exigir pt-BR no prompt e **medir** o idioma dos cartões.
**Mapa mental (1)** — `--kind interactive`, `--language pt_BR`.
**Infográficos (2)** — `--language pt_BR`, `--orientation portrait --detail detailed`; I1 `--style professional` (estrutura do argumento), I2 `--style sketch-note` (mapa de termos).

## 5. Limites que a CLI **não** deixa cumprir (declarar antes de prometer)

1. **"Vídeo longo":** `generate video` **não tem `--length`** (só `--format` e `--style`). A duração depende do formato e do prompt. **Medir a duração real** do primeiro vídeo e só então fixar a meta.
2. **"Sem marca d'água":** **não há opção na CLI**. Pode depender do plano da conta. **Teste antes de gerar em massa:** gerar 1 vídeo na conta Pro, extrair um quadro e inspecionar os cantos. Se houver marca, é restrição do produto — **não** a removo por edição.
3. **Persona:** só pelo texto do prompt, em áudio e vídeo.
4. **Flashcards sem `--language`:** idioma não garantido.

## 6. Verificação de cada lote (deve poder falhar)

- **Contagem por identidade** (IDs distintos), nunca só pelo total.
- **`artifact get <id>`** para status; `artifact list` pode mostrar `pending` para artefato já completo.
- **Idioma por Whisper** em amostra de 30 s do meio (para vídeo, extrair o áudio antes).
- **Duração medida** (ffprobe) e registrada.
- **Trava anti-alucinação + Regra Zero** em toda consulta (`_trava_comum`, 6 regras; fecho cristocêntrico).
- Parar em `RATE_LIMITED`; nunca retentar às cegas.

## 7. Piloto sugerido

**Rm 1.28–32** — o estudo aprofundado feito hoje (`estudo_Rm1.28-32/`) vira o **relatório-semente do anel 1**. Anel 2 = Rm 1.18–32 + 2.1; anel 3 = Romanos e intertexto (Sb 14, Gn 2–3, Ef 4.17–19); anel 4 = ira, juízo e depravação noética na tradição e na apologética.
