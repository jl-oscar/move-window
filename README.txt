Requirements:
Install-Module -Name VirtualDesktop -Scope CurrentUser -Force -AllowClobber

Update the path to the module in MoveWindowToDesktop.ps1:
Get-Module -ListAvailable | Where-Object { $_.Name -eq "VirtualDesktop" }

Modify the path in "move-window.ahk" to target the correct path to your script