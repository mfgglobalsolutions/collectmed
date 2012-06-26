#!/bin/bash 

if [ "$9" = "1" ] 
then 
    #REM CREATE THE NEW DATABASE
	$1 --host=$2 --port=$3 --user=$4 --password=$5 < $7
elif [ "$9" = "2" ] 
then 
	#REM APPLY A SCHEMA TO THE NEW DATABASE TO BUILD ITS TABLES.
	$1 --host=$2 --port=$3 --user=$4 --password=$5 $6 < $8  
else 
    echo "never heard of $9" 
fi 

