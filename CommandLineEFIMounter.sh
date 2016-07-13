#!/bin/bash
# Command Line EFI Mounter
# (c) Copyright 2016 chris1111 

echo "———————————————————————————————————————————————————————————————————————————————"
echo "This Command needs to be run at Root Admin!
Enter your password follow by ENTER" 
echo "———————————————————————————————————————————————————————————————————————————————"
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

clear

echo "———————————————————————————————————————————————————————————————————————————————"

diskutil list
echo "———————————————————————————————————————————————————————————————————————————————"
echo "Enter the number of the EFI Partition follow by`tput setaf 7``tput sgr0``tput bold``tput setaf 26`[ENTER]`tput sgr0` `tput setaf 7``tput sgr0`"
echo "(Exemple for disk0s1, enter '`tput setaf 7``tput sgr0``tput bold``tput setaf 26`0s1`tput sgr0` `tput setaf 7``tput sgr0`'):"
echo "(Exemple for disk1s1, enter '`tput setaf 7``tput sgr0``tput bold``tput setaf 26`1s1`tput sgr0` `tput setaf 7``tput sgr0`'):"
echo "and so on. . ."
echo "———————————————————————————————————————————————————————————————————————————————"

echo "                 ===== The EFI Partition will be Mounted! ====="
echo "———————————————————————————————————————————————————————————————————————————————"
read diskid
echo "———————————————————————————————————————————————————————————————————————————————"
DISK=/dev/disk$diskid

mkdir -p /Volumes/ESP
Sleep 2

mount -t msdos $DISK /Volumes/ESP

echo "———————————————————————————————————————————————————————————————————————————————"
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Mount EFI`tput sgr0` `tput setaf 7``tput sgr0`" 
echo "———————————————————————————————————————————————————————————————————————————————"
Sleep 2	





 






