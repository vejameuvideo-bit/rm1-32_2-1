# Fase 0 — Preparação do Indesculpáveis

*Do zero até o primeiro prompt redigido. Cada etapa tem critério de saída
verificável. Não avançar sem ele. Adaptado de `../FASE_0_CHECKLIST.md` (JDD).*

---

## Etapa 0 — Decisões do usuário

Responder `ESCOPO_INDESCULPAVEIS.md` §8 (formato da série; tópicos 6–7; conta;
anéis; relação com a U02 do JDD).

**Critério:** as cinco respostas registradas em `MEMORIA_INDESCULPAVEIS.md`.

## Etapa 1 — Pasta local e ambiente

Criar `C:\Users\admintrt9a\Projetos\Indesculpaveis` (raiz própria, como o JDD),
copiar esta pasta do repositório e criar `biblioteca\`, `_processados_md\`,
`_fora_do_notebook\`.

```powershell
notebooklm -p default auth check --test
```

⚠️ Pendências herdadas de `../ESTADO_ATUAL_2026-10-03.md` §6: login da Pro
bloqueado (`rookie_cookies.pyd`); `patch_rpc_limit.ps1` aponta o módulo antigo
da CLI 0.7.3. Resolver **antes** de qualquer triagem com caderno grande.

**Critério:** auth válida medida por `auth check --test` (não por `profile list`).

## Etapa 2 — Biblioteca (FRONTEIRA IND)

Copiar para `biblioteca\` as obras da `CURADORIA_FONTES_INDESCULPAVEIS.md`
marcadas "JDD" ou "Cap1". **A cópia é o ato de entrada.** Nada é lido na pasta
de outro projeto.

Para cada obra "ausente": **dupla checagem** (inventário + conteúdo) antes de
pô-la na lista de compra. Lembrar: Thorsteinsson se procura **pelo título**.

⚠️ **Orígenes:** o JDD tem os livros 6–10 da tradução; Rm 1–3 está nos livros
1–3. Verificar antes de contar como presente.

**Critério:** toda obra da curadoria marcada ✅ (em disco, autoria conferida
pelo miolo) ou ❌ (ausente, com dupla checagem registrada).

## Etapa 3 — Diagnóstico e conversão

Para cada PDF: diagnóstico; **toda obra "PDF são" de estudos bíblicos com zero
grego = OCR** (Harris, Bauckham). Inspecionar o miolo (pp. 40–60) antes de
decidir OCR (Regra 13). Bengel: grego zerado no JDD — não reaproveitar o `.md`
sem reconversão.

**Critério:** todo `.md` com o bloco `<!-- AVISO-OCR-INICIO -->` no cabeçalho;
nenhum acima do teto.

## Etapa 4 — 🚩 SENTINELAS (a etapa que não se pula)

Verificar os rascunhos S1–S14 de `_artifacts/sentinelas_IND.md`, um por vez:
consulta de verificação **e** conferência em disco (NA28, Metzger, a obra).
Migrar para a tabela contada só o que passar.

**Critério de saída:** **pelo menos 8 sentinelas** na tabela verificada, e as
duas da classe 5 (S11, S12) resolvidas — o relatório-semente auditado.

## Etapa 5 — Auditoria do relatório-semente

Antes de subir `Relatorio_Cap1_Romanos.md` como fonte de apoio:
(a) corrigir o rótulo da identidade do interlocutor (S11);
(b) ler a seção de 1.26-27 contra os cinco itens (S12).
Subir a versão auditada **com nome distinto** (`..._auditado_IND.md`) — o
original pertence ao projeto Cap1.

**Critério:** registro da auditoria em `_LOG_EXECUCAO.md`.

## Etapa 6 — Montar o notebook

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\subir_reocr.ps1 -Simular
```

Aplicar `_artifacts/persona_notebooklm.txt` e `--response-length longer`.
Gravar o ID em `projeto.config.txt` (só o ID) e anotar em `CLAUDE.md` §5.

**Critério:** todas as fontes `ready`, zero `error`; contagem confirmada por
`source list -n <id> --json` (campo `count`).

## Etapa 7 — Pauta de refutação

Conferir cada linha de `LACUNAS_REFUTACAO.md` por consulta **e** por disco.

**Critério:** toda linha marcada `✅ conferido` ou com a ausência declarada.

## Etapa 8 — Primeiro prompt

### 8.0 — Reconferir os adversários do prompt

Para cada objeção do prompt: o adversário tem **obra própria** no corpus? Por
título **e** sobrenome. Resenha e ficha de catálogo não servem. Sem obra
própria, **não abrir a objeção**.

> *Custo de pular (Romanos-Cap2):* 13 saídas prontas e travadas na véspera da
> redação, porque Stowers, Campbell e Thorsteinsson não tinham obra no corpus.

### 8.1 — As três consultas

Ver `Sequencia_Indesculpaveis.md`, Etapa 2.

**Critério:** saída com rótulos em toda afirmação, toda objeção fechada com
resposta, sentinelas conferidas, ponte para 3.21-26, e auditoria registrando o
que a verificação pegou.
