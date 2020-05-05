#!/bin/bash
file="COVID-19-geographic-disbtribution-worldwide-2020-04-12.csv"
IFS=$'\n'
THcase=0
THdied=0
casperpop=0.00000000000
for row in $(cat $file)
do
	IFS=$','
	for col in $row
	do
		infe=( $row )
		die=( $row )
		if [ "$col" == "Thailand" ] ; then
			echo " $row"
			echo "New Infection: +${infe[4]} New Death: +${die[5]}"
			((THcase=THcase+infe[4]))
			((THdied=THdied+die[5]))

			echo "Accemulated Infection: $THcase"
			echo "Accemulated Death: $THdied"

			echo -n "Percent of Infection per Population: 0"
			echo $(echo $THcase*0.00000144033|bc);

		fi
	done
done
                        echo -n "Percent of Death per Infection: "
                        echo $(echo $THdied*0.039200313603|bc);
