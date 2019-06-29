FILE=$1

ONE=$(cat <(head -n1 $1 | xargs | sed 's/,/\n/g' | sed 's/./\u&/' | sed 's/_\(.\)/\u\1/g'))
TWO=$(cat <(head -n1 $1 | xargs | sed 's/,/\n/g' ))
OLD=$IFS
IFS=IFS=$' \t\n' 
echo $ONE
