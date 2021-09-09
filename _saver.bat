@echo off

>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[0].threecode="BAN"
>>"_data/db.bat" echo set Manufacturer[0].full="Bantleon"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[1].threecode="BRE"
>>"_data/db.bat" echo set Manufacturer[1].full="Brenner"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[2].threecode="ECO"
>>"_data/db.bat" echo set Manufacturer[2].full="ECOLAB"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[3].threecode="LIN"
>>"_data/db.bat" echo set Manufacturer[3].full="Linde"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[4].threecode="MDR"
>>"_data/db.bat" echo set Manufacturer[4].full="Manfred Dreher"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[5].threecode="NUT"
>>"_data/db.bat" echo set Manufacturer[5].full="NuSil Technology"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[6].threecode="PAC"
>>"_data/db.bat" echo set Manufacturer[6].full="Pacplast"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[7].threecode="PAP"
>>"_data/db.bat" echo set Manufacturer[7].full="Paperdrive"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[8].threecode="PHI"
>>"_data/db.bat" echo set Manufacturer[8].full="Philips Medisize"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[9].threecode="RAV"
>>"_data/db.bat" echo set Manufacturer[9].full="RAVE"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[10].threecode="SCH"
>>"_data/db.bat" echo set Manufacturer[10].full="Schott"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[11].threecode="SYM"
>>"_data/db.bat" echo set Manufacturer[11].full="SYMMETRY MEDICAL"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[12].threecode="TEX"
>>"_data/db.bat" echo set Manufacturer[12].full="Dastex"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[13].threecode="VES"
>>"_data/db.bat" echo set Manufacturer[13].full="Vesta"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[14].threecode="WAR"
>>"_data/db.bat" echo set Manufacturer[14].full="Warsaw Orthopedics"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo rem                         "Database"
>>"_data/db.bat" echo rem #############################################################################################################################################
>>"_data/db.bat" echo rem  _______ _    _ _____  ______ ______ _____ ____  _____  ______  _____ 
>>"_data/db.bat" echo rem |__   __| |  | |  __ \|  ____|  ____/ ____/ __ \|  __ \|  ____|/ ____|
>>"_data/db.bat" echo rem    | |  | |__| | |__) | |__  | |__ | |   | |  | | |  | | |__  | (___  
>>"_data/db.bat" echo rem    | |  |  __  |  _  /|  __| |  __|| |   | |  | | |  | |  __|  \___ \ 
>>"_data/db.bat" echo rem    | |  | |  | | | \ \| |____| |___| |___| |__| | |__| | |____ ____) |
>>"_data/db.bat" echo rem    |_|  |_|  |_|_|  \_\______|______\_____\____/|_____/|______|_____/ 
>>"_data/db.bat" echo rem #############################################################################################################################################                                                               

>>"_data/db.bat" echo rem count of different manufacturers
>>"_data/db.bat" echo set /A "count_Manufacturers=15"

>>"_data/db.bat" echo rem correlating threecodes with their written out counterparts
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[0].threecode="BAN"
>>"_data/db.bat" echo set Manufacturer[0].full="Bantleon"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[1].threecode="BRE"
>>"_data/db.bat" echo set Manufacturer[1].full="Brenner"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[2].threecode="ECO"
>>"_data/db.bat" echo set Manufacturer[2].full="ECOLAB"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[3].threecode="LIN"
>>"_data/db.bat" echo set Manufacturer[3].full="Linde"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[4].threecode="MDR"
>>"_data/db.bat" echo set Manufacturer[4].full="Manfred Dreher"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[5].threecode="NUT"
>>"_data/db.bat" echo set Manufacturer[5].full="NuSil Technology"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[6].threecode="PAC"
>>"_data/db.bat" echo set Manufacturer[6].full="Pacplast"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[7].threecode="PAP"
>>"_data/db.bat" echo set Manufacturer[7].full="Paperdrive"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[8].threecode="PHI"
>>"_data/db.bat" echo set Manufacturer[8].full="Philips Medisize"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[9].threecode="RAV"
>>"_data/db.bat" echo set Manufacturer[9].full="RAVE"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[10].threecode="SCH"
>>"_data/db.bat" echo set Manufacturer[10].full="Schott"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[11].threecode="SYM"
>>"_data/db.bat" echo set Manufacturer[11].full="SYMMETRY MEDICAL"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[12].threecode="TEX"
>>"_data/db.bat" echo set Manufacturer[12].full="Dastex"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[13].threecode="VES"
>>"_data/db.bat" echo set Manufacturer[13].full="Vesta"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set Manufacturer[14].threecode="WAR"
>>"_data/db.bat" echo set Manufacturer[14].full="Warsaw Orthopedics"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo rem 
>>"_data/db.bat" echo rem ########### counter adjustment #####################
>>"_data/db.bat" echo set /A "count_Manufacturers=%count_Manufacturers%-1"
>>"_data/db.bat" echo rem #############################################################################################################################################


>>"_data/db.bat" echo rem #############################################################################################################################################
>>"_data/db.bat" echo rem  _____ _____  ______ _   _ _______ _____       __     _____  _____   ____  _____  _    _  _____ _______ _____ 
>>"_data/db.bat" echo rem |_   _|  __ \|  ____| \ | |__   __/ ____|      \ \   |  __ \|  __ \ / __ \|  __ \| |  | |/ ____|__   __/ ____|
>>"_data/db.bat" echo rem   | | | |  | | |__  |  \| |  | | | (___    _____\ \  | |__) | |__) | |  | | |  | | |  | | |       | | | (___  
>>"_data/db.bat" echo rem   | | | |  | |  __| | . ` |  | |  \___ \  |______> > |  ___/|  _  /| |  | | |  | | |  | | |       | |  \___ \ 
>>"_data/db.bat" echo rem  _| |_| |__| | |____| |\  |  | |  ____) |       / /  | |    | | \ \| |__| | |__| | |__| | |____   | |  ____) |
>>"_data/db.bat" echo rem |_____|_____/|______|_| \_|  |_| |_____/       /_/   |_|    |_|  \_\\____/|_____/ \____/ \_____|  |_| |_____/ 
>>"_data/db.bat" echo rem
>>"_data/db.bat" echo rem
>>"_data/db.bat" echo rem     Identification Numbers("Idents") are ASSIGNED to their Full Names via symmetric arrays.
>>"_data/db.bat" echo rem     
>>"_data/db.bat" echo rem
>>"_data/db.bat" echo rem #############################################################################################################################################

>>"_data/db.bat" echo rem ########### Bantleon ############################### 
>>"_data/db.bat" echo set /A "counter_BAN=1"
>>"_data/db.bat" echo set identifier_BAN[0].ident=01
>>"_data/db.bat" echo set identifier_BAN[0].full="Avilub Metacool BOD"

>>"_data/db.bat" echo rem ########### BRENNER ################################
>>"_data/db.bat" echo set /A "counter_BRE=1"
>>"_data/db.bat" echo set identifier_BRE[0].ident=01
>>"_data/db.bat" echo set identifier_BRE[0].full="Cardboard boxes for shipment"

>>"_data/db.bat" echo rem ########### ECOLAB #################################
>>"_data/db.bat" echo set /A "counter_ECO=4"
>>"_data/db.bat" echo set identifier_ECO[0].ident=01
>>"_data/db.bat" echo set identifier_ECO[0].full="COSA FLUX 33"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_ECO[1].ident=02
>>"_data/db.bat" echo set identifier_ECO[1].full="COSA CIP 72"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_ECO[2].ident=03
>>"_data/db.bat" echo set identifier_ECO[2].full="COSA CIP 96"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_ECO[3].ident=04
>>"_data/db.bat" echo set identifier_ECO[3].full="COSA FOAM 40"
>>"_data/db.bat" echo 
>>"_data/db.bat" echo rem ########### Linde ##################################
>>"_data/db.bat" echo set /A "counter_LIN=1"
>>"_data/db.bat" echo set identifier_LIN[0].ident=01
>>"_data/db.bat" echo set identifier_LIN[0].full="Argon 4.8"
   
>>"_data/db.bat" echo rem ########### Manfred Dreher ######################### 
>>"_data/db.bat" echo set /A "counter_MDR=1"
>>"_data/db.bat" echo set identifier_MDR[0].ident=01
>>"_data/db.bat" echo set identifier_MDR[0].full="Specification for Chips for Trimming Device"
>>"_data/db.bat" echo 
>>"_data/db.bat" echo rem ########### NuSil Technology #######################
>>"_data/db.bat" echo set /A "counter_NUT=1"
>>"_data/db.bat" echo set identifier_NUT[0].ident=01
>>"_data/db.bat" echo set identifier_NUT[0].full="MED-1511"

>>"_data/db.bat" echo rem ########### Pacplast ###############################
>>"_data/db.bat" echo set /A "counter_PAC=1"
>>"_data/db.bat" echo set identifier_PAC[0].ident=01
>>"_data/db.bat" echo set identifier_PAC[0].full="Shrink Film"

>>"_data/db.bat" echo rem ########### Paperdrive #############################
>>"_data/db.bat" echo set /A "counter_PAP=3"
>>"_data/db.bat" echo set identifier_PAP[0].ident=01
>>"_data/db.bat" echo set identifier_PAP[0].full="Labels for Packaging Implants - Global Packaging Solution"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_PAP[1].ident=02
>>"_data/db.bat" echo set identifier_PAP[1].full="Labels for Packaging Implants"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_PAP[2].ident=03
>>"_data/db.bat" echo set identifier_PAP[2].full="Plastic Ribbon - black - for Thermotransferprinter"

>>"_data/db.bat" echo rem ########### Philips Medisize #######################
>>"_data/db.bat" echo set /A "counter_PHI=1"
>>"_data/db.bat" echo set identifier_PHI[0].ident=01
>>"_data/db.bat" echo set identifier_PHI[0].full="Molded PEEK Rods - Philips Plastics"

>>"_data/db.bat" echo rem ########### Rave ################################### 
>>"_data/db.bat" echo set /A "counter_RAV=1"
>>"_data/db.bat" echo set identifier_RAV[0].ident=01
>>"_data/db.bat" echo set identifier_RAV[0].full="Process Temperature Control Rings"

>>"_data/db.bat" echo rem ########### Schott ################################# 
>>"_data/db.bat" echo set /A "counter_SCH=2"
>>"_data/db.bat" echo set identifier_SCH[0].ident=01
>>"_data/db.bat" echo set identifier_SCH[0].full="Screw Caps"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_SCH[1].ident=02
>>"_data/db.bat" echo set identifier_SCH[1].full="Glass Vials"

>>"_data/db.bat" echo rem ########### SYMMETRY ###############################
>>"_data/db.bat" echo set /A "counter_SYM=1"
>>"_data/db.bat" echo set identifier_SYM[0].ident=01
>>"_data/db.bat" echo set identifier_SYM[0].full="Instruments"

>>"_data/db.bat" echo rem ########### Dastex #################################
>>"_data/db.bat" echo set /A "counter_TEX=1" 
>>"_data/db.bat" echo set identifier_TEX[0].ident=01
>>"_data/db.bat" echo set identifier_TEX[0].full="Nitrile Gloves"

>>"_data/db.bat" echo rem ########### Vesta ################################## 
>>"_data/db.bat" echo set /A "counter_VES=1"
>>"_data/db.bat" echo set identifier_VES[0].ident=01
>>"_data/db.bat" echo set identifier_VES[0].full="Silicone Bumper"

>>"_data/db.bat" echo rem ########### Warsaw Technology ######################
>>"_data/db.bat" echo set /A "counter_WAR=2"
>>"_data/db.bat" echo set identifier_WAR[0].ident=01
>>"_data/db.bat" echo set identifier_WAR[0].full="Polyethylene Bag"
>>"_data/db.bat" echo rem ----------------------------------------------------
>>"_data/db.bat" echo set identifier_WAR[1].ident=02
>>"_data/db.bat" echo set identifier_WAR[1].full="Custom Growth Rod"

>>"_data/db.bat" echo rem ########### counter adjustment ######################
>>"_data/db.bat" echo set /A "counter_BAN=%counter_BRE%-1"
>>"_data/db.bat" echo set /A "counter_BRE=%counter_BRE%-1"
>>"_data/db.bat" echo set /A "counter_ECO=%counter_ECO%-1"
>>"_data/db.bat" echo set /A "counter_LIN=%counter_LIN%-1"
>>"_data/db.bat" echo set /A "counter_MDR=%counter_MDR%-1"
>>"_data/db.bat" echo set /A "counter_NUT=%counter_NUT%-1"
>>"_data/db.bat" echo set /A "counter_PAC=%counter_PAC%-1"
>>"_data/db.bat" echo set /A "counter_PAP=%counter_PAP%-1"
>>"_data/db.bat" echo set /A "counter_PHI=%counter_PHI%-1"
>>"_data/db.bat" echo set /A "counter_RAV=%counter_RAV%-1"
>>"_data/db.bat" echo set /A "counter_SCH=%counter_SCH%-1"
>>"_data/db.bat" echo set /A "counter_SYM=%counter_SYM%-1"
>>"_data/db.bat" echo set /A "counter_TEX=%counter_TEX%-1"
>>"_data/db.bat" echo set /A "counter_VES=%counter_VES%-1"
>>"_data/db.bat" echo set /A "counter_WAR=%counter_WAR%-1"
>>"_data/db.bat" echo rem #############################################################################################################################################


### here comes the xustom stuff