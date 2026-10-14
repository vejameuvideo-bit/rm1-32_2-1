# Estratégia de criação de cadernos e artefatos — IND

*Redigida em 15/10/2026 a partir do que foi **medido** na produção dos cadernos de Rm 2.1-11 (C1–C4). Vale para qualquer novo lote de cadernos do projeto: anéis, prompts, série. Onde algo ainda não foi testado, isso está dito.*

> **Princípio:** o caderno é um **ambiente controlado**, não um depósito de fontes. Cada um tem tema estreito, fontes contadas e uma trava que diz ao NotebookLM o que ele **não** pode fazer. A mídia sai boa quando o caderno está certo. Nenhum prompt conserta um caderno mal montado.

---

## 1. Unidade de trabalho: um caderno por tópico

| Regra | Por quê |
|---|---|
| **Um tópico por caderno** (C1 = 2.1-2; C2 = 2.4-5; C3 = 2.6-10; C4 = 2.11 + síntese) | tópico largo faz o áudio diluir; tópico estreito obriga a descer ao grego |
| **Título fixo e único**, no padrão `IND <lote> C<n> - <tema>` | o orquestrador acha o caderno **pelo título**; dois cadernos com o mesmo título bloqueiam o caderno, de propósito |
| **ID registrado** em `MEMORIA_INDESCULPAVEIS.md` assim que criado | o ID é a única referência estável; títulos podem ser editados na interface |
| **Conta e perfil explícitos**: `aleinstitutoreformado@gmail.com`, perfil `ind-pro`, `-p ind-pro` em todo comando | o perfil global da CLI é compartilhado com outros projetos; caderno na conta errada é trabalho perdido |

---

## 2. Fontes: três camadas por caderno

| # | Arquivo | Papel | Regra |
|---|---|---|---|
| 0 | `fontes/comum/00_contexto_comum.md` | texto grego (SBLGNT) + fatos lexicais **verificados em disco** | igual em todos os cadernos do lote; declara a edição usada (SBLGNT, **não** NA28) |
| 1 | `fontes/cN/01_texto.md` | o **texto-base** do tópico, reproduzido sem alteração | frontmatter com `autor:` honesto; se a autoria for desconhecida ou de IA, **dizer** e marcar «texto a examinar, não fonte» (Regra 12) |
| 2 | `fontes/cN/02_auditoria.md` | **controle**: cada afirmação do texto-base confrontada, com rótulo de certeza | **vale sobre o 01** onde divergirem; o que não foi conferido fica `[NÃO VERIFICADO]` |

**Por que a auditoria entra como fonte:** o NotebookLM não distingue fonte boa de fonte ruim. A auditoria dentro do caderno faz o erro do texto-base virar **matéria de ensino** («o texto-base disse X; a conferência mostra Y») em vez de ser repetido ao ar. Foi assim que os erros reais do texto de Rm 2.1-11 entraram corrigidos na mídia: Rm 3.25 → 3.26; προσωπολημψία, que **não** vem da LXX; ἔργου ἀγαθοῦ no singular; Lv 19.15.

**Regras de fonte:**
- uma por vez, cada uma esperada até `ready` (`source wait`) antes da próxima;
- nunca reenviar uma fonte sem conferir `source list --status preparing`, porque o envio falho deixa uma linha órfã;
- grego e hebraico copiados de edição em disco (SBLGNT/MorphGNT, Rahlfs, WLC), **nunca** de OCR nem de memória;
- teto de fonte: 450–500 mil palavras (medido no molde).

---

## 3. A persona do caderno e a trava de cada prompt

- **Persona** (`_artifacts/persona_notebooklm.txt`, até 10.000 caracteres): aplicada **uma vez** por caderno com `configure --persona`. Fixa o registro (conservador, acadêmico), os rótulos de certeza, a Regra Zero e o fecho em 3.21-26.
- **Trava** (8 regras, no início de **todo** prompt de mídia):
  1. só as fontes do caderno;
  2. o texto-base é examinado, não citado como autoridade;
  3. grau de certeza **falado** («inferência forte», «não verificado»…);
  4. autor só com obra no caderno; o resto é «citado, não lido»;
  5. Regra Zero, nos cinco itens, ou «lacuna»;
  6. tom sóbrio, «nós», nenhuma hierarquia de pecadores;
  7. o grego vem da fonte 00, nunca de memória;
  8. **fecho obrigatório** em Rm 3.21-26.

---

## 4. Matriz de artefatos: 6 por caderno

| Item | Formato CLI | Função | Persona |
|---|---|---|---|
| A1–A3 | áudio `deep-dive`, `--length long` | três **ângulos** diferentes do mesmo tópico | varia: filológico · pastoral · recepção/sistemático · pregação · técnico · mentoria |
| A4 | áudio `debate` | a objeção principal do tópico, em forma de debate | defensor da leitura conservadora × advogado da objeção |
| V1–V2 | vídeo `explainer` ou `brief`, estilos `classic`, `whiteboard`, `watercolor`, `heritage` | exposição visual com o grego na tela e etiquetas «corrigido pela auditoria» | professor, narrador, mentora |

**Rotação de personas:** nenhum caderno repete o trio de vozes do anterior, e cada par de vozes tem uma **tarefa** («o aluno pede definição de cada termo técnico»; «o pastor admite que também é alcançado»), não só um nome. Personas sem tarefa produzem a mesma conversa com outras vozes.

**O debate tem regras acima da trava** (Regra Zero aplicada ao formato):
- não é empate: a objeção aparece na **melhor versão**, mas é a que se refuta;
- **proibido** terminar em «há debate» ou «cada um decide»: o desfecho esperado já vem escrito no prompt, com o rótulo;
- o advogado da objeção diz **o que a objeção acerta**: concessão honesta, item 2 da Regra Zero;
- sem obra primária no caderno, a objeção é **nomeada e não desenvolvida**.

**Formatos proibidos nesta conta:** `cinematic` exige Google AI Ultra, e a conta é AI Pro (fonte: o `--help` da CLI 0.8.4). Foi trocado por `explainer` com estilo visual diferente.

---

## 5. Cota: o limite que manda é a janela de 5 horas

**Medido em 14/10:** o painel «AI Usage & Limits» da conta mostra uma **janela de 5 horas** e um **limite semanal**. Um caderno completo (6 mídias) somado ao início do seguinte levou a janela a **97%**. A premissa anterior («20 áudios/20 vídeos por dia») não descreve o limite real.

| Regra | Consequência |
|---|---|
| **1 caderno por janela de 5 h** | 4 cadernos ≈ 3–4 janelas ≈ 15–20 h de relógio |
| acima do limite o Google **enfileira** («generates later»): o item aparece `pending` | **nunca reenviar** um `pending`; ele sai sozinho depois do reinício |
| a conta é compartilhada com outros perfis (`epistolas-joao-pro`, `cristologia-pro`…) | o que outro projeto gera na mesma janela come a cota do IND |
| `notebooklm -p ind-pro usage --json` mostra `used_percent` e `resets_at` | é o dado que o orquestrador consulta antes de cada geração |

---

## 6. Execução: o orquestrador

**Ferramenta:** `_scripts/orquestrar_cadernos_rm2.ps1`. Para um novo lote, o roteiro é o mesmo; mudam o manifest, as fontes e os títulos.

```
preflight ─► para cada caderno:  achar/criar ─► persona ─► 3 fontes ready ─► reconciliar ─► gerar o que falta (com cota)
          ─► esperar todos completed (retry 1× se failed) ─► baixar .m4a/.mp4 ─► verificar ─► relatório
```

| Garantia | Mecanismo |
|---|---|
| **conta certa** | `auth check --test --json` precisa conter o e-mail esperado; se não contiver, aborta sem escrever nada |
| **idempotência** | estado em `cadernos_rm2/estado_execucao.json`; antes de criar ou gerar, confere `list`, `source list` e `artifact list`. Rodar duas vezes não duplica nada (testado: 2ª execução = 0 escritas) |
| **artefatos feitos à mão** | vinculados aos itens do manifest **por tipo, na ordem de criação** (foi assim com C1 e C2) |
| **Regra 11-D** | uma geração sem resposta clara **não é repetida**: o orquestrador espera e procura o artefato novo na lista. Só `RATE_LIMITED`, que é recusa explícita, é reenviado, uma vez, depois da espera |
| **falha** | `failed` recebe **uma** `artifact retry`, no lugar, sem criar outro |
| **cota** | acima de 90% da janela, espera o `resets_at` (+3 min) até o prazo (`-MaxHoras`, padrão 14) |
| **noite inteira** | impede o Windows de dormir (não impede tampa fechada nem desligamento) |
| **saída** | `0` completo · `2` incompleto (rodar de novo) · `1` falha |

**Antes de rodar de verdade:** a simulação (sem `-Executar`) só lê e mostra o plano. A regra do projeto é «sempre simular antes».

---

## 7. Verificação: como se sabe que terminou e que está certo

**Automática** (no relatório `cadernos_rm2/relatorios/relatorio_*.md`), por caderno:
- `[OK]` caderno identificado e único;
- `[OK]` 3/3 fontes `ready`, sem fonte duplicada;
- `[OK]` 6/6 itens `completed` **e** baixados (arquivo existe e tem tamanho > 0);
- `[OK]` nenhum artefato vinculado a dois itens;
- `[ATENÇÃO]` artefatos de áudio ou vídeo a mais no caderno (possível duplicata), listados por ID.

**Humana** (amostra mínima; o relatório não ouve áudio):

| Conferir | Onde | Critério de reprovação |
|---|---|---|
| idioma e fecho | início e fim de 1 áudio por caderno | não está em português; não termina em 3.21-26 |
| correção ao ar | o deep dive filológico | repete um erro que a `02_auditoria` corrige (ex.: «προσωπολημψία vem da LXX») |
| **o debate** | os últimos minutos do A4 | termina em «há debate»; equipara a objeção à tese; atribui a autor uma obra que não está no caderno |
| caderno C3 (obras × fé) | A4 e V2 | não diz com clareza que ninguém é justificado por obras (3.20) |
| tom | qualquer trecho sobre «eles» | fala dos pecadores sem dizer «nós» (regra de 2.1) |

**Item reprovado não é apagado em silêncio:** registra-se no `_LOG_EXECUCAO.md` o que falhou, e se decide entre refazer (com o prompt ajustado) ou manter com nota.

**Estatuto da mídia:** enquanto a trava de sentinelas estiver ativa (para o anel 1 ainda faltam S8 e S11), estes áudios e vídeos são **material de estudo, não publicável**.

---

## 8. Armadilhas medidas (não repetir)

| # | Armadilha | Prevenção |
|---|---|---|
| 1 | `notebooklm login` num navegador sem sessão cai na página pública do NotebookLM, diz «Already logged in» e grava cookies **sem** `SID` | entrar na conta **antes**, com `chrome.exe --user-data-dir="%USERPROFILE%\.notebooklm\profiles\<perfil>\browser_profile"`; depois `login --browser chrome` **sem** `--fresh`; só `auth check --test` decide |
| 2 | `-n` posto como opção global (`notebooklm -p P -n ID …`) falha | `-p` antes do subcomando, `-n` **depois** (`source add -n ID …`) |
| 3 | prompt longo passado como argumento no PowerShell 5.1 | `--prompt-file`; persona com aspas escapadas à mão (`\"`) |
| 4 | `"$var:"` dentro de string no PowerShell = erro de parse | `${var}:` |
| 5 | função chamada `Cli`: o PowerShell executa o alias embutido `cli` (Clear-Item) | não nomear funções com nomes de alias embutidos |
| 6 | `-like "[FALHA]*"`: colchetes são curinga | `.StartsWith("[FALHA]")` |
| 7 | rodar `-Fase fontes` de novo depois de um caderno criado | cria um segundo caderno; usar `-Ids` ou o orquestrador, que procura pelo título |
| 8 | Windows: `...\Projetos\Indesculpaveis` é a mesma pasta que `...\Projetos\INDESCULPAVEIS` | o projeto está em `...\INDESCULPAVEIS\Indesculpaveis` |
| 9 | `CREATE_ARTIFACT timeout` | **não** repetir; conferir com `artifact list` (Regra 11-D) |
| 10 | `cinematic` numa conta Pro | não usar (exige Ultra) |

---

## 9. Para um novo lote (anéis, prompts, série)

1. **Escopo:** dividir o texto em tópicos estreitos, um caderno cada.
2. **Fontes:** `00_contexto_comum.md` com o grego **de disco**; `01_texto.md` sem alteração e com proveniência honesta; `02_auditoria.md` com rótulos, feita **antes** de subir.
3. **Prompts:** gerar a matriz 3 deep dive + 1 debate + 2 vídeos com a trava, personas rotacionadas, desfecho do debate escrito e formatos válidos para a conta.
4. **Manifest:** `manifest.csv` em ASCII; os títulos dos cadernos no orquestrador.
5. **Simular** (`orquestrar_…ps1` sem `-Executar`) e conferir o plano.
6. **Executar** e deixar rodar: 1 caderno por janela de 5 h.
7. **Verificar:** relatório automático + amostra humana (§7); registrar no log e na memória.

*Relacionados:* `cadernos_rm2/README.md` (o kit de Rm 2.1-11) · `ESTRATEGIA_ANEIS_INDESCULPAVEIS.md` (os 4 anéis, que seguem esta mesma estratégia na fase de mídia) · `aneis/PROMPTS_COMUM.md` (trava e cabeçalho de Deep Research) · `_LOG_EXECUCAO.md` §§9–16 (o histórico medido).
