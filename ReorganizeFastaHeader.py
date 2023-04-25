###Script desing at BeGenDiv by BITT
from Bio import SeqIO
import argparse
parser = argparse.ArgumentParser(description= "filter file headers in fasta format")
parser.add_argument("--F", "-fasta",  help="Fasta file to modify ")
parser.add_argument("-out", "--o", help="output file",type=str)
arg = parser.parse_args()
oWriter=open(arg.o, "w")
fasta_sequences=open(arg.F)
for line in fasta_sequences:
        if line.startswith(">"):
            Originalname=line
            PH=Originalname.split(" ")
            Name=PH[0]
            PH2=Originalname.split(":")
            PH3=str(PH2[1])
            if "Genbank" in PH3:
            	GeneID=PH3.rstrip(",Genbank")
            elif "gbkey=V_segment" in PH3:
                PH4=PH3.split(";")
                GeneID=PH4[0]
            PH1=Originalname.split(";")
            for ele in PH1:
                if "gene=" in ele:
                    PH4=ele
            geneName=PH4.lstrip("gene=")
            NewHeader=str(Name+"_"+GeneID+"_"+geneName)
            oWriter.write(NewHeader+"\n")
        else:
            #print (line.rstrip("\n"))
            oWriter.write(line.rstrip("\n"))
            oWriter.write("\n")
