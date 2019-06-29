#!/bin/bash - 
#===============================================================================
#
#          FILE: two.sh
# 
#         USAGE: ./two.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 06/29/2019 16:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
FILE=$1
paste <( head -n1 $FILE | xargs | sed 's/,/\n/g' | sed 's/./\u&/' | sed 's/_\(.\)/\u\1/g') <( head -n1 $FILE | xargs | sed 's/,/\n/g') > work.list

COUNT=$(cut -d',' -f1 $FILE | sed 1d | wc -l)
echo $COUNT


function isnumber() {
    
    count=$(egrep -c "^[0-9,\.]+$" <( cut -d',' -f1 $FILE | sed 1d) | tr -d ' \t')
    if  [[ $COUNT == $count ]];
    then
        echo true
    fi
}

isnumber 
