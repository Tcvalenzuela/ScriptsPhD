import argparse
parser = argparse.ArgumentParser(description= "Transform pos report into histogram report")
parser.add_argument("--t", "-table",  help=" Table 3 columns 'scaffold\twhere\tkind_of_str'")
parser.add_argument("--b", "-bind", type=int, help="Number of section to represent in the histogram")
#parser.add_argument("-G", "--GenomeSize", type=int, help="Genome size")
#parser.add_argument("-N", "--NumberSca", type=int, help="Number of scaffolds")


args = parser.parse_args()
tableReader=open(args.t)
#number=args.NumberSca



freqHash={}
binSize=args.b



for line in tableReader:
	splitted=line.strip("\n").split("\t")
#	print (splitted)
	scafID=splitted[0]
	f_start=int(splitted[1])
#	print(splitted[2])
	f_end=int(splitted[2])
#	f_type=splitted[3]

	if not scafID in freqHash:
		freqHash[scafID]={}
		binSize=args.b



	if f_end >= binSize:
		if f_start < binSize:
			if binSize in freqHash[scafID]:
				freqHash[scafID][binSize]+=1
			else:
				freqHash[scafID][binSize]=1			
		while f_end >= binSize:
			if not binSize in freqHash[scafID]:
				freqHash[scafID][binSize]=0
			binSize+=args.b



	if binSize in freqHash[scafID]:
		freqHash[scafID][binSize]+=1
	else:
		freqHash[scafID][binSize]=1


for scaf in freqHash:
	for ran in freqHash[scaf]:
		print("%s\t%i\t%i\t%i"%(scaf, ran-10000, ran, freqHash[scaf][ran]))
	print()
