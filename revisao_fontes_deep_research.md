# Protocolo de Revisão de Fontes — Deep Research (Romanos 1)

**Quando usar:** após cada rodada de `notebooklm source add-research`, antes de aceitar as fontes importadas como parte do corpus de pesquisa.
**Como usar:** rode os prompts abaixo em sequência via `notebooklm ask` (ou `--prompt-file` para os longos). Com base nas respostas, decida o que deletar com `notebooklm source delete <id> -y`.

---

## Prompt R1 — Inventário e Classificação das Fontes Deep Research

```
Identifique todas as fontes deste notebook que foram importadas via Deep Research
(fontes web, não os comentários em PDF que formam o corpus principal).

Para cada uma, crie uma tabela Markdown com as colunas:

| Fonte | Autor e credenciais citadas no texto | Data de publicação | Tipo | Tradição teológica |

Onde:
- "Credenciais": formação, cátedra, instituição — SOMENTE o que o próprio texto declara;
  se o texto não informa, escreva "não declarada no texto" (não invente).
- "Tipo": classifique explicitamente como:
  (a) FONTE PRIMÁRIA — texto antigo, edição crítica, manuscrito, documento de época;
  (b) ANÁLISE SECUNDÁRIA — artigo acadêmico peer-reviewed, monografia, capítulo com aparato crítico;
  (c) TEXTO DE OPINIÃO — blog, artigo popular, sermão, material sem aparato acadêmico.
- "Tradição": conservadora/reformada, católica, mainline/crítica, revisionista, não identificável.

Ao final, liste as fontes tipo (c) como CANDIDATAS À REMOÇÃO, salvo se trouxerem
dado único não coberto pelo corpus principal.
```

---

## Prompt R2 — Comparação de Conclusões e Detecção de Conflitos

```
Considerando apenas as fontes Deep Research identificadas no levantamento anterior,
crie uma tabela Markdown comparando as CONCLUSÕES de cada autor sobre os temas
centrais de Romanos 1 que a fonte aborda:

| Fonte | Tema de Rm 1 abordado | Conclusão central | Metodologia declarada |

Em seguida:

1. DISCREPÂNCIAS: se houver divergências conceituais entre estas fontes
   (ex.: leituras opostas de δικαιοσύνη θεοῦ, de φύσις em 1.26-27, da hipótese
   pré-paulina de 1.3-4) ou divergências de dados (datas, manuscritos, estatísticas
   de ocorrência de termos), DESTAQUE cada conflito e cite a seção/parágrafo
   específico de cada fonte onde as visões divergem.

2. AVALIAÇÃO DE ROBUSTEZ: para cada conflito, avalie qual fonte apresenta a
   metodologia mais robusta, usando estes critérios em ordem:
   (a) trabalha com o texto grego/hebraico diretamente?
   (b) cita fontes primárias (manuscritos, patrística, literatura do Segundo Templo)?
   (c) interage com a literatura acadêmica contrária ou apenas ignora?
   (d) publicação com revisão por pares?

3. VEREDITO POR FONTE: para cada fonte Deep Research, responda:
   esta fonte CORROBORA a robustez, fundamentação e riqueza de dados do corpus
   principal (Cranfield, Moo, Schreiner, Keener etc.), ou o DILUI?
   Recomende: MANTER / MANTER COM RESSALVA / REMOVER.
```

---

## Prompt R3 — Centralidade e Autoridade no Corpus

```
Quais das fontes deste notebook são mais citadas ou referenciadas POR OUTRAS FONTES
dentro deste mesmo notebook?

1. Liste as 10 obras/autores mais mencionados pelas demais fontes (ex.: se Moo,
   Schreiner e Keener citam Cranfield, Cranfield tem alta centralidade).
2. Para cada fonte Deep Research: ela é citada por alguma das fontes principais?
   Ela cita as fontes principais? Ou está isolada (ninguém a cita e ela não
   dialoga com o corpus)?
3. Fontes Deep Research ISOLADAS são candidatas à remoção — sinalize-as.

Restrição anti-alucinação: baseie-se apenas em citações e referências efetivamente
presentes nos textos deste notebook. Não use conhecimento externo sobre a reputação
dos autores.
```

---

## Prompt R4 — Cobertura de Lacunas (teste final)

```
As fontes Deep Research foram importadas para cobrir quatro lacunas específicas
do corpus principal:

1. O debate acadêmico recente sobre δικαιοσύνη θεοῦ em Rm 1.17 (pós-Käsemann/Wright)
2. O debate exegético de Rm 1.26-27 (Gagnon vs. Brooten vs. Brownson)
3. A intertextualidade Rm 1.18-32 com Sabedoria de Salomão 13-15
4. A hipótese da fórmula pré-paulina em Rm 1.3-4

Para cada lacuna, responda:
- Qual(is) fonte(s) Deep Research a cobre(m) efetivamente?
- A cobertura acrescenta DADOS (evidência primária, argumentos, bibliografia)
  ou apenas OPINIÃO?
- Alguma lacuna permaneceu descoberta? Se sim, sugira termos de busca para
  nova rodada de Deep Research.
```

---

## Fluxo de Decisão Após os 4 Prompts

```
R1: classificou →  tipo (c) sem dado único?           → DELETE
R2: conflitos  →  metodologia fraca + contradiz corpus → DELETE
R3: isolada    →  ninguém cita, não dialoga            → DELETE
R4: lacuna     →  não cobre nenhuma das 4 lacunas      → DELETE
Sobreviveu aos 4 filtros                               → MANTÉM
```

Comandos de remoção:

```powershell
notebooklm source list --no-truncate     # pegar os IDs
notebooklm source delete <id> -y         # um por fonte reprovada
```

Registrar na MEMORIA_CAP1.md (Seção 7) quais fontes Deep Research foram mantidas e por quê.
