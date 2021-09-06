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
rem echo [47m[30m"            _____            _                  _           _   "[0m[0m;
rem echo [47m[30m"           / ____|          | |                | |         | |  "[0m[0m;
rem echo [47m[30m"          | (___   ___  _ __| |_ ___ _ __      | |__   __ _| |_ "[0m[0m;
rem echo [47m[30m"           \___ \ / _ \| '__| __/ _ \ '__|     | '_ \ / _\` | __|"[0m[0m;
rem echo [47m[30m"           ____) | (_) | |  | ||  __/ |     _  | |_) | (_| | |_ "[0m[0m;
rem echo [47m[30m"          |_____/ \___/|_|   \__\___|_|    (_) |_.__/ \__,_|\__|"[0m[0m;
rem echo [47m[30m"  ______                                                        "[0m[0m;
rem echo [47m[30m" |______|                                                       "[0m[0m;
rem echo 

rem                         "Database"
rem #############################################################################################################################################
rem  _______ _    _ _____  ______ ______ _____ ____  _____  ______  _____ 
rem |__   __| |  | |  __ \|  ____|  ____/ ____/ __ \|  __ \|  ____|/ ____|
rem    | |  | |__| | |__) | |__  | |__ | |   | |  | | |  | | |__  | (___  
rem    | |  |  __  |  _  /|  __| |  __|| |   | |  | | |  | |  __|  \___ \ 
rem    | |  | |  | | | \ \| |____| |___| |___| |__| | |__| | |____ ____) |
rem    |_|  |_|  |_|_|  \_\______|______\_____\____/|_____/|______|_____/ 
rem #############################################################################################################################################                                                               

rem count of different manufacturers
set /A "count_Manufacturers=17"

rem correlating threecodes with their written out counterparts
rem ----------------------------------------------------
set Manufacturer[16].threecode="AMT"
set Manufacturer[16].full="AMTS"
rem ----------------------------------------------------
set Manufacturer[0].threecode="BAN"
set Manufacturer[0].full="Bantleon"
rem ----------------------------------------------------
set Manufacturer[1].threecode="BRE"
set Manufacturer[1].full="Brenner"
rem ----------------------------------------------------
set Manufacturer[2].threecode="ECO"
set Manufacturer[2].full="ECOLAB"
rem ----------------------------------------------------
set Manufacturer[15].threecode="GRA"
set Manufacturer[15].full="Gramss"
rem ----------------------------------------------------
set Manufacturer[3].threecode="LIN"
set Manufacturer[3].full="Linde"
rem ----------------------------------------------------
set Manufacturer[4].threecode="MDR"
set Manufacturer[4].full="Manfred Dreher"
rem ----------------------------------------------------
set Manufacturer[5].threecode="NUT"
set Manufacturer[5].full="NuSil Technology"
rem ----------------------------------------------------
set Manufacturer[6].threecode="PAC"
set Manufacturer[6].full="Pacplast"
rem ----------------------------------------------------
set Manufacturer[7].threecode="PAP"
set Manufacturer[7].full="Paperdrive"
rem ----------------------------------------------------
set Manufacturer[8].threecode="PHI"
set Manufacturer[8].full="Philips Medisize"
rem ----------------------------------------------------
set Manufacturer[9].threecode="RAV"
set Manufacturer[9].full="RAVE"
rem ----------------------------------------------------
set Manufacturer[10].threecode="SCH"
set Manufacturer[10].full="Schott"
rem ----------------------------------------------------
set Manufacturer[11].threecode="SYM"
set Manufacturer[11].full="SYMMETRY MEDICAL"
rem ----------------------------------------------------
set Manufacturer[12].threecode="TEX"
set Manufacturer[12].full="Dastex"
rem ----------------------------------------------------
set Manufacturer[13].threecode="VES"
set Manufacturer[13].full="Vesta"
rem ----------------------------------------------------
set Manufacturer[14].threecode="WAR"
set Manufacturer[14].full="Warsaw Orthopedics"
rem ----------------------------------------------------
rem 
rem ########### counter adjustment #####################
set /A "count_Manufacturers=%count_Manufacturers%-1"
rem #############################################################################################################################################


rem #############################################################################################################################################
rem  _____ _____  ______ _   _ _______ _____       __     _____  _____   ____  _____  _    _  _____ _______ _____ 
rem |_   _|  __ \|  ____| \ | |__   __/ ____|      \ \   |  __ \|  __ \ / __ \|  __ \| |  | |/ ____|__   __/ ____|
rem   | | | |  | | |__  |  \| |  | | | (___    _____\ \  | |__) | |__) | |  | | |  | | |  | | |       | | | (___  
rem   | | | |  | |  __| | . ` |  | |  \___ \  |______> > |  ___/|  _  /| |  | | |  | | |  | | |       | |  \___ \ 
rem  _| |_| |__| | |____| |\  |  | |  ____) |       / /  | |    | | \ \| |__| | |__| | |__| | |____   | |  ____) |
rem |_____|_____/|______|_| \_|  |_| |_____/       /_/   |_|    |_|  \_\\____/|_____/ \____/ \_____|  |_| |_____/ 
rem
rem
rem     Identification Numbers("Idents") are ASSIGNED to their Full Names via symmetric arrays.
rem     
rem
rem #############################################################################################################################################

rem ########### AMTS ############################### 
set /A "counter_AMT=1"
set identifier_AMT[0].ident=01
set identifier_AMT[0].full="Firing support"

rem ########### Bantleon ############################### 
set /A "counter_BAN=1"
set identifier_BAN[0].ident=01
set identifier_BAN[0].full="Avilub Metacool BOD"

rem ########### BRENNER ################################
set /A "counter_BRE=1"
set identifier_BRE[0].ident=01
set identifier_BRE[0].full="Cardboard boxes for shipment"

rem ########### ECOLAB #################################
set /A "counter_ECO=4"
set identifier_ECO[0].ident=01
set identifier_ECO[0].full="COSA FLUX 33"
rem ----------------------------------------------------
set identifier_ECO[1].ident=02
set identifier_ECO[1].full="COSA CIP 72"
rem ----------------------------------------------------
set identifier_ECO[2].ident=03
set identifier_ECO[2].full="COSA CIP 96"
rem ----------------------------------------------------
set identifier_ECO[3].ident=04
set identifier_ECO[3].full="COSA FOAM 40"

rem ########### Gramß ##################################
set /A "counter_GRA=1"
set identifier_GRA[0].ident=01
set identifier_GRA[0].full="Glass vial scew cap with sealing gasket"

rem ########### Linde ##################################
set /A "counter_LIN=1"
set identifier_LIN[0].ident=01
set identifier_LIN[0].full="Argon 4.8"
   
rem ########### Manfred Dreher ######################### 
set /A "counter_MDR=1"
set identifier_MDR[0].ident=01
set identifier_MDR[0].full="Specification for Chips for Trimming Device"

rem ########### NuSil Technology #######################
set /A "counter_NUT=1"
set identifier_NUT[0].ident=01
set identifier_NUT[0].full="MED-1511"

rem ########### Pacplast ###############################
set /A "counter_PAC=1"
set identifier_PAC[0].ident=01
set identifier_PAC[0].full="Shrink Film"

rem ########### Paperdrive #############################
set /A "counter_PAP=3"
set identifier_PAP[0].ident=01
set identifier_PAP[0].full="Labels for Packaging Implants - Global Packaging Solution"
rem ----------------------------------------------------
set identifier_PAP[1].ident=02
set identifier_PAP[1].full="Labels for Packaging Implants"
rem ----------------------------------------------------
set identifier_PAP[2].ident=03
set identifier_PAP[2].full="Plastic Ribbon - black - for Thermotransferprinter"

rem ########### Philips Medisize #######################
set /A "counter_PHI=1"
set identifier_PHI[0].ident=01
set identifier_PHI[0].full="Molded PEEK Rods - Philips Plastics"

rem ########### Rave ################################### 
set /A "counter_RAV=1"
set identifier_RAV[0].ident=01
set identifier_RAV[0].full="Process Temperature Control Rings"

rem ########### Schott ################################# 
set /A "counter_SCH=2"
set identifier_SCH[0].ident=01
set identifier_SCH[0].full="Screw Caps"
rem ----------------------------------------------------
set identifier_SCH[1].ident=02
set identifier_SCH[1].full="Glass Vials"

rem ########### SYMMETRY ###############################
set /A "counter_SYM=1"
set identifier_SYM[0].ident=01
set identifier_SYM[0].full="Instruments"

rem ########### Dastex #################################
set /A "counter_TEX=1" 
set identifier_TEX[0].ident=01
set identifier_TEX[0].full="Nitrile Gloves"

rem ########### Vesta ################################## 
set /A "counter_VES=1"
set identifier_VES[0].ident=01
set identifier_VES[0].full="Silicone Bumper"

rem ########### Warsaw Technology ######################
set /A "counter_WAR=2"
set identifier_WAR[0].ident=01
set identifier_WAR[0].full="Polyethylene Bag"
rem ----------------------------------------------------
set identifier_WAR[1].ident=02
set identifier_WAR[1].full="Custom Growth Rod"

rem ########### counter adjustment ######################
set /A "counter_AMT=%counter_AMT%-1"
set /A "counter_BAN=%counter_BAN%-1"
set /A "counter_BRE=%counter_BRE%-1"
set /A "counter_ECO=%counter_ECO%-1"
set /A "counter_GRA=%counter_GRA%-1"
set /A "counter_LIN=%counter_LIN%-1"
set /A "counter_MDR=%counter_MDR%-1"
set /A "counter_NUT=%counter_NUT%-1"
set /A "counter_PAC=%counter_PAC%-1"
set /A "counter_PAP=%counter_PAP%-1"
set /A "counter_PHI=%counter_PHI%-1"
set /A "counter_RAV=%counter_RAV%-1"
set /A "counter_SCH=%counter_SCH%-1"
set /A "counter_SYM=%counter_SYM%-1"
set /A "counter_TEX=%counter_TEX%-1"
set /A "counter_VES=%counter_VES%-1"
set /A "counter_WAR=%counter_WAR%-1"
rem #############################################################################################################################################


rem #############################################################################################################################################
rem  __  __          _   _ _    _ ______      _____ _______ _    _ _____  ______ _____       _____ ______          _____   _____ _    _ 
rem |  \/  |   /\   | \ | | |  | |  ____/\   / ____|__   __| |  | |  __ \|  ____|  __ \     / ____|  ____|   /\   |  __ \ / ____| |  | |
rem | \  / |  /  \  |  \| | |  | | |__ /  \ | |       | |  | |  | | |__) | |__  | |__) |   | (___ | |__     /  \  | |__) | |    | |__| |
rem | |\/| | / /\ \ | . ` | |  | |  __/ /\ \| |       | |  | |  | |  _  /|  __| |  _  /     \___ \|  __|   / /\ \ |  _  /| |    |  __  |
rem | |  | |/ ____ \| |\  | |__| | | / ____ \ |____   | |  | |__| | | \ \| |____| | \ \     ____) | |____ / ____ \| | \ \| |____| |  | |
rem |_|  |_/_/    \_\_| \_|\____/|_|/_/    \_\_____|  |_|   \____/|_|  \_\______|_|  \_\   |_____/|______/_/    \_\_|  \_\\_____|_|  |_|                                                                                                                                   
rem #############################################################################################################################################

rem Search for Full Equivalent of the threecode
echo Checking DB for Threecode...
for /L %%i in (0, 1, %count_Manufacturers%) do (
   if !Manufacturer[%%i].threecode! EQU %threecode% (
       set threecode_full=!Manufacturer[%%i].full!
       set /a "index_ausgleich=%%i+1"
       echo Found Threecode in DB: [92m!index_ausgleich!/!count_Manufacturers![0m 
       goto :foundManufacturerFull
   )
   set /a "index_ausgleich=%%i+1"
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
if %threecode% EQU "AMT" (
    for /L %%i in (0, 1, %counter_AMT%) do (
        if !identifier_AMT[%%i].ident! EQU %ident% (
            set ident_full=!identifier_AMT[%%i].full!
            set /a "counter_WAR=%counter_AMT%+1"
            echo Found Identifier in DB: [92m%%i/!counter_AMT![0m 
            set /a "counter_WAR=%counter_AMT%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "BAN" (
    for /L %%i in (0, 1, %counter_BAN%) do (
        if !identifier_BAN[%%i].ident! EQU %ident% (
            set ident_full=!identifier_BAN[%%i].full!
            set /a "counter_WAR=%counter_BAN%+1"
            echo Found Identifier in DB: [92m%%i/!counter_BAN![0m 
            set /a "counter_WAR=%counter_BAN%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "BRE" (
    for /L %%i in (0, 1, %counter_BRE%) do (
        if !identifier_BRE[%%i].ident! EQU %ident% (
            set ident_full=!identifier_BRE[%%i].full!
            set /a "counter_WAR=%counter_BRE%+1"
            echo Found Identifier in DB: [92m%%i/!counter_BRE![0m 
            set /a "counter_WAR=%counter_BRE%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "ECO" (
    for /L %%i in (0, 1, %counter_ECO%) do (
        if !identifier_ECO[%%i].ident! EQU %ident% (
            set ident_full=!identifier_ECO[%%i].full!
            set /a "counter_WAR=%counter_ECO%+1"
            echo Found Identifier in DB: [92m%%i/!counter_ECO![0m 
            set /a "counter_WAR=%counter_ECO%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "GRA" (
    for /L %%i in (0, 1, %counter_GRA%) do (
        if !identifier_GRA[%%i].ident! EQU %ident% (
            set ident_full=!identifier_GRA[%%i].full!
            set /a "counter_WAR=%counter_GRA%+1"
            echo Found Identifier in DB: [92m%%i/!counter_GRA![0m 
            set /a "counter_WAR=%counter_GRA%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "LIN" (
    for /L %%i in (0, 1, %counter_LIN%) do (
        if !identifier_LIN[%%i].ident! EQU %ident% (
            set ident_full=!identifier_LIN[%%i].full!
            set /a "counter_WAR=%counter_LIN%+1"
            echo Found Identifier in DB: [92m%%i/!counter_LIN![0m 
            set /a "counter_WAR=%counter_LIN%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "MDR" (
    for /L %%i in (0, 1, %counter_MDR%) do (
        if !identifier_MDR[%%i].ident! EQU %ident% (
            set ident_full=!identifier_MDR[%%i].full!
            set /a "counter_WAR=%counter_MDR%+1"
            echo Found Identifier in DB: [92m%%i/!counter_MDR![0m 
            set /a "counter_WAR=%counter_MDR%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "NUT" (
    for /L %%i in (0, 1, %counter_NUT%) do (
        if !identifier_NUT[%%i].ident! EQU %ident% (
            set ident_full=!identifier_NUT[%%i].full!
            set /a "counter_WAR=%counter_NUT%+1"
            echo Found Identifier in DB: [92m%%i/!counter_NUT![0m 
            set /a "counter_WAR=%counter_NUT%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "PAC" (
    for /L %%i in (0, 1, %counter_PAC%) do (
        if !identifier_PAC[%%i].ident! EQU %ident% (
            set ident_full=!identifier_PAC[%%i].full!
            set /a "counter_WAR=%counter_PAC%+1"
            echo Found Identifier in DB: [92m%%i/!counter_PAC![0m 
            set /a "counter_WAR=%counter_PAC%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "PAP" (
    for /L %%i in (0, 1, %counter_PAP%) do (
        if !identifier_PAP[%%i].ident! EQU %ident% (
            set ident_full=!identifier_PAP[%%i].full!
            set /a "counter_WAR=%counter_PAP%+1"
            echo Found Identifier in DB: [92m%%i/!counter_PAP![0m 
            set /a "counter_WAR=%counter_PAP%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "PHI" (
    for /L %%i in (0, 1, %counter_PHI%) do (
        if !identifier_PHI[%%i].ident! EQU %ident% (
            set ident_full=!identifier_PHI[%%i].full!
            set /a "counter_WAR=%counter_PHI%+1"
            echo Found Identifier in DB: [92m%%i/!counter_PHI![0m 
            set /a "counter_WAR=%counter_PHI%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "RAV" (
    for /L %%i in (0, 1, %counter_RAV%) do (
        if !identifier_RAV[%%i].ident! EQU %ident% (
            set ident_full=!identifier_RAV[%%i].full!
            set /a "counter_WAR=%counter_RAV%+1"
            echo Found Identifier in DB: [92m%%i/!counter_RAV![0m 
            set /a "counter_WAR=%counter_RAV%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "SCH" (
    for /L %%i in (0, 1, %counter_SCH%) do (
        if !identifier_SCH[%%i].ident! EQU %ident% (
            set ident_full=!identifier_SCH[%%i].full!
            set /a "counter_WAR=%counter_SCH%+1"
            echo Found Identifier in DB: [92m%%i/!counter_SCH![0m 
            set /a "counter_WAR=%counter_SCH%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "SYM" (
    for /L %%i in (0, 1, %counter_SYM%) do (
        if !identifier_SYM[%%i].ident! EQU %ident% (
            set ident_full=!identifier_SYM[%%i].full!
            set /a "counter_WAR=%counter_SYM%+1"
            echo Found Identifier in DB: [92m%%i/!counter_SYM![0m 
            set /a "counter_WAR=%counter_SYM%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "TEX" (
    for /L %%i in (0, 1, %counter_TEX%) do (
        if !identifier_TEX[%%i].ident! EQU %ident% (
            set ident_full=!identifier_TEX[%%i].full!
            set /a "counter_WAR=%counter_TEX%+1"
            echo Found Identifier in DB: [92m%%i/!counter_TEX![0m  
            set /a "counter_WAR=%counter_TEX%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "VES" (
    for /L %%i in (0, 1, %counter_VES%) do (
        if !identifier_VES[%%i].ident! EQU %ident% (
            set ident_full=!identifier_VES[%%i].full!
            set /a "counter_WAR=%counter_VES%+1"
            echo Found Identifier in DB: [92m%%i/!counter_VES![0m  
            set /a "counter_WAR=%counter_VES%-1"
            goto :foundProductFull
        ) 
    )
)
if %threecode% EQU "WAR" (
    for /L %%i in (0, 1, %counter_WAR%) do (
        if !identifier_WAR[%%i].ident! EQU %ident% (
            set ident_full=!identifier_WAR[%%i].full!
            set /a "counter_WAR=%counter_WAR%+1"
            echo Found Identifier in DB: [92m%%i/!counter_WAR![0m 
            set /a "counter_WAR=%counter_WAR%-1"
            goto :foundProductFull
        ) 
    )
)
rem #############################################################################################################################################
:foundProductFull
echo ---------------------------------------------------------
echo [96m[I][0m Manufacturer:[96m %threecode_full%[0m 
echo [96m[I][0m Certificate for:[96m %ident_full%[0m 
echo [96m[I][0m Issued in:[96m 20%year%[0m 
echo ---------------------------------------------------------

set yourfoldername=%threecode_full:~1,-1% - %ident_full:~1,-1%\

rem check if folder for cert exists
if not exist "%yourfoldername%" (
  echo [91m[ERR][0m Folder %yourfoldername% doesnt exist
  mkdir "%yourfoldername%"
  echo [92m[OK][0m Created Folder for you.
) else (
  echo [92m[OK][0m Exists already. Perfect!
)

rem This is only there to fix a bug where it displays Created folder for you and then Exsists already again.

rem move certificate into folder
move "%filename:~1,-1%%fileextension:~1,-1%" "%yourfoldername%%filename:~11,-1%%fileextension:~1,-1%" > nul

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
ECHO %temp%>x&FOR %%? IN (x) DO SET /a strlength=%%~z? - 2&del x
if %strlength% LEQ 4 (
    echo [96m[I][0m No splits needed. Ending
    ren "%yourfoldername%%filename:~11,-1%%fileextension:~1,-1%" "%filename:~11,-1%-%year%%fileextension:~1,-1%" > nul
    goto :end
)
rem check if filename is suited for splitting
set temp=%filename:~11,-1%
ECHO %temp%>x&FOR %%? IN (x) DO SET /a strlength=%%~z? - 2&del x
set /a "y=%strlength%-4" > nul
set /a "modulo=%y% %% 5" > nul
if %modulo% NEQ 0 (
    echo [91m[I][0mPlease make sure there are no extra spaces at the end of the file!
    pause
    goto :end
)
echo [96m[I][0m Filename is suitable for Splitting!

rem Calculate how many splits are needed
echo [96m[I][0m Calculating splits needed...
set /a "splits=%y%/5"
if %splits% EQU 1 (
    echo [96m[I][0m One split is needed.
)
if %splits% GTR 1 (
    echo [96m[I][0m %splits% Splits are needed.
)

rem split into seperate WE Files.
echo [96m[I][0m Splitting...
cd "%yourfoldername%"

set original_filename=%filename:~11,-1%

set n=0
for %%a in (%original_filename%) do (
   echo [96m[I] !n! Split of %splits%...
   copy "%original_filename%%fileextension:~1,-1%" "%%a-%year%%fileextension:~1,-1%" > nul
   set original_filename=%original_filename:~5,-5%
   set /A n+=1
   %SystemRoot%\System32\timeout.exe /t 1 > nul
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
echo [96m[I][0m Erfolgreich abgeschlossen! Dieses Fenster schließt sich automatisch nach 3 Sekunden.
%SystemRoot%\System32\timeout.exe /t 3 > nul
pause >nul
exit
