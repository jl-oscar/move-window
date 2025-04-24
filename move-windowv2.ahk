; Load the DLL
DllCall("LoadLibrary", "Str", "VirtualDesktopAccessor.dll")

MoveWindowRelative(offset) {
    hwnd := WinExist("A")
    if (!hwnd) {
        MsgBox, ❌ No active window found.
        return
    }

    currentDesktop := DllCall("VirtualDesktopAccessor.dll\GetWindowDesktopNumber", "Ptr", hwnd, "Int")
    desktopCount := DllCall("VirtualDesktopAccessor.dll\GetDesktopCount")

    targetDesktop := currentDesktop + offset
    if (targetDesktop < 0 or targetDesktop >= desktopCount) {
        MsgBox, ⚠️ Cannot move window to desktop %targetDesktop% — out of range (0 to %desktopCount%-1)
        return
    }

    result := DllCall("VirtualDesktopAccessor.dll\MoveWindowToDesktopNumber", "Ptr", hwnd, "Int", targetDesktop)
    if (result = 0) {
        MsgBox, ❌ Move failed.
        return
    }

    ; Optional: follow the window to its new desktop
    DllCall("VirtualDesktopAccessor.dll\GoToDesktopNumber", "Int", targetDesktop)
}

; Hotkeys
+^#Left::MoveWindowRelative(-1)
+^#Right::MoveWindowRelative(1)
