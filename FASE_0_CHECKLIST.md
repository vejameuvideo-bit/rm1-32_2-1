# Fase 0 — Preparação de Justica-de-Deus

*Gerado em 02/08/2026 pelo molde. **Do zero até o primeiro capítulo redigido.***

Cada etapa tem um **critério de saída** verificável. Não avançar sem ele.

---

## Etapa 0 — Ler as regras (5 min)

```powershell
cd C:\Users\admintrt9a\Projetos\Justica-de-Deus
powershell -ExecutionPolicy Bypass -File _scripts\checagem_retomada.ps1 -SoRegras
```

**Critério de saída:** você leu a Regra Zero, o padrão de cinco itens e as
**exceções**. As exceções são a parte que se esquece e custa caro.

---

## Etapa 1 — Ambiente

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\checar_ambiente.ps1
notebooklm auth check --test
```

**Critério:** Python, Tesseract (com `grc` em `tessdata_extra`),
Poppler e a CLI do NotebookLM respondem. Auth válida.

---

## Etapa 2 — Biblioteca e diagnóstico

Colocar os PDFs em `biblioteca\`, depois:

```powershell
$py = "$env:USERPROFILE\AppData\Local\Programs\Python\Python314\python.exe"
& $py "$env:USERPROFILE\.claude\skills\pdf-para-md\diagnosticar_pdf.py" --pasta biblioteca --alfabeto grego > _diagnostico_biblioteca.txt
```

⚠️ **Toda obra marcada "PDF são" precisa de uma segunda verificação.** O
diagnóstico não detecta camada de texto limpa com o alfabeto original **apagado**
— foi assim com Harris (*EGGNT*) e com Bauckham (*Jesus and the Eyewitnesses*),
ambos com **zero** caracteres gregos em mais de 140 mil palavras.

```powershell
pdftotext -q "biblioteca\OBRA.pdf" teste.txt
# depois contar caracteres do alfabeto original; zero em obra academica = OCR
```

**Critério:** todo PDF classificado, e todo "PDF são" de obra acadêmica
confirmado por contagem de alfabeto.

---

## Etapa 3 — Curadoria

Preencher `CURADORIA_FONTES_JUSTICA-DE-DEUS.md` com tiers:

| Tier | O que é |
|---|---|
| **S** | comentários de referência e o **adversário principal** |
| **A1** | crítica acadêmica de peso |
| **A2** | patrística, medieval, Reforma |
| **B** | monografias temáticas |
| **C** | pastorais e introduções |
| **D** | **sai** — sem valor exegético |

⚠️ **Divergir da linha editorial NÃO é critério de exclusão.** A obra adversária
de peso **entra** — o item 1 do padrão de refutação a torna obrigatória. Sai o que
é ruim, não o que discorda.

Mover Tier D e duplicatas para `_fora_do_notebook\`.

**Critério:** todo PDF com tier atribuído; `_fora_do_notebook\` povoado.

---

## Etapa 4 — 🚩 SENTINELAS (a etapa que não se pula)

Preencher `_artifacts\sentinelas_JD.md` seguindo as sete fontes de erro
descritas lá. **Consultando o notebook, não a memória** — e confirmando com a
consulta de verificação.

**Critério de saída:** a tabela tem **pelo menos 6 sentinelas**, cada uma com o
erro, por que é atraente, e a formulação correta.

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\verificar_sentinelas.ps1
```

### Isto é verificado automaticamente — você não precisa lembrar

O projeto nasce com três avisos ligados, que **medem o estado antes de falar**:

| Quando | O que acontece |
|---|---|
| **Ao abrir a sessão** | o estado das sentinelas é impresso |
| **Ao escrever em `saidas/`** | se estiverem **vazias**, a escrita é **bloqueada**; se **incompletas**, passa com aviso; se prontas, **silêncio** |
| **Ao fim da sessão** | lista as saídas escritas no dia e cobra o checkpoint factual |

O bloqueio é proporcional: só trava quando não há **nenhuma** sentinela, que é
o caso em que o capítulo sairia confiante e errado. Nada disso dispara quando
está tudo certo — aviso que fala sempre é aviso que se aprende a ignorar.

> **Ter as sentinelas não é o mesmo que usá-las.** O hook de fim de sessão cobra
> o checkpoint: alguma foi tocada? A formulação está correta? Algum rótulo foi
> inflado?

---

## Etapa 5 — Conversão em lote

Preencher `_scripts\lotes_ocr.csv` (uma linha por obra que precisa de OCR) e:

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\converter_lote.ps1 -Lote A
```

**Ganho comprovado:** rodar **dois streams em paralelo** (duas janelas) usa
núcleos que ficariam ociosos — 1.621 páginas em ~1h20 contra ~2h50 em série.

**Critério:** todas as obras convertidas, 0 falhas.

---

## Etapa 6 — Medição e aviso de limitação

```powershell
& $py "$env:USERPROFILE\.claude\skills\pdf-para-md\diagnosticar_pdf.py" --medir .\_processados_md
& $py "$env:USERPROFILE\.claude\skills\pdf-para-md\injetar_aviso.py" .\_processados_md --excluir COMPLETO
```

⚠️ **Não rodar com conversão viva na pasta** — o injetor escreve em todos os `.md`.

**Critério:** todo `.md` com o bloco `<!-- AVISO-OCR-INICIO -->` no cabeçalho.

---

## Etapa 7 — Dividir o que passa do teto

Teto medido do NotebookLM: **falha em 540 mil palavras, passa em 461 mil.**
Corte de trabalho: **450 mil**.

```powershell
& $py _scripts\dividir_md.py "_processados_md\OBRA.md"
```

O original vira `*_COMPLETO.md` e é excluído do upload por filtro.

**Critério:** nenhum `.md` não-COMPLETO acima de 450 mil palavras.

---

## Etapa 8 — Montar o notebook

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\subir_reocr.ps1 -Simular
# conferir a lista, depois rodar sem -Simular
```

Aplicar a persona (`_artifacts\persona_notebooklm.txt`) e
`--response-length longer`.

**Critério:** todas as fontes `ready`, zero `error`.

🔑 **Gravar o ID do notebook em `projeto.config.txt`** — só o ID, sem aspas e sem
quebra de linha extra. É de lá que `subir_reocr.ps1` e `checagem_retomada.ps1` o
leem.

```powershell
"COLE-O-ID-AQUI" | Out-File -FilePath projeto.config.txt -Encoding utf8 -NoNewline
```

⚠️ **Enquanto esse arquivo estiver vazio, os scripts falham** — de propósito.
Um ID em branco aborta; um ID herdado de outro projeto enviaria (ou **removeria**)
fontes no notebook errado, e remoção não tem desfazer.

Anotar o ID também no `MEMORIA_PROJETO.md` e no `CLAUDE.md` §6, para leitura humana.

---

## Etapa 9 — Pauta de refutação

Preencher `LACUNAS_REFUTACAO.md`: para cada objeção que o livro atrai, verificar
se o corpus tem **a objeção em fonte primária** e **a resposta conservadora**.

⚠️ **Conferir por consulta, não por memória.** No projeto João, a tabela feita de
recordação estava **invertida** numa linha inteira: dizia faltar a resposta,
quando faltava a objeção.

**Critério:** tabela preenchida, cada linha marcada `[conferido]` ou `[não
conferido]`.

---

## Etapa 10 — Primeiro capítulo

### 10.0 — 🚩 Reconferir a cobertura dos adversários (antes de gastar consulta)

**A Etapa 9 não cobre este capítulo.** Ela rodou uma vez, na Fase 0, sobre as
objeções que o **livro** atrai. Cada capítulo traz **nomes novos**, que entram
quando as lacunas dele são definidas — e esses nunca passaram por lá.

Para cada lacuna deste capítulo, antes da primeira consulta exegética:

| Pergunta | Como responder |
|---|---|
| Quem é o adversário nomeado nesta lacuna? | ler a definição da lacuna |
| A obra **dele** está no corpus? | procurar no inventário de fontes — **por título também**, não só por sobrenome |
| É a obra ou é texto **sobre** ele? | resenha, simpósio e ficha de catálogo **não servem** |

⚠️ **Buscar por sobrenome dá falso negativo.** Em Romanos, Thorsteinsson foi
dado como ausente porque o título da obra dele — *Paul's Interlocutor in
Romans 2* — não traz o nome. Buscar pelos dois.

⚠️ **Página web de catálogo não é a obra.** A mesma busca achou a ficha da Lund
University, não o livro.

**Critério de saída:** todo adversário nomeado nas lacunas tem obra própria no
corpus **ou** a lacuna está explicitamente remetida a outro capítulo. Sem uma
das duas, **não abrir a objeção** — refutar a partir de resumo secundário viola
o item (1) do padrão e produz erro checável.

> **Custo de pular:** no Cap. 2 de Romanos as 13 saídas foram geradas e
> verificadas antes de alguém notar que Stowers, Campbell e Thorsteinsson — que
> sustentam três das cinco lacunas — não tinham obra no corpus. A pesquisa
> inteira ficou pronta e travada na véspera da redação.

### 10.1 — As três consultas

Para **cada** capítulo, três consultas:

| # | Consulta |
|---|---|
| 1 | **Exegética** — o material |
| 2 | **Verificação** — *quem, no dossiê, sustenta o contrário?* (e **audita a consulta 1**) |
| 3 | **Refutação dirigida** — *quem responde a esta objeção?* — sempre que a 2 trouxer objeção sem réplica |

Redigir com a Write tool. **Nunca** `notebooklm ask > arquivo.md`.

Fechar com a tabela de nível de certeza e a **auditoria factual**.

**Critério:** capítulo com rótulos em toda afirmação, toda objeção fechada com
resposta, sentinelas conferidas, e a auditoria registrando o que a verificação
pegou.

---

## Depois

Máximo **4 prompts exegéticos por sessão**. Ao fim de cada uma: atualizar
`MEMORIA_PROJETO.md` e `_LOG_EXECUCAO.md`, e rodar o backup.

Toda retomada começa com:

```powershell
powershell -ExecutionPolicy Bypass -File _scripts\checagem_retomada.ps1
```
