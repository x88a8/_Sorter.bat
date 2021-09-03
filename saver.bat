@echo off

>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[0].threecode="BAN"
>>save.bat echo set Manufacturer[0].full="Bantleon"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[1].threecode="BRE"
>>save.bat echo set Manufacturer[1].full="Brenner"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[2].threecode="ECO"
>>save.bat echo set Manufacturer[2].full="ECOLAB"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[3].threecode="LIN"
>>save.bat echo set Manufacturer[3].full="Linde"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[4].threecode="MDR"
>>save.bat echo set Manufacturer[4].full="Manfred Dreher"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[5].threecode="NUT"
>>save.bat echo set Manufacturer[5].full="NuSil Technology"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[6].threecode="PAC"
>>save.bat echo set Manufacturer[6].full="Pacplast"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[7].threecode="PAP"
>>save.bat echo set Manufacturer[7].full="Paperdrive"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[8].threecode="PHI"
>>save.bat echo set Manufacturer[8].full="Philips Medisize"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[9].threecode="RAV"
>>save.bat echo set Manufacturer[9].full="RAVE"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[10].threecode="SCH"
>>save.bat echo set Manufacturer[10].full="Schott"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[11].threecode="SYM"
>>save.bat echo set Manufacturer[11].full="SYMMETRY MEDICAL"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[12].threecode="TEX"
>>save.bat echo set Manufacturer[12].full="Dastex"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[13].threecode="VES"
>>save.bat echo set Manufacturer[13].full="Vesta"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[14].threecode="WAR"
>>save.bat echo set Manufacturer[14].full="Warsaw Orthopedics"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo rem                         "Database"
>>save.bat echo rem #############################################################################################################################################
>>save.bat echo rem  _______ _    _ _____  ______ ______ _____ ____  _____  ______  _____ 
>>save.bat echo rem |__   __| |  | |  __ \|  ____|  ____/ ____/ __ \|  __ \|  ____|/ ____|
>>save.bat echo rem    | |  | |__| | |__) | |__  | |__ | |   | |  | | |  | | |__  | (___  
>>save.bat echo rem    | |  |  __  |  _  /|  __| |  __|| |   | |  | | |  | |  __|  \___ \ 
>>save.bat echo rem    | |  | |  | | | \ \| |____| |___| |___| |__| | |__| | |____ ____) |
>>save.bat echo rem    |_|  |_|  |_|_|  \_\______|______\_____\____/|_____/|______|_____/ 
>>save.bat echo rem #############################################################################################################################################                                                               

>>save.bat echo rem count of different manufacturers
>>save.bat echo set /A "count_Manufacturers=15"

>>save.bat echo rem correlating threecodes with their written out counterparts
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[0].threecode="BAN"
>>save.bat echo set Manufacturer[0].full="Bantleon"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[1].threecode="BRE"
>>save.bat echo set Manufacturer[1].full="Brenner"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[2].threecode="ECO"
>>save.bat echo set Manufacturer[2].full="ECOLAB"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[3].threecode="LIN"
>>save.bat echo set Manufacturer[3].full="Linde"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[4].threecode="MDR"
>>save.bat echo set Manufacturer[4].full="Manfred Dreher"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[5].threecode="NUT"
>>save.bat echo set Manufacturer[5].full="NuSil Technology"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[6].threecode="PAC"
>>save.bat echo set Manufacturer[6].full="Pacplast"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[7].threecode="PAP"
>>save.bat echo set Manufacturer[7].full="Paperdrive"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[8].threecode="PHI"
>>save.bat echo set Manufacturer[8].full="Philips Medisize"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[9].threecode="RAV"
>>save.bat echo set Manufacturer[9].full="RAVE"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[10].threecode="SCH"
>>save.bat echo set Manufacturer[10].full="Schott"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[11].threecode="SYM"
>>save.bat echo set Manufacturer[11].full="SYMMETRY MEDICAL"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[12].threecode="TEX"
>>save.bat echo set Manufacturer[12].full="Dastex"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[13].threecode="VES"
>>save.bat echo set Manufacturer[13].full="Vesta"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set Manufacturer[14].threecode="WAR"
>>save.bat echo set Manufacturer[14].full="Warsaw Orthopedics"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo rem 
>>save.bat echo rem ########### counter adjustment #####################
>>save.bat echo set /A "count_Manufacturers=%count_Manufacturers%-1"
>>save.bat echo rem #############################################################################################################################################


>>save.bat echo rem #############################################################################################################################################
>>save.bat echo rem  _____ _____  ______ _   _ _______ _____       __     _____  _____   ____  _____  _    _  _____ _______ _____ 
>>save.bat echo rem |_   _|  __ \|  ____| \ | |__   __/ ____|      \ \   |  __ \|  __ \ / __ \|  __ \| |  | |/ ____|__   __/ ____|
>>save.bat echo rem   | | | |  | | |__  |  \| |  | | | (___    _____\ \  | |__) | |__) | |  | | |  | | |  | | |       | | | (___  
>>save.bat echo rem   | | | |  | |  __| | . ` |  | |  \___ \  |______> > |  ___/|  _  /| |  | | |  | | |  | | |       | |  \___ \ 
>>save.bat echo rem  _| |_| |__| | |____| |\  |  | |  ____) |       / /  | |    | | \ \| |__| | |__| | |__| | |____   | |  ____) |
>>save.bat echo rem |_____|_____/|______|_| \_|  |_| |_____/       /_/   |_|    |_|  \_\\____/|_____/ \____/ \_____|  |_| |_____/ 
>>save.bat echo rem
>>save.bat echo rem
>>save.bat echo rem     Identification Numbers("Idents") are ASSIGNED to their Full Names via symmetric arrays.
>>save.bat echo rem     
>>save.bat echo rem
>>save.bat echo rem #############################################################################################################################################

>>save.bat echo rem ########### Bantleon ############################### 
>>save.bat echo set /A "counter_BAN=1"
>>save.bat echo set identifier_BAN[0].ident=01
>>save.bat echo set identifier_BAN[0].full="Avilub Metacool BOD"

>>save.bat echo rem ########### BRENNER ################################
>>save.bat echo set /A "counter_BRE=1"
>>save.bat echo set identifier_BRE[0].ident=01
>>save.bat echo set identifier_BRE[0].full="Cardboard boxes for shipment"

>>save.bat echo rem ########### ECOLAB #################################
>>save.bat echo set /A "counter_ECO=4"
>>save.bat echo set identifier_ECO[0].ident=01
>>save.bat echo set identifier_ECO[0].full="COSA FLUX 33"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set identifier_ECO[1].ident=02
>>save.bat echo set identifier_ECO[1].full="COSA CIP 72"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set identifier_ECO[2].ident=03
>>save.bat echo set identifier_ECO[2].full="COSA CIP 96"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set identifier_ECO[3].ident=04
>>save.bat echo set identifier_ECO[3].full="COSA FOAM 40"
>>save.bat echo 
>>save.bat echo rem ########### Linde ##################################
>>save.bat echo set /A "counter_LIN=1"
>>save.bat echo set identifier_LIN[0].ident=01
>>save.bat echo set identifier_LIN[0].full="Argon 4.8"
   
>>save.bat echo rem ########### Manfred Dreher ######################### 
>>save.bat echo set /A "counter_MDR=1"
>>save.bat echo set identifier_MDR[0].ident=01
>>save.bat echo set identifier_MDR[0].full="Specification for Chips for Trimming Device"
>>save.bat echo 
>>save.bat echo rem ########### NuSil Technology #######################
>>save.bat echo set /A "counter_NUT=1"
>>save.bat echo set identifier_NUT[0].ident=01
>>save.bat echo set identifier_NUT[0].full="MED-1511"

>>save.bat echo rem ########### Pacplast ###############################
>>save.bat echo set /A "counter_PAC=1"
>>save.bat echo set identifier_PAC[0].ident=01
>>save.bat echo set identifier_PAC[0].full="Shrink Film"

>>save.bat echo rem ########### Paperdrive #############################
>>save.bat echo set /A "counter_PAP=3"
>>save.bat echo set identifier_PAP[0].ident=01
>>save.bat echo set identifier_PAP[0].full="Labels for Packaging Implants - Global Packaging Solution"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set identifier_PAP[1].ident=02
>>save.bat echo set identifier_PAP[1].full="Labels for Packaging Implants"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set identifier_PAP[2].ident=03
>>save.bat echo set identifier_PAP[2].full="Plastic Ribbon - black - for Thermotransferprinter"

>>save.bat echo rem ########### Philips Medisize #######################
>>save.bat echo set /A "counter_PHI=1"
>>save.bat echo set identifier_PHI[0].ident=01
>>save.bat echo set identifier_PHI[0].full="Molded PEEK Rods - Philips Plastics"

>>save.bat echo rem ########### Rave ################################### 
>>save.bat echo set /A "counter_RAV=1"
>>save.bat echo set identifier_RAV[0].ident=01
>>save.bat echo set identifier_RAV[0].full="Process Temperature Control Rings"

>>save.bat echo rem ########### Schott ################################# 
>>save.bat echo set /A "counter_SCH=2"
>>save.bat echo set identifier_SCH[0].ident=01
>>save.bat echo set identifier_SCH[0].full="Screw Caps"
>>save.bat echo rem ----------------------------------------------------
>>save.bat echo set identifier_SCH[1].ident=02
>>save.bat echo set identifier_SCH[1].full="Glass Vials"

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
set /A "counter_BAN=%counter_BRE%-1"
set /A "counter_BRE=%counter_BRE%-1"
set /A "counter_ECO=%counter_ECO%-1"
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


echo variables saved
pause
goto :load
goto :start


:load
if not exist save.bat goto :start
call save.bat
echo %Manufacturer[12].full%
echo %Manufacturer[3].threecode%
echo %cap%
pause
exit