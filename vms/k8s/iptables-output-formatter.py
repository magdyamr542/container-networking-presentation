#!/usr/bin/python3

import re
import sys
from tabulate import tabulate

comments_re = re.compile(r'/\*.*\/')

in_chain, eof = False, False
headers, table = [], []

while True:
    line = sys.stdin.readline()
    if len(line) == 0:
        eof = True
    line = line.strip()
    if line == '':
        if in_chain:
            headers.append('extra')
            print(tabulate(table, headers=headers))
            headers, table = [], []
            in_chain = False
        if eof:
            break
        continue
    if line.startswith('Chain'):
        print('\n{}'.format(line))
        continue
    if line.startswith('pkts') or line.startswith('target') or line.startswith('num'):
        headers = line.split()
        in_chain = True
        continue
    if in_chain:
        parts = line.split()
        begin = parts[:len(headers)]
        extra = ' '.join(parts[len(headers):])
        table.append(begin + [extra])
