# Instalação de heb.traineddata — Guia Completo

## Status Atual
- ✅ Tesseract instalado em: `C:\Program Files\Tesseract-OCR`
- ✅ Pasta tessdata encontrada: `C:\Program Files\Tesseract-OCR\tessdata`
- ✅ Idiomas presentes: eng, grc, osd, por
- ❌ **heb.traineddata ausente**

## Problema
A pasta `C:\Program Files` requer privilégios de administrador para escrita. A instalação falhou por falta de permissões.

## SOLUÇÃO 1: PowerShell como Administrador (Recomendado)

**Passo 1:** Abra PowerShell **COMO ADMINISTRADOR**
- Pressione: `Windows + X`
- Escolha: "Windows PowerShell (Admin)"

**Passo 2:** Execute este comando:

```powershell
$url = "https://raw.githubusercontent.com/tesseract-ocr/tessdata/master/heb.traineddata"
$dest = "C:\Program Files\Tesseract-OCR\tessdata\heb.traineddata"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $url -OutFile $dest
Write-Host "✅ heb.traineddata instalado"
```

**Passo 3:** Verifique:
```powershell
tesseract --list-langs | grep heb
```

Deve mostrar: `heb`

---

## SOLUÇÃO 2: Download Manual

Se o PowerShell falhar, faça manualmente:

1. **Visite:** https://raw.githubusercontent.com/tesseract-ocr/tessdata/master/heb.traineddata
2. **Clique:** `Ctrl+S` (salvar página)
3. **Renomeie** para: `heb.traineddata` (remova `.txt` se adicionado)
4. **Mova** para: `C:\Program Files\Tesseract-OCR\tessdata\`
5. **Confirme:** Tesseract deve pedir confirmação de sobrescrita (não há)

---

## SOLUÇÃO 3: Variável de Ambiente TESSDATA_PREFIX

Se não conseguir escrever em Program Files:

1. **Crie pasta:** `C:\Users\admintrt9a\tessdata_custom`
2. **Baixe** `heb.traineddata` para lá
3. **Defina variável** (PowerShell como Admin):

```powershell
[Environment]::SetEnvironmentVariable("TESSDATA_PREFIX", "C:\Users\admintrt9a\tessdata_custom", "User")
```

4. **Reinicie PowerShell** e teste:
```powershell
tesseract --list-langs
```

---

## Verificação Após Instalação

```powershell
# Listar todos os idiomas
tesseract --list-langs

# Testar OCR em hebraico
tesseract "arquivo.pdf" "output.txt" -l heb
```

---

## Tempo de Download

- Tamanho do arquivo: ~16 MB
- Velocidade típica: 1-5 MB/s
- **Tempo estimado:** 3-15 segundos

---

**Última tentativa:** 04/08/2026 14:30  
**Bloqueador:** Permissões de administrador em `C:\Program Files`  
**Próxima ação:** Executar PowerShell como Admin e rodar comando acima
