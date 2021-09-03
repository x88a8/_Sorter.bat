
@echo on
FOR %%A IN (*.pdf) DO start "Sorter %%A" cmd /c _Sorter.bat "%%A"
%SystemRoot%\System32\timeout.exe /t 1
exit