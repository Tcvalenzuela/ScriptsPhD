from __future__ import division
from Bio import SeqIO
import sys
input = sys.argv[1]
inputopen = open(input)
for sequence in SeqIO.parse(inputopen, 'fasta'):
        id = (sequence.id+".fa")
        with open(id, 'w') as output:
                output.write(sequence.format('fasta'))
