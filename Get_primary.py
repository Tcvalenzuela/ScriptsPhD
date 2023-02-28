import argparse    
from Bio import SeqIO    
parser = argparse.ArgumentParser(description='')    
parser.add_argument('--fa','-fasta', help='fasta file to filter to primmary')    
parser.add_argument('--hap','-hap', help='fasta file to filter to hap')
parser.add_argument('--o','-out', help='output')
args = parser.parse_args()
oWriter=open(args.o, "w")
Ohap=open(args.hap,"w")
fasta_sequences = SeqIO.parse(open(args.fa),'fasta')
for fasta in fasta_sequences:
	if fasta.id.startswith("scaffold_"):
		SeqIO.write(fasta, oWriter, "fasta")
	else:
		SeqIO.write(fasta, Ohap, "fasta")

