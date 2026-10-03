# Estado atual — Romanos 1.25 e piloto Rm 1.28–32 (medido em 03/10/2026, 09:41–10:05 BRT)

*Tudo abaixo foi medido nesta data, exceto onde está marcado **[último conhecido]**. Medição: `estado_geral.py`, `verificar_midia.py`, `horarios_cota.py`, consulta direta ao CLI. Dados brutos: `cadernos_copiados/estado_geral_default.json`.*

## 1. Objetivo
Produzir, no registro confessional da Regra Zero (jamais equiparar leitura liberal à conservadora; refutar com os cinco itens), a pesquisa exegética de Romanos 1 em torno de **Rm 1.25** e **Rm 1.28–32**, usando o NotebookLM como corpus e geração de mídia:
1. **RM 1.25** — 5 cadernos pela proposta do usuário (01 grego, 02 comentários, 03 autonomia/apologética, 04 abandono judicial, 05 doxologia); cada um com **3 áudios + 2 vídeos** (mais flashcards, mapa e 2 infográficos).
2. **Estratégia de anéis** — por tópico, 4 cadernos (núcleo → global), cada um com **4 áudios + 3 vídeos longos sem marca d'água + flashcards + mapa + 2 infográficos**.
3. **Piloto Rm 1.28–32 na conta Pro** (alesouza@gmail.com), com o estudo aprofundado como semente do anel 1.

## 2. Planejamento (fases e situação)
| Fase | Situação |
|---|---|
| Cópia/recriação dos 5 cadernos públicos e obras (acervo) | **feita** (cópias importadas abandonadas; 5 novos na conta default) |
| Deep Research da proposta (25 consultas) | **19 de 25 feitas**; faltam 6 (01 #5; 02 #10; 03 #13–15; 05 #25) |
| Triagem R1–R4 e poda | **feitas** nos 5 (02: 84→38; 03: 53→38; 01: 81→46; 05: 80→47; 04: 88→23 + obras) |
| Mídia RM 1.25 (default) | **completa** nos 5 (ver §4) |
| Estudo aprofundado Rm 1.28–32 | **feito** (54 citações literais conferidas; 69 trechos marcados como tradução) |
| Estratégia de anéis | **documentada** (`ESTRATEGIA_ANEIS.md`) |
| Piloto Rm 1.28–32 (4 cadernos na Pro) | **parcial** — 38 de 44 artefatos **[último conhecido: 30/09 14:08]** (corrige o "35 de 44" dito antes) |
| Espelho RM 1.25 na Pro (outra janela) | **parcial [último conhecido: 30/09 16:35]** |

## 3. Entregas (arquivos)
- `Romanos-Cap1/estudo_Rm1.28-32/ESTUDO_Rm1.28-32.md` — estudo aprofundado.
- `Romanos-Cap1/ESTRATEGIA_ANEIS.md` — estratégia de anéis e limites da CLI.
- `Romanos-Cap1/cadernos_copiados/` — 20 scripts `.py`, 119 consultas de mídia em 9 pastas (`midia/<tag>/`), 36 resultados de triagem, 19 obras convertidas em `textos/obras/`, `PROPOSTAS*.md`, `OBRAS_IMPRESCINDIVEIS.md`, `retomar_pendentes.sh`.
- Git: **59 entradas não commitadas** (inclui este arquivo); último commit `f152f2f`. **Sem remoto.** Nenhum commit foi pedido.

## 4. Cadernos e artefatos
### Conta default (medido)
| Caderno | ID | Fontes ready | Artefatos | Situação |
|---|---|---|---|---|
| RM 1.25 · 01 | 3d86b952 | 49 | 9 | 3 áudios, 2 vídeos, F, M, 2 I — **completo** |
| RM 1.25 · 02 | 94495c19 | 38 | 9 | **completo** |
| RM 1.25 · 03 | 871e8e97 | 38 | 9 | **completo** |
| RM 1.25 · 04 | 4e49c905 | 30 | 9 | **completo** |
| RM 1.25 · 05 | b282bc31 | 47 | 9 | **completo** |

Verificação por identidade: 5 de 5 completos, 0 IDs duplicados, 0 registrados ausentes do servidor. Os vídeos da default **trazem a marca "Gemini Notebook"**.

Conta default no total: **135 cadernos**; 67 deles são cadernos de Romanos (os demais do projeto João, que não são deste trabalho), somando **4.426 fontes ready** e **521 artefatos** (258 áudios, 119 vídeos, 53 mapas, 33 relatórios, 31 flashcards, 11 infográficos, 10 slides). Um vídeo `failed` em Romanos: *Tribunal Ato3 B3* (anterior a esta janela).

### Conta Pro **[último conhecido: 30/09 — servidor inacessível agora, ver §6]**
| Caderno | ID | Artefatos registrados | Falta |
|---|---|---|---|
| P1 Núcleo | 9d941016 | 2 vídeos, F, M, 2 I | 4 áudios, 1 vídeo |
| P2 Contexto | f5d4c784 | 4 áudios, 3 vídeos, F, M (+1 mapa extra), 2 I | — |
| P3 Corpus | 24969dcd | 4 áudios, 3 vídeos, F, M, 2 I | — |
| P4 Global | 93b570d0 | 4 áudios, 2 vídeos, F, M, 2 I | 1 vídeo |
| Espelho RM 1.25 · 04 | 7181491f | 3 áudios, 3 vídeos | — |
| Espelhos 01, 02, 03, 05 (outra janela) | 218e4e59, e919b517, 93b049bc, 420a930f | 01/03/05: 1 áudio + 2 vídeos; 02: 2 áudios + 2 vídeos | 7 áudios |

Fontes após poda (piloto): P1 44 · P2 49 · P3 40 · P4 41. Deep Research do piloto: 14 de 20 consultas concluídas **(P1 101–103; P2 106–109; P3 111–114; P4 116–118)**; faltam P1 104–105, P2 110, P3 115, P4 119–120.

## 5. Conta Google: consumo e cota (medido na default)
- **Janela deslizante de 24 h** (corte 02/10 09:44): **20 áudios**, 0 vídeos, 1 mapa. Os 20 áudios são todos do projeto João (02/10 11:01–11:51, outra janela).
- **Desde as 21h BRT de ontem:** 1 mapa mental (nenhum áudio/vídeo).
- **Implicação:** o áudio da default está no teto de 20 numa janela deslizante; a primeira vaga abre **hoje, 03/10, às 11:01**. Vídeo, flashcards, mapa e infográfico da default estão livres. A cota é compartilhada com o projeto João.
- **Pro:** não medida (sem login). Último conhecido (30/09): áudio e vídeo da Pro no teto; vagas previstas a partir de ~18:50 de 30/09 — **sem confirmação**.
- **Deep Research:** `RATE_LIMITED` nas duas contas em 30/09 (24 tentativas de repetição, todas recusadas); não retestado hoje.

## 6. Ambiente: plugin e autenticação
- **notebooklm-py: 0.8.4** (CLI `0.8.4 (bff7c66e)`). Ontem estava 0.7.3; a versão **oscila** entre reinstalações.
- **Patch RPC perdido:** `MAX_RPC_RESPONSE_BYTES = 50 MiB` (módulo novo `notebooklm/_web/transport/streaming_post.py`); o antigo `_streaming_post.py` não existe. O limite do `ask` (`DEFAULT_CHAT_RESPONSE_MAX_BYTES`) agora é **256 MiB** em `notebooklm/_runtime/config.py`. `patch_rpc_limit.ps1` aponta o módulo antigo e **precisa ser atualizado** antes de novas triagens com cadernos grandes.
- **default:** autenticada (operação real `list`: 135 cadernos).
- **Pro: NÃO autenticada.** O login por cookies do Firefox falha: o `rookie_cookies.pyd` está instalado, mas o Windows nega o carregamento (**"DLL load failed … Acesso negado"**), provavelmente antivírus/política de segurança. Foi reinstalado duas vezes (com e sem cache) sem efeito. Não alterei configurações de segurança.
- Processos em segundo plano do projeto: **nenhum vivo**.

## 7. Pendências e próximas ações (em ordem)
1. **Destravar o login da Pro** (decisão do usuário): liberar o `rookie_cookies.pyd` no antivírus/política do Windows, **ou** voltar a CLI para 0.7.3 (onde o login funcionava) — isso reinstala a ferramenta compartilhada entre janelas.
2. Atualizar `patch_rpc_limit.ps1` para a 0.8.4 (ou reduzir o tamanho das consultas).
3. Pro, depois do login e das vagas: P1 (4 áudios + vídeo 3), P4 (vídeo 3), espelhos RM 1.25 (7 áudios) — `retomar_pendentes.sh`. **Conferir o áudio A3 do P1 contra a Regra Zero** (ainda não existe).
4. Deep Research: 6 consultas RM 1.25 (default) + 6 do piloto (Pro) quando o limite cair; depois triagem e poda das fontes novas.
5. Aquisições (ver `OBRAS_IMPRESCINDIVEIS.md`): Klostermann ZNW 1933, Jeremias ZNW 1954, Hooker 1966–67, gramáticas com grego legível (Wallace/Robertson sem grego), BDF, Zerwick, Moule, Porter, Dolezal, Heinemann.
6. Registro: nenhum commit feito; aguardar pedido.

## 8. Verificação executada
Conferência automática dos números deste arquivo contra os arquivos de estado, o git e `estado_geral_default.json`: **14 de 14 conferem** (após corrigir 2 erros meus: Deep Research do piloto 14/20, não 12; artefatos do piloto 38/44, não 35; e a contagem do git 58→59 por causa deste próprio arquivo).

| Item | Como foi verificado | Resultado |
|---|---|---|
| Versão do plugin | `notebooklm --version`, `uv tool list`, `importlib.metadata` | 0.8.4 nos três |
| Autenticação default | operação real (`list`) | 135 cadernos |
| Autenticação Pro | operação real (`list`) | **falhou** (CSRF/redirecionamento); login bloqueado pelo Windows |
| Consumo da default | `artifact list` em **135 de 135** cadernos (0 sem leitura) | 20 áudios/24 h, todos do projeto João |
| RM 1.25 default | `verificar_midia.py` por identidade | 5 de 5 completos, 0 duplicados, 0 ausentes |
| Pro | **não medida** — números marcados "[último conhecido]" vêm dos arquivos de estado locais de 29–30/09 | sem confirmação no servidor |
| Limite RPC | leitura em runtime e `grep` no pacote | 50 MiB (RPC) e 256 MiB (chat) |

