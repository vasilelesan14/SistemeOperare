#!/bin/bash

# functie de afisare a meniului
function afisare_meniu()
{
	echo -e "\t ** MENIU **"
	echo " 1) Deschidere editor de text"
	echo " 2) Compilare"
	echo " 3) Afisare fisier erori"
	echo " 4) Executie program"
	echo " 5) Iesire din script"
}

function main()
{
	# verificarea si adaugarea fisierului cu functii
	if [ -f functii.sh ]
	then
		source functii.sh
		echo -e "\n Fisierul cu functii a fost adaugat cu succes.\n"
	else
		echo -e "\n Fisierul cu functii nu a fost gasit\n"
		exit 1
	fi

	# extragere nume
	nume=${1%.*}

	afisare_meniu
	
	option=1
	while [ $option -gt 0 -a $option -lt 6 ]
	do
		echo -e "\n Introduceti optiune: \\c"
		read option
		case $option in
			1) lansare_vim $1 ;;
			2) lansare_compilator $1 ;;
			3) testare_erori $nume ;;
			4) lansare_executie $nume ;;
			5) iesire_din_script ;;
			*) echo -e "\n Optiune introdusa invalida!!\n" ; exit 1 ;;
		esac
	done
}

main $@
