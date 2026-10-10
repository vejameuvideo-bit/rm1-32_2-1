# Cadernos Rm 2.1-11 — 4 cadernos × (3 áudios deep dive + 1 debate + 2 vídeos)

*Criado em 09/10/2026 a partir do texto de exegese de Rm 2.1-11 colado pelo usuário. **Nada foi gerado no NotebookLM**: esta sessão (nuvem) não tem a CLI nem o login da conta Pro. O que existe aqui é o **kit pronto para rodar** na máquina do usuário.*

## O que é o texto-base — leia antes de usar

O texto colado abre com *"Como erudito e teólogo conservador, recebo sua requisição…"*: é **resposta de um assistente de IA**, de autoria desconhecida, sem notas nem bibliografia. **Não é fonte acadêmica.** Foi dividido em 4 cadernos e acompanhado de uma **auditoria** (`02_auditoria.md`) que o confronta com o grego (SBLGNT, em disco). A auditoria achou, entre outros: Rm **3.25 → 3.26** (ἀνοχή); προσωπολημψία **não é** da LXX (só a locução πρόσωπον λαμβάνειν); ἔργου ἀγαθοῦ é **singular**; «ocultamente», «crentes» e «Espírito» **não estão** em 2.1 e 2.7; «teologia rabínica» é anacronismo; ἐριθεία confunde duas camadas; T. Levi 3.2, Calvino/Murray/Schreiner e Aristóteles ficam **não verificados**. Os prompts mandam as vozes **corrigir o texto-base ao ar**.

## Os 4 cadernos

| Caderno | Tópico | Texto-base | Fontes no caderno |
|---|---|---|---|
| **C1** | A indesculpabilidade do moralista (2.1-2) | seções 1–2 | `comum/00_contexto_comum.md`, `c1/01_texto.md`, `c1/02_auditoria.md` |
| **C2** | A paciência de Deus e a ira entesourada (2.4-5) | seções 3–4 | idem, `c2/…` |
| **C3** | Obras, galardão e justificação (2.6-10) | seção 5 | idem, `c3/…` |
| **C4** | A imparcialidade de Deus e a síntese (2.11) | seção 6 + Síntese | idem, `c4/…` |

O v. 3 e os vv. 7–10 em detalhe **não são comentados pelo texto-base**; isso consta como «omissão» nas auditorias.

## Mídia por caderno (24 itens — `manifest.csv`, prompts em `prompts/`)

| Caderno | A1 · A2 · A3 (deep dive, long) | A4 debate | V1 · V2 (vídeo) |
|---|---|---|---|
| C1 | professor de grego+aluno · pastor+convertido · historiador+sistemático | defensor × advogado da objeção (2.1 glosa / interlocutor) | explainer/classic · explainer/whiteboard |
| C2 | pastor+convertido · exegeta+doutorando · pregador+ouvinte | (ira impessoal de Dodd / «entesourar» e mérito) | brief/classic · cinematic |
| C3 | exegeta+doutorando · professor+aluno · mentora+estudante | (Rm 2 incoerente com 3–4) | explainer/whiteboard · brief/classic |
| C4 | historiador+sistemático · pregador+ouvinte · pastor+convertido | (opção pelos pobres / eleição) | cinematic · explainer/classic |

**Cota:** 16 áudios + 8 vídeos — dentro de 20/20 por dia e por conta, sobram 4 áudios e 12 vídeos `[a conferir: cota medida em outro projeto]`.

## O debate (A4) — duas travas acima das demais

1. **Não é empate** (Regra Zero): a tese conservadora é defendida e a objeção é refutada pelos cinco itens; o advogado da objeção a apresenta **na melhor versão**.
2. **Proibido terminar em «há debate»**: o episódio fecha com **desfecho explícito**, rotulado, e com a **concessão honesta** do que a objeção acerta. Onde falta obra primária no caderno: **«lacuna»** — a objeção é nomeada, não desenvolvida.

## Como rodar (na máquina do usuário)

```powershell
cd C:\Users\admintrt9a\Projetos\Indesculpaveis
# 1. simulação (não altera nada)
powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil <PERFIL_PRO>
# 2. cadernos + fontes (um de cada vez; conferir 'ready')
powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil <PERFIL_PRO> -Executar -Fase fontes -Caderno 1
# 3. UM item de mídia como teste, depois o lote
powershell -ExecutionPolicy Bypass -File _scripts\criar_cadernos_rm2.ps1 -Perfil <PERFIL_PRO> -Executar -Fase midia -Caderno 1 -Ids "1=<uuid>" -Somente c1_A1
```

⚠️ **Script não testado.** Conferir cada flag com `notebooklm generate --help` (CLI 0.8.4). **Regra 11-D:** um `timeout` em `generate` **não é falha** — nunca repetir o comando; usar `artifact list` / `artifact wait <id>`. Antes de subir a primeira fonte, `auth check --test` deve abrir `aleinstitutoreformado@gmail.com` (Etapa 1 da Fase 0, ainda pendente).

## Estado dentro do projeto IND — leia

- A **trava de sentinelas continua ativa** (tabela verificada vazia). Esta mídia **não é «saída do projeto»**: nasce de um texto não verificado + uma auditoria, e **não substitui** os anéis nem os 16 prompts. Trate os áudios e vídeos como **material de estudo, não publicável**, até as demais sentinelas (S1, S6–S8, S11) serem migradas; S2–S5 já foram em 10/10.
- **Grego:** SBLGNT (CC BY 4.0, Holmes 2010) via MorphGNT — **não o NA28**, que o texto-base diz usar.
- **S7 (προσωπολημψία):** varredura da lista de lemas do Rahlfs não acha o substantivo; **segunda checagem (texto corrido, BDAG/TDNT) pendente** — o C4 diz isso ao ar.
