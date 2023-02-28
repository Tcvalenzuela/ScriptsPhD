File=<files.fasta>

awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}'  $File|  awk -F '\t' '{printf("%d\t%s\n",length($2),$0);}' | sort -k1r,1n  | cut -f 2- | tr "\t" "\n" > $File_SortedSize.fasta
