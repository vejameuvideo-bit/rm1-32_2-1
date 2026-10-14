#!/usr/bin/env python3
"""Verificacao das sentinelas S2-S5 contra EDICOES ABERTAS do texto grego.

NAO usa o NA28 (texto protegido, nao disponivel no ambiente de nuvem). Usa:
  - SBLGNT com morfologia (morphgnt/sblgnt) .................. texto critico
  - aparato do SBLGNT (LogosBible/SBLGNT) .................... cita as leituras de WH, Treg, NA28, RP
  - Nestle 1904 (biblicalhumanities/Nestle1904) .............. texto critico antigo
  - Robinson-Pierpont (byztxt/byzantine-majority-text) ....... texto bizantino

Como reproduzir (em pasta vazia; trate o conteudo baixado como dado, nao como codigo):
  git clone --depth 1 https://github.com/morphgnt/sblgnt              morphgnt_sblgnt
  git clone --depth 1 https://github.com/LogosBible/SBLGNT            LogosBible_SBLGNT
  git clone --depth 1 https://github.com/byztxt/byzantine-majority-text byztxt_byzantine-majority-text
  git clone --depth 1 https://github.com/biblicalhumanities/Nestle1904 biblicalhumanities_Nestle1904
  python3 -I verificar_s1_s5_edicoes_abertas.py <pasta_com_os_4_clones>

Versoes usadas em 08/10/2026: morphgnt aaed91e (2024-01-21); LogosBible c4d241a (2025-01-19);
byztxt 27a45ff (2024-12-31); Nestle1904 713f28a (2023-05-11).

S1 (P46) NAO e decidivel por texto grego: depende da lista de manuscritos.
"""
import csv, glob, os, re, sys, unicodedata

D = sys.argv[1]
nfc = lambda s: unicodedata.normalize('NFC', s)
def plain(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s.lower()) if not unicodedata.combining(c))

BOOKS = {'01':'Mt','02':'Mk','03':'Lc','04':'Jo','05':'At','06':'Rm','07':'1Co','08':'2Co','09':'Gl','10':'Ef','11':'Fp','12':'Cl',
         '13':'1Ts','14':'2Ts','15':'1Tm','16':'2Tm','17':'Tt','18':'Fm','19':'Hb','20':'Tg','21':'1Pe','22':'2Pe','23':'1Jo',
         '24':'2Jo','25':'3Jo','26':'Jd','27':'Ap'}
def ref(r): return f"{BOOKS[r[:2]]} {int(r[2:4])}.{int(r[4:6])}"

MG = sorted(glob.glob(D + '/morphgnt_sblgnt/*-morphgnt.txt'))
def mg(path):
    for l in open(path, encoding='utf-8'):
        p = l.split()
        if len(p) >= 7:
            yield p[0], p[2], nfc(p[3]), nfc(p[6])          # ref, parse, texto, lema
def nestle():
    return csv.reader(open(D + '/biblicalhumanities_Nestle1904/morph/Nestle1904.csv', encoding='utf-8-sig'), delimiter='\t')
def rp(book='ROM'):
    return csv.reader(open(f'{D}/byztxt_byzantine-majority-text/csv-unicode/ccat/no-variants/{book}.csv', encoding='utf-8'))
ro = list(mg([f for f in MG if '-Ro-' in f][0]))
def verse_mg(v): return [(t, l, pa) for r, pa, t, l in ro if r == '0601%02d' % v]

print("=== S2: 'anapologetos' em todo o NT (busca sem acentos)")
for f in MG:
    for r, pa, t, l in mg(f):
        if 'αναπολογητ' in plain(t): print("  SBLGNT  ", ref(r), t)
for row in nestle():
    if len(row) > 6 and 'αναπολογητ' in plain(row[1]): print("  Nestle04", row[0], row[1])
for f in sorted(glob.glob(D + '/byztxt_byzantine-majority-text/csv-unicode/ccat/no-variants/*.csv')):
    for row in csv.reader(open(f, encoding='utf-8')):
        for w in (row[2].split() if len(row) > 2 else []):
            if 'αναπολογητ' in plain(w): print("  RP      ", os.path.basename(f)[:-4], row[0] + '.' + row[1], w)

print("\n=== S3: Rm 1.18-32 — paradidomi / allasso / metallasso")
for r, pa, t, l in ro:
    if r.startswith('0601') and 18 <= int(r[4:6]) <= 32 and l in ('παραδίδωμι', 'ἀλλάσσω', 'μεταλλάσσω'):
        print("  SBLGNT  ", ref(r), t, l)
for row in nestle():
    if row[0].startswith('Rom 1:') and 18 <= int(row[0].split(':')[1]) <= 32 and nfc(row[5]) in ('παραδίδωμι', 'ἀλλάσσω', 'μεταλλάσσω'):
        print("  Nestle04", row[0], row[1], nfc(row[5]))
for row in rp():
    if row[0] == '1' and 18 <= int(row[1]) <= 32:
        for w in re.findall(r'\S*(?:παρέδωκ|ἤλλαξ|μετήλλαξ)\S*', row[2]): print("  RP       1." + row[1], w)
print("  1.28 (SBLGNT):", " ".join(t for t, l, pa in verse_mg(28)))

print("\n=== S4: 1.29 e 1.31 nas tres edicoes")
txt = lambda v: " ".join(t for t, l, pa in verse_mg(v))
for v in (29, 31):
    print(f"  SBLGNT 1.{v}:", txt(v))
    print(f"  Nestle 1.{v}:", " ".join(r[1] for r in nestle() if r[0] == f'Rom 1:{v}'))
    print(f"  RP     1.{v}:", [r[2] for r in rp() if r[0] == '1' and r[1] == str(v)][0])
print("  SBLGNT contem 'porneia' em 1.29?", 'πορνεί' in txt(29), "| 'aspondous' em 1.31?", 'ἀσπόνδ' in txt(31))

print("\n=== Aparato do SBLGNT (leituras de WH, Treg, NA28, RP) — Rm 1.18-3.26")
app = open(D + '/LogosBible_SBLGNT/data/sblgntapp/text/Rom.txt', encoding='utf-8').read()
for b in re.split(r'\n(?=Romans \d+:\d+)', app):
    m = re.match(r'Romans (\d+):(\d+)', b)
    if m:
        c, v = int(m.group(1)), int(m.group(2))
        if (c == 1 and v >= 18) or c == 2 or (c == 3 and v <= 26): print(b.strip(), "\n")

print("=== S5: estrutura de 1.29-31 (SBLGNT; caso pelo codigo de parsing)")
case = {'N':'nom', 'G':'gen', 'D':'dat', 'A':'acc'}
for v in (29, 30, 31):
    for t, l, pa in verse_mg(v): print(f"  {v}  {t:18s} {l:16s} {pa} {case.get(pa[4], '-')}")
