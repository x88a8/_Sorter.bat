@echo off
setlocal EnableDelayedExpansion

rem ###########################################################
rem                      Settings
rem Enable Splitter. (If one PDF contains multiple WE-Numbers it saves them like this:
rem                                                                 "1341.15.pdf" "1234.15.pdf" "1323.15.pdf"
rem                                                                         instead of
rem         (0 = off / 1 = on)                                         "1341 1234 1323.15.pdf" )
set enableSplitter="1"
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
set threecode=%filename:~4,3%
set ident=%filename:~8,2%

rem "" are counted too so default length is 16
ECHO %filename%>x&FOR %%? IN (x) DO SET /A strlength=%%~z? - 2&del x

rem check if Filename contains one or more WE Numbers by checking length
rem
rem     "09 PAP 09 1451" -> only one has 16 characters
rem 
rem     "09 PAP 02 1321 1322 1323" -> string gets split by pos. 8 and for every 5 chars it gets copied and filename reduced by 5 chars until none left.
rem
rem !!! "09 PAP 02 123" -> invalid filename 
rem
rem     +++ need to add error for a filename where there is not a multiple of 5 present
rem
if %strlength% EQU 16 (
    rem echo "has 16 chars"
)
if %strlength% LEQ 15 (
    echo "Not a Valid Filename. Press a Key to exit"
    pause
    Exit
)
if %strlength% GTR 16 (
    rem echo "more than 16 chars"
)

rem set the threecodes
rem !!! DO NOT FORGET TO CHANGE VALUE IN LOOP BELOW
rem set threecodes="BRE","ECO","LIN","WAR","NUT","PAC","PHI","PAP","SYM"
set n=0
for %%a in ("BRE" "ECO" "LIN" "WAR" "NUT" "PAC" "PHI" "PAP" "SYM") do (
   set threecodes[!n!]=%%a
   set /A n+=1
)

rem set the full names in the equivalent index place
rem set threecodes_full="Brenner", "ECOLAB", "Linde", "Warsaw Orthopedics", "NuSil Technology", "Pacplast", "Philips Medisize", "Paperdrive", "SYMMETRY MEDICAL"
set n=0
for %%a in ("Brenner" "ECOLAB" "Linde" "Warsaw Orthopedics" "NuSil Technology" "Pacplast" "Philips Medisize" "Paperdrive" "SYMMETRY MEDICAL") do (
   set threecodes_full[!n!]=%%a
   set /A n+=1
)

rem Search for Full Equivalent of the threecode

for /L %%i in (0, 1, 8) do (
   if !threecodes[%%i]! EQU "%threecode%" (
       set threecode_full=!threecodes_full[%%i]!
       goto :goOn
   )
)

:goOn

rem set the idents

rem +++ BRENNER +++ 
set n=0
for %%a in (01) do (
   set idents_bre[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Cardboard boxes for shipment") do (
   set idents_bre_full[!n!]=%%a
   set /A n+=1
)

rem +++ ECOLAB +++
set n=0
for %%a in (01 02) do (
   set idents_eco[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("P3-cosa FLUX 33" "P3-cosa CIP 72") do (
   set idents_eco_full[!n!]=%%a
   set /A n+=1
)

rem +++ Linde +++
set n=0
for %%a in (01) do (
   set idents_lin[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Argon 4.8") do (
   set idents_lin_full[!n!]=%%a
   set /A n+=1
)

rem +++ Warsaw Technology +++
set n=0
for %%a in (01 02) do (
   set idents_war[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Polyethylene Bag" "Custom Growth Rod") do (
   set idents_war_full[!n!]=%%a
   set /A n+=1
)

rem +++ NuSil Tehcnology +++
set n=0
for %%a in (01) do (
   set idents_nut[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("MED-1511") do (
   set idents_nut_full[!n!]=%%a
   set /A n+=1
)

rem +++ Pacplast +++
set n=0
for %%a in (01) do (
   set idents_pac[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Shrink Film") do (
   set idents_pac_full[!n!]=%%a
   set /A n+=1
)

rem +++ Philips Medisize +++
set n=0
for %%a in (01) do (
   set idents_phi[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Molded PEEK Rods (Philips Plastics)") do (
   set idents_phi_full[!n!]=%%a
   set /A n+=1
)

rem +++ Paperdrive +++
set n=0
for %%a in (01 02) do (
   set idents_pap[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Labels for Packaging Implants (Global Packaging Solution - roll Stock)" "Labels for Packaging Implants") do (
   set idents_pap_full[!n!]=%%a
   set /A n+=1
)

rem +++ SYMMETRY +++
set n=0
for %%a in (01) do (
   set idents_sym[!n!]=%%a
   set /A n+=1
)
set n=0
for %%a in ("Instruments") do (
   set idents_sym_full[!n!]=%%a
   set /A n+=1
)


rem search for number product
if "%threecode%" EQU "BRE" (
    for /L %%i in (0, 1, 0) do (
        if !idents_bre[%%i]! EQU %ident% (
            rem echo !idents_bre_full[%%i]!
            set ident_full=!idents_bre_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "ECO" (
    for /L %%i in (0, 1, 1) do (
        if !idents_eco[%%i]! EQU %ident% (
            rem echo !idents_eco_full[%%i]!
            set ident_full=!idents_eco_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "LIN" (
    for /L %%i in (0, 1, 0) do (
        if !idents_lin[%%i]! EQU %ident% (
            rem echo !idents_lin_full[%%i]!
            set ident_full=!idents_lin_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "WAR" (
    for /L %%i in (0, 1, 1) do (
        if !idents_war[%%i]! EQU %ident% (
            rem echo !idents_war_full[%%i]!
            set ident_full=!idents_war_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "NUT" (
    for /L %%i in (0, 1, 0) do (
        if !idents_nut[%%i]! EQU %ident% (
            rem echo !idents_nut_full[%%i]!
            set ident_full=!idents_nut_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "PAC" (
    for /L %%i in (0, 1, 0) do (
        if !idents_pac[%%i]! EQU %ident% (
            rem echo !idents_pac_full[%%i]!
            set ident_full=!idents_pac_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "PHI" (
    for /L %%i in (0, 1, 0) do (
        if !idents_phi[%%i]! EQU %ident% (
            rem echo !idents_phi_full[%%i]!
            set ident_full=!idents_phi_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "PAP" (
    for /L %%i in (0, 1, 1) do (
        if !idents_pap[%%i]! EQU %ident% (
            rem echo !idents_pap_full[%%i]!
            set ident_full=!idents_pap_full[%%i]!
            goto :goOn2
        ) 
    )
)
if "%threecode%" EQU "SYM" (
    for /L %%i in (0, 1, 0) do (
        if !idents_sym[%%i]! EQU %ident% (
            rem echo !idents_sym_full[%%i]!
            set ident_full=!idents_sym_full[%%i]!
            goto :goOn2
        ) 
    )
)
:goOn2
SET c=Manufacturer: %threecode_full% Certificate for: %ident_full% Issued in: 20%year% 
echo %c%

set yourfoldername=%threecode_full:~1,-1% - %ident_full:~1,-1%\

rem check if folder for cert exists
if not exist "%yourfoldername%" (
  echo.Folder %yourfoldername% doesnt exist 
  mkdir "%yourfoldername%"
  echo. Created Folder for you.
) else (
  echo. Exists already. yay!
)

rem move certificate into folder
echo %filename:~11,-1%%fileextension:~1,-1% 
echo %yourfoldername%
move "%filename:~1,-1%%fileextension:~1,-1%" "%yourfoldername%%filename:~11,-1%%fileextension:~1,-1%"



if %enableSplitter% EQU "1" (
    goto :splits
) 
if %enableSplitter% EQU "0" (
    goto :end
)

:splits
rem check if filename is suited for splitting
ECHO %filename:~11,-1%>x&FOR %%? IN (x) DO SET /a strlength=%%~z? - 2&del x
set /a "y=%strlength%-4"
set /a "modulo=%y% %% 5"
if %modulo% NEQ 0 (
    echo Please make sure there are no extra spaces at the end of the file!
    pause
    goto :end
)
rem check if new filename is longer than 4. else start splitting

if %strlength% EQU 4 (
    echo No splits needed. Ending
    goto :end
)

if %strlength% GTR 4 (
    goto :calculator
)

rem Calculate how many splits are needed
:calculator
echo Calculating splits needed...
set /a "splits=%y%/5"
cls
if %splits% EQU 1 (
    echo One split is needed.
)
if %splits% GTR 1 (
    echo %splits% Splits are needed.
)

rem split into seperate WE Files.
cls && echo Splitting...
cd "%yourfoldername%"

set original_filename=%filename:~11,-1%

set n=0
for %%a in (%original_filename%) do (
   set filenames[!n!]=%%a
   echo %n% Split of %splits%...
   copy "%original_filename%%fileextension:~1,-1%" "%%a.%year%%fileextension:~1,-1%"
   set /A n+=1
)
del "%filename:~11,-1%%fileextension:~1,-1%"

:end
timeout 3
exit

