# Sequência de Execução — Romanos Capítulo 1

**Objetivo:** produzir 16 capítulos de pesquisa + mapa de consistência + síntese + relatório consolidado sobre Rm 1.1–32, usando o notebook NotebookLM existente e executando no Claude Code.

---

## Pré-Requisitos (checar antes de começar)

```powershell
# Na pasta Romanos-Pesquisa:
powershell -ExecutionPolicy Bypass -File .\checar_ambiente.ps1
```

Esperado: Python, uv, notebooklm-py, Claude Code todos [OK]. Se auth falhar: `notebooklm login`.

---

## Etapa 1 — Verificar o Notebook Existente

```powershell
notebooklm auth check --test
notebooklm list
notebooklm use c0b6f27a          # ID do notebook "Romanos - Introducao"
notebooklm source list --no-truncate   # confirmar 26 fontes ready
notebooklm status                # confirmar notebook ativo
```

> **Não criar notebook novo.** As 26 fontes já indexadas cobrem o capítulo 1.

---

## Etapa 2 — Configurar Nova Conversa

Dentro do notebook ativo, inicie uma conversa dedicada para Romanos 1:

```powershell
notebooklm ask --new -y "Iniciando pesquisa sobre Romanos Capítulo 1 (Rm 1.1-32). Confirme que você tem acesso às 26 fontes e liste as que são mais relevantes para exegese do capítulo 1."
```

> **Atenção:** `--new` apaga a conversa anterior. Use `-y` para pular a confirmação.
> Se quiser preservar o histórico da pesquisa anterior, salve com `notebooklm history --save -t "Historico_Introducao"` antes.

---

## Etapa 3 — Verificar a Persona

A persona já deve estar configurada do projeto anterior. Confirme:

```powershell
notebooklm configure        # mostra a configuração atual
```

Se não estiver com a persona do Erudito Bíblico Conservador, reconfigure:

```powershell
$persona = Get-Content ..\persona_notebooklm.txt -Raw -Encoding UTF8
$persona = $persona -replace '"', "'"
notebooklm configure --persona $persona
```

---

## Etapa 4 — Execução dos Blocos (Claude Code)

**Regra:** máximo 4 prompts por sessão do Claude Code para evitar estouro de contexto.

### Sessão 1 — Bloco A (prompts 1–4): Fundamentos Textuais

Abra o Claude Code na pasta `Romanos-Cap1`:

```powershell
cd C:\Users\admintrt9a\Documents\Romanos-Pesquisa\Romanos-Cap1
claude
```

Dentro do Claude Code, instrua:

```
Leia o arquivo sistema_erudito.md em ../sistema_erudito.md e aplique como persona.
Leia os prompts 1, 2, 3 e 4 de prompts_cap1.md.

Para cada prompt:
1. Execute: notebooklm ask --prompt-file <arquivo_temporario> --json
2. Salve a saída completa em saidas/01_praescriptum.md, saidas/02_proem.md, saidas/03_estrutura.md, saidas/04_critica_textual.md
3. Faça um checkpoint de qualidade (3–5 linhas) verificando: protocolo anti-alucinação seguido? Fontes citadas? Análise do grego presente?
4. Só avance ao próximo prompt após salvar e checar o anterior.

NÃO execute mais de 4 prompts nesta sessão.
```

### Sessão 2 — Bloco B (prompts 5–6): Cristologia

```
Leia sistema_erudito.md em ../sistema_erudito.md.
Execute prompts 5 e 6 de prompts_cap1.md.
Salve em saidas/05_cristologia_1_3_4.md e saidas/06_obediencia_fe.md.
Checkpoint de qualidade após cada um.
NÃO execute mais de 4 prompts nesta sessão.
```

### Sessão 3 — Bloco C (prompts 7–9): A Tese Central

```
Leia sistema_erudito.md em ../sistema_erudito.md.
Execute prompts 7, 8 e 9 de prompts_cap1.md.
Salve em saidas/07_propositio.md, saidas/08_dikaiosyne.md, saidas/09_ek_pisteos.md.
Checkpoint após cada um.
NÃO execute mais de 4 prompts nesta sessão.
```

### Sessão 4 — Bloco D parte 1 (prompts 10–12): Diagnóstico Universal

```
Leia sistema_erudito.md em ../sistema_erudito.md.
Execute prompts 10, 11 e 12 de prompts_cap1.md.
Salve em saidas/10_orge_theou.md, saidas/11_revelacao_natural.md, saidas/12_idolatria.md.
Checkpoint após cada um.
NÃO execute mais de 4 prompts nesta sessão.
```

### Sessão 5 — Bloco D parte 2 (prompts 13–15)

```
Leia sistema_erudito.md em ../sistema_erudito.md.
Execute prompts 13, 14 e 15 de prompts_cap1.md.
Salve em saidas/13_paredoken.md, saidas/14_etica_sexual.md, saidas/15_catalogo_vicios.md.
Checkpoint após cada um.
NÃO execute mais de 4 prompts nesta sessão.
```

### Sessão 6 — Mapa de Consistência + Síntese

```
Leia todos os arquivos em saidas/ (01 a 15).
Produza um mapa de consistência (saidas/00_mapa_consistencia_cap1.md) com:
- Dependências entre capítulos
- Matriz de certeza (fato textual / inferência forte / hipótese debatida)
- Contradições internas a resolver
- Mapa teológico-estrutural de Rm 1.1-32

Depois, execute o prompt 16 de prompts_cap1.md e salve em saidas/16_sintese_cap1.md.
Checkpoint de qualidade geral.
```

---

## Etapa 5 — Consolidação do Relatório

Após ter todos os 16 arquivos em `saidas/`, abra uma nova sessão do Claude Code:

```
Consolide todos os arquivos de saidas/ (00_mapa + 01 a 16) num único documento:
Relatorio_Cap1_Romanos.md

Estrutura obrigatória:
- Folha de rosto
- Nota metodológica (mesmo modelo do Relatorio_Romanos.md em ../)
- Sumário
- Parte I: Fundamentos Textuais e Estruturais (caps. 1–4)
- Parte II: Cristologia do Praescriptum (caps. 5–6)
- Parte III: A Tese Central — Rm 1.16–17 (caps. 7–9)
- Parte IV: O Diagnóstico Universal — Rm 1.18–32 (caps. 10–15)
- Conclusão: Síntese de Romanos 1 (cap. 16)
- Referências (as 26 fontes do notebook)

Salvar em: C:\Users\admintrt9a\Documents\Romanos-Pesquisa\Romanos-Cap1\Relatorio_Cap1_Romanos.md
```

---

## Etapa 6 — Converter para DOCX e PDF

```powershell
cd C:\Users\admintrt9a\Documents\Romanos-Pesquisa\Romanos-Cap1

# Markdown → DOCX
pandoc Relatorio_Cap1_Romanos.md -o Relatorio_Cap1_Romanos.docx --from markdown --to docx

# DOCX → PDF (via LibreOffice)
& "C:\Program Files\LibreOffice\program\soffice.exe" --headless --convert-to pdf Relatorio_Cap1_Romanos.docx
```

> Se as tabelas do DOCX ficarem sem segunda coluna: descompacte o .docx, edite `word/document.xml` trocando `w:w="0.0"` por `w:w="5000"` nas tags `<w:tblW>`, recompacte. Mesmo fix do projeto anterior.

---

## Estrutura de Arquivos Esperada ao Final

```
Romanos-Cap1/
├── prompts_cap1.md          ← 16 prompts de pesquisa
├── Sequencia_Cap1.md        ← este arquivo
├── MEMORIA_CAP1.md          ← backup/memória do sub-projeto
├── Relatorio_Cap1_Romanos.md
├── Relatorio_Cap1_Romanos.docx
├── Relatorio_Cap1_Romanos.pdf
└── saidas/
    ├── 00_mapa_consistencia_cap1.md
    ├── 01_praescriptum.md
    ├── 02_proem.md
    ├── 03_estrutura.md
    ├── 04_critica_textual.md
    ├── 05_cristologia_1_3_4.md
    ├── 06_obediencia_fe.md
    ├── 07_propositio.md
    ├── 08_dikaiosyne.md
    ├── 09_ek_pisteos.md
    ├── 10_orge_theou.md
    ├── 11_revelacao_natural.md
    ├── 12_idolatria.md
    ├── 13_paredoken.md
    ├── 14_etica_sexual.md
    ├── 15_catalogo_vicios.md
    └── 16_sintese_cap1.md
```

---

## Dicas Anti-Overflow (lições do projeto anterior)

1. **Máx. 4 prompts por sessão** — nunca ultrapasse; o overflow perdeu 5 arquivos no experimento anterior.
2. **Salvar antes de avançar** — sempre confirme o arquivo em `saidas/` antes do próximo prompt.
3. **Prompts longos via `--prompt-file`** — os prompts 5, 8, 9, 14 são densos; melhor criar um `.txt` temporário e usar `notebooklm ask --prompt-file prompt_temp.txt`.
4. **Checkpoint obrigatório** — após cada capítulo, 3–5 linhas confirmando: análise do grego? Fontes citadas? Protocolo anti-alucinação?
5. **Se tudo travar:** `notebooklm auth check --test` primeiro; sessão expirada é a causa mais comum.
