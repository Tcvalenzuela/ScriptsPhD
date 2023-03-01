from Bio import SeqIO
import argparse, gzip, os



def findHomoPolimer(sequence, locID):
	repCount=1
	lastBase=''

	homPolHASH={}
	for i in range(2, 11):
		homPolHASH[i]=0

	for i in range(0, len(sequence)):
		curBase=sequence[i]
		#print(lastBase, curBase, repCount)
		#compare bases
		if not lastBase == '':
			if lastBase==curBase:
				repCount+=1
				#print(lastBase, curBase, repCount)
			else:
				for j in range(2, 11):
					if repCount==j:
						homPolHASH[j]+=1
						#print("%s\t%i\t%i\t%i\t%s"%(locID, i-repCount, i-1, repCount, lastBase))
					elif j == 10 and repCount > 10:
						homPolHASH[10]+=1
						#print("%s\t%i\t%i\t%i\t%s"%(locID, i-repCount, i-1, repCount, lastBase))

				repCount=1

		lastBase=curBase
	for j in range(2, 11):
		if repCount==j:
			homPolHASH[j]+=1
			#print("%s\t%i\t%i\t%i\t%s"%(locID, i-repCount, i-1, repCount, lastBase))
		elif j == 10 and repCount > 10:
			homPolHASH[10]+=1
			#print("%s\t%i\t%i\t%i\t%s"%(locID, i-repCount, i-1, repCount, lastBase))

	return homPolHASH


def findMicroSat(sequence):

	microSatHash={}
	for i in range(2, 11):
		microSatHash[i]=0

	#check different kmer szes for the repeats
	for wsize in [2,3]:
		#print(wsize)
		repLen=1
		i=0
		while i+wsize < len(sequence):

			curKmer=sequence[i:i+wsize]
			lastBase=""
			identLen=0
			for j in range(0, len(curKmer)):
				curBase=curKmer[j]
				if not lastBase=="":
					if curBase==lastBase:
						identLen+=1
				lastBase=curBase
			if identLen==len(curKmer)-1:
				#print("homopol - ignore")
				i+=1
				continue


			nextStepKmer=sequence[i+wsize:i+2*wsize]
			#print(i, curKmer, nextStepKmer)
			if curKmer == nextStepKmer:
				repLen+=1
				#print("found %s repeat from %i-%i of len=%i"%(curKmer, i, i+2*wsize-1, repLen))		
				i=i+wsize
			else:
				for j in range(2, 11):
					if repLen==j:
						microSatHash[j]+=1
						#print("found %s repeat from %i-%i of len=%i"%(curKmer, i, i+2*wsize-1, repLen))	
					elif j == 10 and repLen > 10:
						microSatHash[10]+=1
						#print("found %s repeat from %i-%i of len=%i"%(curKmer, i, i+2*wsize-1, repLen))	

				repLen=1
				i+=1


		for j in range(2, 11):
			if repLen==j:
				microSatHash[j]+=1
				#print("%s\t%i\t%i\t%i\t%s"%(locID, i-repCount, i-1, repCount, lastBase))
			elif j == 10 and repLen > 10:
				microSatHash[10]+=1
				#print("%s\t%i\t%i\t%i\t%s"%(locID, i-repCount, i-1, repCount, lastBase))

	return microSatHash


parser = argparse.ArgumentParser(description='')
parser.add_argument('--d','-dir', help='directory containing all fasta files')
parser.add_argument('--o','-out', help='')
args = parser.parse_args()

oWriter=open(args.o, "w")


for file in os.listdir(args.d):
	if file.endswith(".fasta") or file.endswith(".fa") or file.endswith(".fasta.gz") or file.endswith(".fa.gz"):
		#print(file)
		if file.endswith(".gz"):
			faParser=gzip.open(args.d+"/"+file)
			faName=file.split(".")[0]
		else:
			faParser=open(args.d+"/"+file)
			faName=file.split(".")[0]


		longHomoPol=False
		for rec in SeqIO.parse(faParser, "fasta"):

			#print(faName)
			hp_hash=findHomoPolimer(rec.seq, faName)
			ms_hash=findMicroSat(str(rec.seq))
			#print("%s\t%i"%(faName, len(hp_list)))
			oWriter.write("%s\t"%(faName))

			for i in range(2,11):
				if i ==2:
					oWriter.write("%i"%hp_hash[i])
				elif (i == 9 or i == 10) and hp_hash[i]>0:
					oWriter.write("|%i"%hp_hash[i])
					longHomoPol=True
				else:
					oWriter.write("|%i"%hp_hash[i])

			oWriter.write("\t")

			for i in range(2,11):
				if i ==2:
					oWriter.write("%i"%ms_hash[i])
				elif (i == 9 or i == 10) and ms_hash[i]>0:
					oWriter.write("|%i"%ms_hash[i])
					longHomoPol=True
				else:
					oWriter.write("|%i"%ms_hash[i])

			oWriter.write("\t%s\n"%(longHomoPol))

faParser.close()
