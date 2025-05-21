#SingleInstance, Force

global IsPressETimerOn := false
global IsSellInvTimerOn := false
global IsCollectCropsTimerOn := false
global IsAutoSeedTimerOn := false
global IsAntiAfkTimerOn := false

Gui, Show, w500 h100, Grow a Garden v1.0.0
Gui, Color, Black
Gui, Font, cWhite s8, Segoe UI
Gui, Add, Checkbox, x20 y10 vChecked gCheckedG, Autoclick E (Make sure this off while autofarm)
Gui, Add, Checkbox, x20 y40 vCheckedSell gCheckedSellG, AutoSell
Gui, Add, Checkbox, x20 y70 vCheckedAutoFarm gAutoFarm, AutoFarm
Gui, Add, Checkbox, x90 y40 vCheckedAutoSeedCollect gAutoSeed, AutoBuySeeds
Gui, Add, Checkbox, x95 y70 vAntiAfkChecked gAntiAfk, AntiAfk (Use this to afk Rainy, Snowy, Disco, etc)
Gui, Add, Text, x300 y10, This Script is in Beta, Made by Water
Gui, +AlwaysOnTop
Return

CustomTimer(TimerName, Period, On := true) {
    global IsPressETimerOn, IsSellInvTimerOn, IsCollectCropsTimerOn, IsAutoSeedTimerOn, IsAntiAfkTimerOn
    stateVar := "Is" . TimerName . "TimerOn"
    currentState := %stateVar%
    if (On && !currentState) {
        SetTimer, %TimerName%, %Period%
        %stateVar% := true
    } else if (!On && currentState) {
        SetTimer, %TimerName%, Off
        %stateVar% := false
    }
}

CheckedG:
Gui, Submit, NoHide
CustomTimer("PressE", 0, Checked)
if (Checked)
    WinActivate, ahk_exe RobloxPlayerBeta.exe
Return

PressE:
Send, e
Return

CheckedSellG:
Gui, Submit, NoHide
CustomTimer("SellInv", 180000, CheckedSell)
Return

SellInv:
WinActivate, ahk_exe RobloxPlayerBeta.exe
CustomTimer("PressE", 0, false)
CustomTimer("CollectCrops", 100, false)
CustomTimer("AutoSeedFunc", 120000, false)
Send {a up}
Send {s up}
Send {w up}
Send {d up}
Sleep, 500
MouseMove, 1236, 130, 3
Sleep, 100
Click, Left
Sleep, 100
Send, e
Sleep, 2000
MouseMove, 1234, 558, 3
Sleep, 100
Click, Left
Sleep, 1000
MouseMove, 954, 146, 3
Sleep, 1000
Click, Left
Sleep, 300

if (CheckedAutoFarm)
    CustomTimer("CollectCrops", 100, true)
if (Checked)
    CustomTimer("PressE", 0, true)
if (CheckedAutoSeedCollect)
    CustomTimer("AutoSeedFunc", 120000, true)
Return

AutoFarm:
Gui, Submit, NoHide
CustomTimer("CollectCrops", 100, CheckedAutoFarm)
Return

CollectCrops:
WinActivate, ahk_exe RobloxPlayerBeta.exe
Sleep, 100
MouseMove, 954, 146, 3
Sleep, 100
Click, Left
Sleep, 100
CustomTimer("PressE", 0, true)
Sleep, 100
Send {w Down}
Sleep, 750
Send {w Up}
Send {a down}
Sleep, 1730
Send {a up}
Sleep, 100
Send {d Down}
Sleep, 1730
Send {d up}
MouseMove, 954, 146, 3
Sleep, 100
Click, Left
Sleep, 100
Send {w Down}
Sleep, 750
Send {w Up}
Sleep, 100
Send {d Down}
Sleep, 1730
Send {d up}
Sleep, 100
Send {a down}
Sleep, 1730
Send {a up}
Sleep, 100
MouseMove, 954, 146, 3
Sleep, 100
Click, Left
Send {w Down}
Sleep, 1500
Send {w Up}
Sleep, 100
Send {a Down}
Sleep, 1730
Send {a up}
Sleep, 100
Send {d Down}
Sleep, 1730
Send {d up}
MouseMove, 954, 146, 3
Sleep, 100
Click, Left
Sleep, 100
Send {w Down}
Sleep, 1500
Send {w Up}
Sleep, 100
Send {d Down}
Sleep, 1730
Send {d up}
Sleep, 100
Send {a Down}
Sleep, 1730
Send {a up}
MouseMove, 954, 146, 3
Sleep, 100
Click, Left
CustomTimer("PressE", 0, false)
Return

AutoSeed:
Gui, Submit, NoHide
CustomTimer("AutoSeedFunc", 120000, CheckedAutoSeedCollect)
Return

AutoSeedFunc:
WinActivate, ahk_exe RobloxPlayerBeta.exe
Sleep, 100
CustomTimer("AutoFarm", 100, false)
CustomTimer("SellInv", 180000, false)
CustomTimer("PressE", 0, false)
Sleep, 100
MouseMove, 675, 141, 3
Sleep, 100
Click, Left
Sleep, 100
Send, e
Sleep, 1500
MouseMove, 698, 751, 3
Sleep, 100
Send, {WheelDown 1000}
Sleep, 100
Click, Left
Sleep, 100
MouseMove, 703, 829, 3
Sleep, 100
Click, Left, 3
Sleep, 100
MouseMove, 717, 436, 3
Sleep, 100
Click, Left
Sleep, 100
MouseMove, 740, 848, 3
Sleep, 100
Click, Left, 3
Sleep, 100
MouseMove, 722, 421, 3
Sleep, 100
Click, Left
Sleep, 100
MouseMove, 738, 812, 3
Sleep, 100
Click, Left, 3
Sleep, 100
MouseMove, 721 ,416, 3
Sleep, 100
Click, Left
Sleep, 100
MouseMove, 767, 822, 3
Sleep, 100
Click, Left, 30
Sleep, 100
MouseMove, 718, 397
Sleep, 100
Click, Left
Sleep, 100
MouseMove, 740, 820, 3
Sleep, 100
Click, Left, 3
Sleep, 100
MouseMove, 720, 392, 3
Click, Left
Sleep, 100
MouseMove, 768, 803, 3
Click, Left, 3
Sleep, 100
MouseMove, 725, 394, 3
Click, Left
Sleep, 100
MouseMove, 755, 785, 3
Click, Left, 3
Sleep, 100
MouseMove, 1299, 277, 3
Sleep, 100
Click, Left
Sleep, 100
MouseMove, 954, 146, 3
Sleep, 100
Click, Left
Sleep, 100
if (CheckedAutoFarm)
    CustomTimer("CollectCrops", 100, true)
if (CheckedSell)
    CustomTimer("SellInv", 180000, true)
if (Checked)
    CustomTimer("PressE", 0, true)
Return

AntiAfk:
Gui, Submit, NoHide
CustomTimer("AntiAfkFunc", 900000, AntiAfkChecked)
Return

AntiAfkFunc:
Click, Right
Return

GuiClose:
ExitApp
Return