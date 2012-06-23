
REM @echo off

if %9%==1 (
REM CREATE THE NEW DATABASE
%1 --host=%2 --port=%3 --user=%4 --password=%5 < %7
)

if %9%==2 (
REM APPLY A SCHEMA TO THE NEW DATABASE TO BUILD ITS TABLES.
%1 --host=%2 --port=%3 --user=%4 --password=%5 %6 < %8
)



REM @echo on
REM TRUE (this only proves that batch file was called to create the client)



