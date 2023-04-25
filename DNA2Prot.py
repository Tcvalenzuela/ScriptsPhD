from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import argparse
parser = argparse.ArgumentParser(description= "Translate from nucleotide to aminoacid multaifasta files")
parser.add_argument("--F", "-fasta",  help="Fasta file to translate ")
parser.add_argument("-out", "--o", help="output file",type=str)
arg = parser.parse_args()
oWriter=open(arg.o, "w")
record_makers = []
protein_id={}
fasta_sequences=open(arg.F)
for record in fasta_sequences:
    if record.startswith(">"):
        Ph=record.split(" ")
        Name=Ph[0].lstrip(">")
        protein_id[Name] = record
for record in SeqIO.parse(open(arg.F), "fasta"):
    id = record.id
    protein1 = record.seq.translate(to_stop=True)
    protein2 = record.seq[1:].translate(to_stop=True)
    protein3 = record.seq[2:].translate(to_stop=True)
    if len(protein1) > len(protein2) and len(protein1) > len(protein3):
        protein = protein1
    elif len(protein2) > len(protein1) and len(protein2) > len(protein3):
        protein = protein2
    else:
        protein = protein3
    prot=str(protein)
    oWriter.write(protein_id[id]+prot+"\n")
