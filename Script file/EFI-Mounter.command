# Command Line EFI Mounter
# (c) Copyright 2016 chris1111 
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
defaults write com.apple.terminal "Default Window Settings" "Pro"
defaults write com.apple.terminal "Startup Window Settings" "Pro"
#   Slick Progress Bar
# Functions
PUT(){ echo -en "\033[${1};${2}H";}  
DRAW(){ echo -en "\033%";echo -en "\033(0";}         
WRITE(){ echo -en "\033(B";}  
HIDECURSOR(){ echo -en "\033[?25l";} 
NORM(){ echo -en "\033[?12l\033[?25h";}
function showBar {
        percDone=$(echo 'scale=2;'$1/$2*100 | bc)
        halfDone=$(echo $percDone/2 | bc) #I prefer a half sized bar graph
        barLen=$(echo ${percDone%'.00'})
        halfDone=`expr $halfDone + 15`
        tput bold
        PUT 7 28; printf "%4.4s  "      #Print the percentage
        PUT 1 $halfDone;  echo -e "\033[4m \033[0m" #Draw the bar
         tput sgr0
        }
# Start Script
clear
HIDECURSOR
WRITE                

for (( i=0; i<=50; i++ ))  
do
    showBar $i 50  #Call bar drawing function "showBar"
    sleep 0.0
done
# End of your script
# Clean up at end of script
PUT 10 12                                           
echo -e ""                                        
NORM
printf '\e[8;39;81t'
./Scripts/Main.sh
