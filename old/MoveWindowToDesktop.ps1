param (
    [int]$direction
)


# Run "Get-Module -ListAvailable | Where-Object { $_.Name -eq "VirtualDesktop" }"
# I know it is shit, but dont want to waste more time on fixing it nice :D
if (-not (Get-Module -Name VirtualDesktop)) {
    Import-Module "Path-to-the-module" -Force
}

$currentDesktop = Get-DesktopIndex
$totalDesktops = Get-DesktopCount
$hwnd = Get-ActiveWindowHandle

$newDesktop = $currentDesktop + $direction

if ($newDesktop -ge 0 -and $newDesktop -lt $totalDesktops) {
    Move-ActiveWindow (Get-Desktop -Index $newDesktop) | Out-Null

    Start-Sleep -Milliseconds 50
    Switch-Desktop (Get-Desktop -Index $newDesktop) | Out-Null
}