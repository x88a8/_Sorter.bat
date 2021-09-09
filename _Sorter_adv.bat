@echo off
setlocal EnableDelayedExpansion

rem ###########################################################
rem                      Settings
rem Enable Splitter. (If one PDF contains multiple WE-Numbers it saves them like this:
rem                                                                 "1341.15.pdf" "1234.15.pdf" "1323.15.pdf"
rem                                                                         instead of
rem         (0 = off / 1 = on)                                         "1341 1234 1323.15.pdf" )
if exist split-1 set enableSplitter=1
if not exist split-1 set enableSplitter=0
rem
rem ###########################################################
set path="%~1"

rem extract filename and extension from full path
FOR /F "delims=" %%i IN ("%path%") DO (
set filedrive="%%~di"
set filepath="%%~pi"
set filename="%%~ni"
set fileextension="%%~xi"
)

rem extract year threecode and ident number from filename 
rem f.ex.
rem         "15 SYM 01 1234 5231 1234"
rem          /   I    \  \    \   I
rem         /    I      \ \-----\ I  
rem        I     I       I        \
rem       year threecode ident   WE Numbers
rem
set year=%filename:~1,2%
set threecode="%filename:~4,3%"
set ident=%filename:~8,2%


rem check if Filename invalid
rem
rem     "09 PAP 09 1451" -> only one has 16 characters
rem 
rem     "09 PAP 02 1321 1322 1323" -> string gets split by pos. 8 and for every 5 chars it gets copied and filename reduced by 5 chars until none left.
rem
rem !!! "09 PAP 02 123" -> invalid filename 

rem "" are counted too so default length is 16
ECHO %filename%>x&FOR %%? IN (x) DO SET /A strlength=%%~z? - 2&del x

if %strlength% LEQ 15 (
    echo "Not a Valid Filename. Press a Key to exit"
    pause
    Exit
)
call "_data/db.bat"
rem #############################################################################################################################################
rem  __  __          _   _ _    _ ______      _____ _______ _    _ _____  ______ _____       _____ ______          _____   _____ _    _ 
rem |  \/  |   /\   | \ | | |  | |  ____/\   / ____|__   __| |  | |  __ \|  ____|  __ \     / ____|  ____|   /\   |  __ \ / ____| |  | |
rem | \  / |  /  \  |  \| | |  | | |__ /  \ | |       | |  | |  | | |__) | |__  | |__) |   | (___ | |__     /  \  | |__) | |    | |__| |
rem | |\/| | / /\ \ | . ` | |  | |  __/ /\ \| |       | |  | |  | |  _  /|  __| |  _  /     \___ \|  __|   / /\ \ |  _  /| |    |  __  |
rem | |  | |/ ____ \| |\  | |__| | | / ____ \ |____   | |  | |__| | | \ \| |____| | \ \     ____) | |____ / ____ \| | \ \| |____| |  | |
rem |_|  |_/_/    \_\_| \_|\____/|_|/_/    \_\_____|  |_|   \____/|_|  \_\______|_|  \_\   |_____/|______/_/    \_\_|  \_\\_____|_|  |_|                                                                                                                                   
rem #############################################################################################################################################

rem Search for Full Equivalent of the threecode

for /L %%i in (0, 1, %count_Manufacturers%) do (
   if !Manufacturer[%%i].threecode! EQU %threecode% (
       set threecode_full=!Manufacturer[%%i].full!
       set /a "index_ausgleich=%%i+1"
       echo Found it !index_ausgleich!/15
       goto :foundManufacturerFull
   )
   set /a "index_ausgleich=%%i+1"
   echo Checking Threecode !index_ausgleich!/15
)
rem #############################################################################################################################################

:foundManufacturerFull

rem #############################################################################################################################################
rem  _____ _____  ______ _   _ _______    _____ ______          _____   _____ _    _ 
rem |_   _|  __ \|  ____| \ | |__   __|  / ____|  ____|   /\   |  __ \ / ____| |  | |
rem   | | | |  | | |__  |  \| |  | |    | (___ | |__     /  \  | |__) | |    | |__| |
rem   | | | |  | |  __| | . ` |  | |     \___ \|  __|   / /\ \ |  _  /| |    |  __  |
rem  _| |_| |__| | |____| |\  |  | |     ____) | |____ / ____ \| | \ \| |____| |  | |
rem |_____|_____/|______|_| \_|  |_|    |_____/|______/_/    \_\_|  \_\\_____|_|  |_|
rem #############################################################################################################################################

rem search for number product
if %threecode% EQU "BAN" (
    for /L %%i in (0, 1, %counter_BAN%) do (
        if !identifier_BAN[%%i].ident! EQU %ident% (
            set ident_full=!identifier_BAN[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "BRE" (
    for /L %%i in (0, 1, %counter_BRE%) do (
        if !identifier_BRE[%%i].ident! EQU %ident% (
            set ident_full=!identifier_BRE[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "ECO" (
    for /L %%i in (0, 1, %counter_ECO%) do (
        if !identifier_ECO[%%i].ident! EQU %ident% (
            set ident_full=!identifier_ECO[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "LIN" (
    for /L %%i in (0, 1, %counter_LIN%) do (
        if !identifier_LIN[%%i].ident! EQU %ident% (
            set ident_full=!identifier_LIN[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "MDR" (
    for /L %%i in (0, 1, %counter_MDR%) do (
        if !identifier_MDR[%%i].ident! EQU %ident% (
            set ident_full=!identifier_MDR[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "NUT" (
    for /L %%i in (0, 1, %counter_NUT%) do (
        if !identifier_NUT[%%i].ident! EQU %ident% (
            set ident_full=!identifier_NUT[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "PAC" (
    for /L %%i in (0, 1, %counter_PAC%) do (
        if !identifier_PAC[%%i].ident! EQU %ident% (
            set ident_full=!identifier_PAC[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "PAP" (
    for /L %%i in (0, 1, %counter_PAP%) do (
        if !identifier_PAP[%%i].ident! EQU %ident% (
            set ident_full=!identifier_PAP[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "PHI" (
    for /L %%i in (0, 1, %counter_PHI%) do (
        if !identifier_PHI[%%i].ident! EQU %ident% (
            set ident_full=!identifier_PHI[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "RAV" (
    for /L %%i in (0, 1, %counter_RAV%) do (
        if !identifier_RAV[%%i].ident! EQU %ident% (
            set ident_full=!identifier_RAV[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "SCH" (
    for /L %%i in (0, 1, %counter_SCH%) do (
        if !identifier_SCH[%%i].ident! EQU %ident% (
            set ident_full=!identifier_SCH[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "SYM" (
    for /L %%i in (0, 1, %counter_SYM%) do (
        if !identifier_SYM[%%i].ident! EQU %ident% (
            set ident_full=!identifier_SYM[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "TEX" (
    for /L %%i in (0, 1, %counter_TEX%) do (
        if !identifier_TEX[%%i].ident! EQU %ident% (
            set ident_full=!identifier_TEX[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "VES" (
    for /L %%i in (0, 1, %counter_VES%) do (
        if !identifier_VES[%%i].ident! EQU %ident% (
            set ident_full=!identifier_VES[%%i].full!
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "WAR" (
    for /L %%i in (0, 1, %counter_WAR%) do (
        if !identifier_WAR[%%i].ident! EQU %ident% (
            set ident_full=!identifier_WAR[%%i].full!
            goto :foundProductFull
        ) 
    )
)
rem #############################################################################################################################################

:foundProductFull
SET quick_summary=Manufacturer: %threecode_full% Certificate for: %ident_full% Issued in: 20%year% 
echo %quick_summary%
echo ------------------------------------------------------------------------------
echo Folder:
set yourfoldername=%threecode_full:~1,-1% - %ident_full:~1,-1%\
echo %yourfoldername%

rem check if folder for cert exists
if not exist "%yourfoldername%" (
  echo.Folder %yourfoldername% doesnt exist 
  mkdir "%yourfoldername%"
  echo. Created Folder for you.
  goto :folder_created
) else (
  echo. Exists already. yay!
)
rem This is only there to fix a bug where it displays Created folder for you and then Exsists already again.
:folder_created

rem move certificate into folder
echo %filename:~11,-1%%fileextension:~1,-1% 
echo %yourfoldername%
move "%filename:~1,-1%%fileextension:~1,-1%" "%yourfoldername%%filename:~11,-1%%fileextension:~1,-1%"


if %enableSplitter% EQU 1 (
    goto :splitter
) 
if %enableSplitter% EQU 0 (
    goto :end
)

rem #############################################################################################################################################
rem       _____ _____  _      _____ _______ 
rem  _   / ____|  __ \| |    |_   _|__   __|
rem (_) | (___ | |__) | |      | |    | |   
rem      \___ \|  ___/| |      | |    | |   
rem  _   ____) | |    | |____ _| |_   | |   
rem (_) |_____/|_|    |______|_____|  |_|   
rem #############################################################################################################################################

:splitter

rem check if new filename is longer than 4. else start splitting
set temp=%filename:~11,-1%
ECHO %temp%>x&FOR %%? IN (x) DO SET /a strlength=%%~z? - 2&del
if %strlength% LEQ 4 (
    echo. No splits needed. Ending
    ren "%yourfoldername%%filename:~11,-1%%fileextension:~1,-1%" "%filename:~11,-1%-%year%%fileextension:~1,-1%"
    goto :end
)

rem check if filename is suited for splitting
set temp=%filename:~11,-1%
ECHO %temp%>x&FOR %%? IN (x) DO SET /a strlength=%%~z? - 2&del x
set /a "y=%strlength%-4"
set /a "modulo=%y% %% 5"
if %modulo% NEQ 0 (
    echo. Please make sure there are no extra spaces at the end of the file!
    pause
    goto :end
)
echo. Filename is suitable for Splitting!

rem Calculate how many splits are needed
echo Calculating splits needed...
set /a "splits=%y%/5"
if %splits% EQU 1 (
    echo One split is needed.
)
if %splits% GTR 1 (
    echo %splits% Splits are needed.
)

rem split into seperate WE Files.
echo Splitting...
cd "%yourfoldername%"

set original_filename=%filename:~11,-1%

set n=0
for %%a in (%original_filename%) do (
   echo !n! Split of %splits%...
   copy "%original_filename%%fileextension:~1,-1%" "%%a-%year%%fileextension:~1,-1%"
   set original_filename=%original_filename:~5,-5%
   set /A n+=1
   %SystemRoot%\System32\timeout.exe /t 1
)
del "%filename:~11,-1%%fileextension:~1,-1%"
rem #############################################################################################################################################
rem      ______ _   _ _____  
rem  _  |  ____| \ | |  __ \ 
rem (_) | |__  |  \| | |  | |
rem     |  __| | . ` | |  | |
rem  _  | |____| |\  | |__| |
rem (_) |______|_| \_|_____/ 
:end
rem #############################################################################################################################################

%SystemRoot%\System32\timeout.exe /t 3
exit
