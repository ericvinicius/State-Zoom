#!/usr/bin/osascript

# <bitbar.title>State Zoom</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>ericvinicius</bitbar.author>
# <bitbar.author.github>ericvinicius</bitbar.author.github>
# <bitbar.desc>State Zoom</bitbar.desc>
# <bitbar.dependencies>Applescript</bitbar.dependencies>

# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>false</swiftbar.hideSwiftBar>

property meetBtnTitle : "Reunião"
property muteBtnTitle : "Desativar Áudio"
property videoBtnTitle : "Interromper Vídeo"
property shareBtnTitle : "Iniciar Compartilhamento"

set muteState to ""
set videoState to ""
set shareState to ""
set pad1 to ""
set pad2 to ""

if application "zoom.us" is running then
	tell application "System Events"
		tell application process "zoom.us"
			if exists (menu bar item "Reunião" of menu bar 1) then
				
				if exists (menu item MuteBtnTitle of menu 1 of menu bar item meetBtnTitle of menu bar 1) then
					set muteState to "LIVE MIC"
				else
					set muteState to "MUTED"
				end if
				
				if exists (menu item videoBtnTitle of menu 1 of menu bar item meetBtnTitle of menu bar 1) then
					set videoState to "VIDEO ACTIVE"
					set pad1 to "     "
				else
					set videoState to "NO VIDEO"
					set pad1 to "     "
				end if
				
				if exists (menu item shareBtnTitle of menu 1 of menu bar item meetBtnTitle of menu bar 1) then
					set shareState to ""
					set pad2 to ""
				else
					set shareState to "SCREEN SHARE ACTIVE"
					set pad2 to "   "
				end if
			end if
		end tell
	end tell
end if

return shareState & pad2 & videoState & pad1 & muteState & "| size=18
---
State for Zoom"
