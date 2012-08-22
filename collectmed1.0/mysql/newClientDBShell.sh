#!/bin/bash
result=$(mysql --host=$2 --port=$3 --user=$4 --password=$5 $6 -sN -e “UPDATE client SET ClientName = 'MFG Global Medical Inc.' WHERE ClientID = 1084”)




					