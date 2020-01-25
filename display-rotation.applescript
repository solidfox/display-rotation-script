-- Use entire contents to get all nested ui elements

to changeRotationInWindow(theWindow)
	tell application "System Events"
		tell process "System Preferences"
			if exists window theWindow then
				tell pop up button of tab group 1 of window theWindow
					click
					delay 0.2
					if value = {"Standard"} then
						click menu item "90¡" of menu 1
					else
						click menu item "Standard" of menu 1
					end if
				end tell
			end if
		end tell
	end tell
end changeRotationInWindow

to confirm90DegreeRotation()
	tell application "System Events"
		tell process "System Preferences"
			set attemptsLeft to 10
			set done to false
			repeat while attemptsLeft > 0 and not done
				delay 2
				repeat with theWindow in windows
					if exists (button "Confirm" of sheet 1 of theWindow) then
						click button "Confirm" of sheet 1 of theWindow
						set done to true
					end if
				end repeat
				set attemptsLeft to attemptsLeft - 1
			end repeat
		end tell
	end tell
end confirm90DegreeRotation

tell application "System Preferences"
	activate
	set the current pane to pane id "com.apple.preference.displays"
end tell

delay 0.5

changeRotationInWindow("LG HDR 4K (1)")
changeRotationInWindow("LG HDR 4K (2)")
delay 5
confirm90DegreeRotation()