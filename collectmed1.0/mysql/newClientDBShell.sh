

if test $9 -eq 1 
then

# REM CREATE THE NEW DATABASE
$1 --host=$2 --port=$3 --user=$4 --password=$5 < $7

fi


if test $9 -eq 2 
then

# REM APPLY A SCHEMA TO THE NEW DATABASE TO BUILD ITS TABLES.
$1 --host=$2 --port=$3 --user=$4 --password=$5 $6 < $8

fi
