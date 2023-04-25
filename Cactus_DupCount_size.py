from Bio import AlignIO
import argparse
parser = argparse.ArgumentParser(description= "From the out of Cactus print in the terminal the duplicated aligned seqs")
parser.add_argument("-cactus", "--C", help="output Cactus TABULAR maf",type=str)
parser.add_argument("-Start", "--S", type=int, help="Start region to analyse (Non reference)")
parser.add_argument("-End", "--E",type=int,  help="End region to analyse")
arg = parser.parse_args()
filehandle = open(arg.C)

SuperCount=0
Total_Dups0=0
Total_Dups500=0
Total_Dups100=0
Total_Dups21=0
Size_Dups0=0
Size_Dups500=0
Size_Dups100=0
Size_Dups21=0
mylist=[]

#print ("Total_Dups0"+"\t"+"Total_Dups21"+"\t"+"Total_Dups100"+"\t"+"Total_Dups500")
for line in filehandle:
    if line.startswith("s"):
        mylist.append(line)
    else:
        if mylist!=[]:
            NumberDup=len(mylist)-1
            split=mylist[0].split("\t")
            #print (mysplit)
            #print(int(mysplit[2]))
            name=split[1]
            start=int(split[2])
            size=int(split[3])
            sequence=str(split[6].rstrip("\n"))
            end=int(start)+int(size)
            ID=str(str(name)+"_"+str(start)+ "_" +str(end))
            if start>= arg.S and end <= arg.E:
                if int(size) > 21:
                    #print (mylist)
                    #print (NumberDup)
                    Total_Dups21+= NumberDup
                    Size_Dups21+=size
                if int(size) > 100:
                    Total_Dups100+= NumberDup
                    Size_Dups100+=size
                if int(size) > 500:
                    Total_Dups500+= NumberDup
                    Size_Dups500+=size
                if int(size) > 0:
                    Total_Dups0+= NumberDup
                    Size_Dups0+=size

            mylist=[]
print (str(Size_Dups0)+"\t"+str(Size_Dups21)+"\t"+str(Size_Dups100)+"\t"+str(Size_Dups500))
if mylist!=[]:
    print ("WARNING: the MAF file could be corrupt, you are not counting the last block!!!")
