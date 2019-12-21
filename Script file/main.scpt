# Command Line EFI Mounter
# (c) Copyright 2016 chris1111
set theAction to button returned of (display dialog "Welcome
Command Line EFI Mounter" with icon note buttons {"Quit", "Open"} cancel button "Quit" default button ("Open"))
set source to path to me as string
set source to POSIX path of source & "Contents/Resources/Command Line EFI Mounter/EFI-Mounter.command"
set source to quoted form of source
set n to 5
set progress total steps to n
set progress description to "Command Line EFI Mounter"
set progress additional description to "Open Command"

repeat with i from 1 to n
	delay 0.3
	set progress completed steps to i
end repeat
do shell script "open " & source & "/"
