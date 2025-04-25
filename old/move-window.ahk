; Get the directory where the script is located
ScriptDir := A_ScriptDir
ConfigFile := ScriptDir "\config.ini"

; Read the PowerShell script path from config.ini
IniRead, MoveWindowScript, %ConfigFile%, Paths, PowerShellScript

; Construct the full path
MoveWindowScript := ScriptDir "\" MoveWindowScript

; Check if the path exists, otherwise show an error
If (MoveWindowScript = "ERROR" or MoveWindowScript = "") {
    MsgBox, 16, Error, Could not read config.ini or PowerShellScript path is missing. Please check the file.
    ExitApp
}

; Move window to the left desktop
+^#Left::
    Run, powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%MoveWindowScript%" -direction -1, , Hide
    return

; Move window to the right desktop
+^#Right::
    Run, powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%MoveWindowScript%" -direction 1, , Hide
    return