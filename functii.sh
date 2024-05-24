function lansare_vim()
{
	if [[ "$1" == *.cpp || "$1" == *.c ]]
	then
		vim $1
	else
		echo -e "\n Fisierul nu are extensia corespunzatoare!\n"
		exit 1
	fi		
}

function testare_erori()
{
	if [[ -s "$1".err ]]
	then
		echo -e " Exista erori de compilare. Verificati fisierul ${1}.err \n"
		cat "$1".err
		exit 1
	else
		echo -e " Compilare efectuata cu succes! Executabilul creat: ${1} \n"
	fi
}

function lansare_executie()
{
	if [[ -f "$1" ]]
	then
		if [[ -x "$1" ]]
		then
			./$1
		else
			echo -e " Fisierul $1 nu este executabil!\n"
			exit 1
		fi
	else
		echo -e " Fisierul $1 nu exista!\n"
		exit 1
	fi
}

function lansare_compilator()
{
	# daca exista fisier de erori si fisier executabil, trebuie sterse inainte
	# extrag doar numele fisierului
	nume="${1%.*}"
	echo -e "\n Numele fisierului: $nume\n"	
	
	# stergerea fisierelor exe si .err
	rm -f "${nume}.exe"
	rm -f *.err

	# lansarea in executie a compilatorului:
	if [[ "$1" == *.c ]]
	then
		gcc -o "$nume" "$1" 2>"$nume".err
	fi

	if [[ "$1" == *.cpp ]]
	then
		g++ -o "$nume" "$1" 2>"$nume".err
	fi
}

function iesire_din_script()
{
	echo -e "\n Executie terminata.\n"
	exit 1
}
