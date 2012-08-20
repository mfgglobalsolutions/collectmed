#!/bin/bash 


#REM APPLY A SCHEMA TO THE NEW DATABASE TO BUILD ITS TABLES.
$1 --host=$2 --port=$3 --user=$4 --password=$5 $6 < $7  

echo: "never heard of $1" 


