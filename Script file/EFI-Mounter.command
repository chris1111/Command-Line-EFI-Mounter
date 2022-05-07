# MountEFI
# (c) Copyright 2022 chris1111 

#
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
printf '\e[8;45;80t'
BOLD="\033[1m"
RED="\033[1;31m"
GREEN="\033[1;32m"
Purple='\033[0;35m'
OFF="\033[m"

nameh=`users`
function echob() {
  echo "`tput bold`$1`tput sgr0`"
}

function head
{
clear
echo "       ***************************************************************"                      
echo "       *****************          ${GREEN}MountEFI${OFF}         *******************"  
echo "       ***************************************************************"
}

function menu
{
echo "                               Welcome ${BOLD}$nameh${OFF} "                                                              
echo " "
echo "                        Type ${GREEN}${BOLD}A${OFF} ➣ to be able to mount an EFI "
echo "                        Type ${RED}${BOLD}X${OFF} ➣ to quit command   "                            
echo " "                                 

echo "       ***************************************************************"  
echo " "
echo "       ***************************************************************"  
read -n 1 option
}
function MOUNTEFI
{
head
echo " "
echo "MountEFI"

echo "———————————————————————————————————————————————————————————————————————————————"
echo "Type your password at the prompt, then press [Return / Enter] "
sudo diskutil list 

echo "———————————————————————————————————————————————————————————————————————————————"
printf "Enter the Number of the partition then press [Return / Enter]. 
Use Lowercase letter ‘E.g.’ ➤ ${GREEN}disk1s1${OFF}"

echo "  "


echo "———————————————————————————————————————————————————————————————————————————————"

read -p ": " EFI
sudo diskutil mount ${EFI}


echo "———————————————————————————————————————————————————————————————————————————————"

Sleep 1	
osascript -e 'display notification "'"$EFI"'" with title "EFI partition mount" sound name "Funk"'


echo " "
}
function Quit
{
clear
echo " " 
echo "
Quit MountEFI."

osascript -e 'tell app "terminal" to display dialog "Quit MountEFI " with icon file "System:Library:CoreServices:loginwindow.app:Contents:Resources:ShutDown.tiff" buttons {"Logout"} default button 1 with title "MountEFI"'
echo " " 
echob "Good By ${Purple}$nameh${OFF}"
echo " " 
exit 0
}
while [ 1 ]
do
head
menu
case $option in

a|A)
echo
MOUNTEFI ;;
x|X)
echo
Quit ;;


*)
echo ""
esac
echo
echob "${GREEN}You can mount another EFI partition, you must type any key to return.${OFF}"
echo
read -n 1 line
clear
done

exit
