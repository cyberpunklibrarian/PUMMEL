;PUMMEL - Processing Unclaimed Materials Manually is Essentially Lame
; Set up the GUI and variables first.

; Speed- How fast does PUMMEL process the unclaim?
Gui, font, s10 bold, Arial
Gui, Add, Text,, Speed
Gui, font, s10 norm, Arial
Gui, Add, Radio, vSpeedRadio, Slow
Gui, Add, Radio,, Medium
Gui, Add, Radio,, Fast
Gui, Add, Button, default xm, Submit


; Check in after processing- Give the option
Gui, font, s10 bold, Arial
Gui, Add, Text, ym, Check In After Processing
Gui, font, s10 norm, Arial
Gui, Add, Radio, vCheckInRadio, Yes
Gui, Add, Radio, checked, No

; Process from file- Interface to read froom a file full of barcodes
Gui, font, s10 bold, Arial
Gui, Add, Text, ym, Process From File
Gui, font, s10 norm, Arial
Gui, Add, Button,, Browse

Gui, Show, W410 H175, PUMMEL GUI Development Build
return


ButtonSubmit:
Gui, Submit, NoHide

if SpeedRadio = 1 
	ProcessSpeed := 1200
else if SpeedRadio = 2
	ProcessSpeed := 750
else if SpeedRadio = 3 
	ProcessSpeed := 500
else
	ProcessSpeed := 1200

if CheckInRadio = 1
	CheckIn := 1
else if CheckInRadio = 2
	CheckIn := 0
else
	CheckIn := 0

if SpeedRadio = 1
	SpeedRate := "Slow"
else if SpeedRadio = 2
	SpeedRate := "Medium"
else
	SpeedRate := "Fast"

if CheckIn = 1
	WillCheck := "Yes"
else
	WillCheck := "No"

MsgBox Settings saved. `nSpeed: %SpeedRate%`nCheck In: %WillCheck%

return

^!u::
send {Enter}+{End}
Sleep, ProcessSpeed
send ^c{Tab}{Tab}{Enter}
Sleep, ProcessSpeed
send !va^c2.00{Tab}
Sleep, ProcessSpeed
send r
Sleep, 250
send r
Sleep, 250
send r
Sleep, 250
send r
Sleep, 250
send r
Sleep, ProcessSpeed
send {Tab}^v{Tab}{Tab}
Sleep, ProcessSpeed
send Pummel v0.1b DLM @ QC{Tab}{Enter}
Sleep, ProcessSpeed
send !fc
Sleep, ProcessSpeed
;if CheckIn = 1
;{
;	send ^i
;	Sleep, 3000
;	send y
;	send !fc
;	Sleep, ProcessSpeed
;	send !n
;	return
;}
;else
;{
;	send !fc
;	Sleep, ProcessSpeed
;	send !n
;}	
;return

GuiClose:
ExitApp