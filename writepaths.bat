@echo off
rem run this in a shell:  wmic service WHERE "NOT PathName LIKE '%system32%'" GET Pathname > folderlist.txt
rem since system32 will most likely not be writable to anyways
rem now run this bat file with > output.txt   for review


FOR /f "delims=" %%a IN ('type folderlist.txt') DO icacls %%a
pause
