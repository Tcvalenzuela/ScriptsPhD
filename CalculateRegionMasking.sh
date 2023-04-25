MASKEDDIR="/srv/public/users/tomas/Regions_Analyse/rCheMyd1/ClassRegion"
echo "Chelonia mydas $MASKEDDIR"
        echo "Region	Masked	TEsN Nestedbp"
for i in $MASKEDDIR/*.fa; do
        name=$(basename $i|sed 's\.fa\\g')
	MaskedN=$(cat $MASKEDDIR/${name}.fa  | grep -v ">" | tr -cd 'N' | wc -c)
	Nest=$(cat $MASKEDDIR/NestTotalSize_${name}.out)
	MASKED=$(($MaskedN - $Nest))
	echo "${name}	${MASKED}	${MaskedN}	${Nest} "
        done

MASKEDDIR="/srv/public/users/tomas/Regions_Analyse/rDerCor1/ClassRegion"
echo "Dermochelys coriacea $MASKEDDIR"
        echo "Region	Masked	TEsN	Nestedbp"

for i in $MASKEDDIR/*.fa; do
        name=$(basename $i|sed 's\.fa\\g')
        MaskedN=$(cat $MASKEDDIR/${name}.fa  | grep -v ">" | tr -cd 'N' | wc -c)
        Nest=$(cat $MASKEDDIR/NestTotalSize_${name}.out)
        MASKED=$(($MaskedN - $Nest))
        echo "${name}	${MASKED}	${MaskedN}	${Nest} "
        done
