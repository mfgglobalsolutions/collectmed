#!/bin/bash
mysql pa_master<<EOFMYSQL
SELECT * FROM client;
EOFMYSQL