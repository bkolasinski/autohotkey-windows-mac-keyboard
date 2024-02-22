;
; AutoHotkey Version: v1.1.22.06
; Language:       English
; Platform:       Windows 10
; Author:         Andy Terra <github.com/airstrike>
;
; Script Function:
;	Toggle Microphone Mute -- assumes it is located at WAVE:1, device #2
;	Use the SoundCardAnalysis script to figure out where your mic is
;       https://www.autohotkey.com/docs/commands/SoundSet.htm#Ex
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

MuteMic() {
	local MM
	SoundSet, +1, WAVE:1, MUTE, 2
	SoundGet, MM, WAVE:1, MUTE, 2
	#Persistent
	ToolTip, % (MM == "On" ? "Microphone muted" : "Microphone online")
	SetTimer, RemoveMuteMicTooltip, 700
	return
}

RemoveMuteMicTooltip:
	SetTimer, RemoveMuteMicTooltip, Off
	ToolTip
	return

#u::MuteMic()