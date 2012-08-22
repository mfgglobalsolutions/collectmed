#!/bin/bash
mysql pa_master<<EOFMYSQL
UPDATE client SET ClientName = 'MFG Global Medical Inc.' WHERE ClientID = 1084;
EOFMYSQL