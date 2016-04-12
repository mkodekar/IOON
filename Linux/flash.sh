#!/bin/bash

#Colores
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
transparent="\e[0m"
version=1.1
clear
function mostrarheader(){
	
	
	echo -e "$blue#########################################################"
	echo -e "$blue#                                                       #"
    echo -e "$blue#$red OPT [RECOVERY] $version" "${yellow} ${red}  < F""${yellow}luxion" "${red}I""${yellow}s" "${red}T""${yellow}he ""${red}F""${yellow}uture >    "${blue}"   #" 
	echo -e "$blue#"${yellow} "${red}       	     by D""${yellow}eltax"${blue}"            	        #"      
	echo -e "$blue#                                                       #"	
	echo -e "$blue#########################################################""$transparent"
	echo
	echo
	
}


function erase {
mostrarheader
sudo fastboot erase cache
sudo fastboot erase system 
sudo fastboot erase recovery 
sudo fastboot erase userdata
sudo fastboot erase userdata_64
sudo fastboot erase modem 
sudo fastboot erase modemst1 
sudo fastboot erase modemst2
sudo fastboot erase recovery
}

function stock {
erase
mostrarheader
sudo fastboot flash aboot aboot.img
sleep 0.05
sudo fastboot flash aboot abootbak.img
sleep 0.05
sudo fastboot flash apdp apdp.img
sleep 0.05
sudo fastboot flash bluetooth bluetooth.img 
sleep 0.05
sudo fastboot flash boot boot.img
sleep 0.05
sudo fastboot flash cache cache.img
sleep 0.05
sudo fastboot flash config config.img 
sleep 0.05
sudo fastboot flash ddr ddr.img 
sleep 0.05
sudo fastboot flash devinfo devinfo.img
sleep 0.05
sudo fastboot flash dpo dpo.img
sleep 0.05
sudo fastboot flash driver driver.img
sleep 0.05
sudo fastboot flash fsc fsc.img
sleep 0.05
sudo fastboot flash fsg fsg.img
sleep 0.05
sudo fastboot flash hyp hyp.img
sleep 0.05
sudo fastboot flash hyp hypbak.img 
sleep 0.05
sudo fastboot flash keystore keystore.img
sleep 0.05
sudo fastboot flash limits limits.img
sleep 0.05
sudo fastboot flash LOGO logo.img
sleep 0.05
sudo fastboot flash misc misc.img
sleep 0.05
sudo fastboot flash modem modem.img
sleep 0.05 
sudo fastboot flash msadp msadp.img
sleep 0.05 
sudo fastboot flash oem_dycnvbk oem_dycnvbk.img
sleep 0.05 
sudo fastboot flash oem_stanvbk oem_stanvbk.img
sleep 0.05 
sudo fastboot flash param param.img
sleep 0.05
sudo fastboot flash persist persist.img
sleep 0.05
sudo fastboot flash pmic pmic.img
sleep 0.05
sudo fastboot flash pmic pmicbak.img
sleep 0.05 
sudo fastboot flash reserve1 reserve1.img
sleep 0.05
sudo fastboot flash reserve2 reserve2.img
sleep 0.05 
sudo fastboot flash rpm rpmbak.img
sleep 0.05 
sudo fastboot flash recovery maxrecovery.img
sleep 0.05
sudo fastboot flash sbl1 sbl1.img
sleep 0.05
sudo fastboot flash sbl1 sbl1bak.img
sleep 0.05
sudo fastboot flash sdi sdi.img
sleep 0.05
sudo fastboot flash sec sec.img
sleep 0.05
sudo fastboot flash ssd ssd.img
sleep 0.05
sudo fastboot flash tz tz.img
sleep 0.05 
sudo fastboot flash tz tzbak.img
sleep 0.05 
sudo fastboot flash userdata userdata.img
sleep 0.05
sudo fastboot flash userdata_64 userdata_64G.img

}

function root {
mostrarheader
sudo fastboot oem unlock
sudo fastboot erase cache

}

function recovery {
root
mostrarheader
sudo fastboot flash recovery crecovery.img
sudo fastboot erase cache

}

function reboot1 {
mostrarheader
sudo fastboot reboot

}


function exit1 {
	clear
	exit
}
function menu {
		i=1
		while i=1
		do
		mostrarheader
		echo "Select your option"
		echo "                                       "
		echo -e ""$blue"1)"$transparent" Back to stock           "						
		echo -e ""$blue"2)"$transparent" Root"
		echo -e ""$blue"3)"$transparent" Erase all       "
		echo -e ""$blue"4)"$transparent" Custom recovery       "
		echo -e ""$blue"5)"$transparent" Reboot       "
		echo -e ""$blue"6)"$transparent" Exit      "
		echo -e ""
		echo ""
		echo -n "      #> "
		read yn
		echo ""
		case $yn in
			1 ) stock ; break ;;
			2 ) root ; break ;; 
			3 ) erase ; break ;;
			4 ) recovery ; break ;;
			5 ) reboot1 ; break ;;
			6 ) exit1 ; break ;; 
			* ) echo "Unknown option. Please choose again"; conditional_clear ;;
		  esac
		 done
} 
menu
