;A script that changes arabic text to english text and vice-versa then switches to the language you meant to write in
;
;Instructions: 	- Highlight the text you want to replace and press alt+q (this hotkey can be changed at line 10)
;
;Notes:
;		- The script only works if you have exactly two keyboard languages

FileEncoding, UTF-8

LAlt & q:: ;you can change this to whatever you like

	;store contents of current windows clipboard so it can later be restored
	oldclip := ClipboardAll
	
	;clear clipboard
	clipboard = 
	previousletter = 
	
	;send cut command
	Send, {Control Down}x{Control Up}
	
	;I forgot why this is important, but it's probably still needed
	ClipWait, 1
	
	;this usually happens when you're trying to convert an empty string
	if ErrorLevel
		MsgBox, something went wrong`, did you highlight a string before trying to convert the text?
	
	;store the string we got from cutting in a seperate variable
	clip := clipboard
	
	;go through an incredibly long list of ifs because ahk doesn't have a switch statement ¯\_(ツ)_/¯
	Loop, parse, clip
	{
		if(A_LoopField = "``")
			SendRaw, ذ
			
		else if(A_LoopField = "q" or A_LoopField = "Q")
			SendRaw, ض
		
		else if(A_LoopField = "w" or A_LoopField = "W")
			SendRaw, ص
		
		else if(A_LoopField = "e" or A_LoopField = "E")
			SendRaw, ث
		
		else if(A_LoopField = "r" or A_LoopField = "R")
			SendRaw, ق
		
		else if(A_LoopField = "t"  or A_LoopField = "T")
			SendRaw, ف
		
		else if(A_LoopField = "y" or A_LoopField = "Y")
			SendRaw, غ
		
		else if(A_LoopField = "u" or A_LoopField = "U")
			SendRaw, ع
		
		else if(A_LoopField = "i" or A_LoopField = ""I)
			SendRaw, ه
		
		else if(A_LoopField = "o" or A_LoopField = "O")
			SendRaw, خ
		
		else if(A_LoopField = "p" or A_LoopField = "P")
			SendRaw, ح
		
		else if(A_LoopField = "[")
			SendRaw, ج
		
		else if(A_LoopField = "]")
			SendRaw, د
		
		else if(A_LoopField = "a" or A_LoopField = "A")
			SendRaw, ش
		
		else if(A_LoopField = "s" or A_LoopField = "S")
			SendRaw, س
		
		else if(A_LoopField = "d" or A_LoopField = "D")
			SendRaw, ي
		
		else if(A_LoopField = "f" or A_LoopField = "F")
			SendRaw, ب
		
		else if(A_LoopField = "g" or A_LoopField = "G")
			SendRaw, ل
		
		else if(A_LoopField = "h" or A_LoopField = "H")
			SendRaw, ا
		
		else if(A_LoopField = "j" or A_LoopField = "J")
			SendRaw, ت
		
		else if(A_LoopField = "k" or A_LoopField = "K")
			SendRaw, ن
		
		else if(A_LoopField = "l" or A_LoopField = "L")
			SendRaw, م
		
		else if(A_LoopField = ";")
			SendRaw, ك
		
		else if(A_LoopField = "'")
			SendRaw, ط
		
		else if(A_LoopField = "z" or A_LoopField = "Z")
			SendRaw, ئ
		
		else if(A_LoopField = "x" or A_LoopField = "X")
			SendRaw, ء
		
		else if(A_LoopField = "c" or A_LoopField = "C")
			SendRaw, ؤ
		
		else if(A_LoopField = "v" or A_LoopField = "V")
			SendRaw, ر
		
		else if(A_LoopField = "b" or A_LoopField = "B")
			SendRaw, لا
		
		else if(A_LoopField = "n" or A_LoopField = "N")
			SendRaw, ى
		
		else if(A_LoopField = "m" or A_LoopField = "M")
			SendRaw, ة
		
		else if(A_LoopField = ",")
			SendRaw, و
		
		else if(A_LoopField = ".")
			SendRaw, ز
		
		else if(A_LoopField = "/")
			SendRaw, ظ
		
		else if(A_LoopField = "ذ")
			SendRaw, ``
		
		else if(A_LoopField = "ض")
			SendRaw, q
		
		else if(A_LoopField = "ص")
			SendRaw, w
		
		else if(A_LoopField = "ث")
			SendRaw, e
		
		else if(A_LoopField = "ق")
			SendRaw, r
		
		else if(A_LoopField = "ف")
			SendRaw, t
		
		else if(A_LoopField = "غ")
			SendRaw, y
		
		else if(A_LoopField = "ع")
			SendRaw, u
		
		else if(A_LoopField = "ه")
			SendRaw, i
		
		else if(A_LoopField = "خ")
			SendRaw, o
		
		else if(A_LoopField = "ح")
			SendRaw, p
		
		else if(A_LoopField = "ج")
			SendRaw, [
		
		else if(A_LoopField = "د")
			SendRaw, ]
		
		else if(A_LoopField = "ش")
			SendRaw, a
		
		else if(A_LoopField = "س")
			SendRaw, s
		
		else if(A_LoopField = "ي")
			SendRaw, d
		
		else if(A_LoopField = "ب")
			SendRaw, f
		
		else if(A_LoopField = "ل")
			SendRaw, g
	
		else if(A_LoopField = "ا")
			;if you meant to type in english, pressing "b" results in "لا", so any instance of "لا" will be changed to "b" by the script instead of "gh", this has the disadvantage of having words like "ghost" changed to "bost"
			if(previousletter = "ل")
				Send, {Backspace}b
			else
				SendRaw, h
		
		else if(A_LoopField = "ت")
			SendRaw, j
		
		else if(A_LoopField = "ن")
			SendRaw, k
		
		else if(A_LoopField = "م")
			SendRaw, l
		
		else if(A_LoopField = "ك")
			SendRaw, `;
		
		else if(A_LoopField = "ط")
			SendRaw, '
		
		else if(A_LoopField = "ئ")
			SendRaw, z
		
		else if(A_LoopField = "ء")
			SendRaw, x
		
		else if(A_LoopField = "ؤ")
			SendRaw, c
		
		else if(A_LoopField = "ر")
			SendRaw, v
		
		else if(A_LoopField = "لا")
			SendRaw, b
		
		else if(A_LoopField = "ى")
			SendRaw, n
		
		else if(A_LoopField = "ة")
			SendRaw, m
		
		else if(A_LoopField = "و")
			SendRaw, `,
		
		else if(A_LoopField = "ز")
			SendRaw, .
			
		else if(A_LoopField = "ظ")
			SendRaw, /
		
		;if they're not letters just paste whatever was in the clipboard
		else
			Send, %A_LoopField%
		previousletter = %A_LoopField%
	}

	;switch to the language you meant to write in
	Send, {LWin down}{Space}{LWin up}
	
	;I have no idea why past me decided this variable should be emptied but i'm not going to argue with him
	clip =
	
	;restore the windows clipboard
	clipboard := oldclip
	
	;I have no idea why past me decided this variable should also be emptied but i'm still not going to argue with him
	oldclip = 
	
Return

;a few replacements that help when trying to switch languages in MS office and other applications
Shift & Alt::
	;Windows up needs to be written twice because it gets stuck sometimes
	Send, {Shift up}{Alt up}{LWin down}{Space}{LWin up}{LWin up}
Return

Alt & Shift::
	;Windows up needs to be written twice because it gets stuck sometimes
	Send, {Shift up}{Alt up}{LWin down}{Space}{LWin up}{LWin up}
Return
