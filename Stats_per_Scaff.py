from Bio import SeqIO
from Bio.SeqUtils import GC
import sys
input = sys.argv[1]
fasta_sequences = SeqIO.parse(open(input),"fasta")
#print ("scaffold_name len GC% N%")
print ("Name_Scaffold\tleng\t%GC\t%N")
for fasta in fasta_sequences:
    name = fasta.id
    leng = len(fasta.seq)
    G = fasta.seq.count("G")
    C = fasta.seq.count("C")
    A = fasta.seq.count("A")
    T = fasta.seq.count("T")
    G += fasta.seq.count("g")
    C += fasta.seq.count("c")
    A += fasta.seq.count("a")
    T += fasta.seq.count("t")
    N = fasta.seq.count("N")
    N += fasta.seq.count("n")
    GC=(str((G+C)/(leng-N+1))) +"\t"+ str((N)/leng)
    print ("%s\t%i\t%s"%(name, leng, GC))
