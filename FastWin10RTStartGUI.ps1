set-ExecutionPolicy RemoteSigned
cls

# Основная папка
$BaseFiles = "$PSScriptRoot\Files"

# Папка METRO приложений
$METROapps = "$PSScriptRoot\Files\METROapps\Core"

# Папка приложений Office
$OfficeApps = "$PSScriptRoot\Files\METROapps\secondary\Office"

# Папка приложений Bing
$BingApps = "$PSScriptRoot\Files\METROapps\secondary\Bing"

# Папка приложений Xbox and etc.
$EtcApps = "$PSScriptRoot\Files\METROapps\secondary\Etc"

# Папка non-uwp
$NONuwp = "$PSScriptRoot\Files\METROapps\nonuwp"

# Папка Зависимостей
$DependF = "$PSScriptRoot\Files\dependencies"

# Папка сертификатов
$CERF = "$PSScriptRoot\Files\Cert"

# Папка отключения WaterMarkи
$WATEROFF = "$PSScriptRoot\Files\LP"

#Test licensgui
$license= Test-Path -PathType Leaf -Path "c:\windows\system32\licensingui.exe"

################### Check folders and files ############################
if (Test-Path -Path $BaseFiles) {
write-host "Check" -ForegroundColor Green
}
else {
write-error "Missing folder! Check files!"
pause
Exit
}

if (Test-Path -Path $DependF) {
write-host "Check" -ForegroundColor Green
}
else {
write-error "Missing folder! Check files!"
pause
Exit
}

if (Test-Path -Path $CERF) {
write-host "Check" -ForegroundColor Green
}
else {
write-error "Missing folder! Check files!"
pause
Exit
}

if (Test-Path -Path $METROapps) {
write-host "Check" -ForegroundColor Green
}
else {
write-error "Missing folder! Check files!"
pause
Exit
}

if (Test-Path -Path $NONuwp) {
write-host "Check" -ForegroundColor Green
}
else {
write-error "Missing folder! Check files!"
pause
Exit
}

write-host "All folders checked!" -ForegroundColor Green 
################### Hello screen ############################

write-host ">========================================================<" -ForegroundColor Cyan
write-host "                      Hello there!" -ForegroundColor Cyan
write-host "               Thanks for using my script" -ForegroundColor Cyan
write-host "                Script made by NeonCatRC" -ForegroundColor Cyan
write-host "       Some materials get from Zerg_MOS and halkyon" -ForegroundColor Cyan
write-host "If you want to say 'Thank you'- join OpenRT discord server" -ForegroundColor DarkGreen
write-host "          Here it is: https://discord.gg/tAxvvVC" -ForegroundColor Cyan
write-host ">========================================================<" -ForegroundColor Cyan
pause
cls

############################ Start GUI ############################

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$FastWin10RTStart                = New-Object system.Windows.Forms.Form
$FastWin10RTStart.ClientSize     = New-Object System.Drawing.Point(500,600)
$FastWin10RTStart.text           = "FastWin10RTStart"
$FastWin10RTStart.TopMost        = $false
$FastWin10RTStart.BackColor      = [System.Drawing.ColorTranslator]::FromHtml("#3c3c3c")

$Text                            = New-Object system.Windows.Forms.Label
$Text.text                       = "Basic options"
$Text.AutoSize                   = $true
$Text.width                      = 25
$Text.height                     = 10
$Text.location                   = New-Object System.Drawing.Point(5,5)
$Text.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',24)
$Text.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$ActivateWin                     = New-Object system.Windows.Forms.Button
$ActivateWin.text                = "Activate Windows"
$ActivateWin.width               = 480
$ActivateWin.height              = 35
$ActivateWin.location            = New-Object System.Drawing.Point(8,40)
$ActivateWin.Font                = New-Object System.Drawing.Font('MS PGothic',16)
$ActivateWin.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$ActivateWin.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#4b4b4b")

$FixCam                          = New-Object system.Windows.Forms.Button
$FixCam.text                     = "Fix Camera"
$FixCam.width                    = 480
$FixCam.height                   = 35
$FixCam.location                 = New-Object System.Drawing.Point(8,83)
$FixCam.Font                     = New-Object System.Drawing.Font('MS PGothic',16)
$FixCam.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$FixCam.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$RUlocale                        = New-Object system.Windows.Forms.Button
$RUlocale.text                   = "Add RU locale"
$RUlocale.width                  = 480
$RUlocale.height                 = 35
$RUlocale.location               = New-Object System.Drawing.Point(8,126)
$RUlocale.Font                   = New-Object System.Drawing.Font('MS PGothic',16)
$RUlocale.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$RUlocale.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$DeleteBitLocker                 = New-Object system.Windows.Forms.Button
$DeleteBitLocker.text            = "Delete BitLocker"
$DeleteBitLocker.width           = 480
$DeleteBitLocker.height          = 35
$DeleteBitLocker.location        = New-Object System.Drawing.Point(8,169)
$DeleteBitLocker.Font            = New-Object System.Drawing.Font('MS PGothic',16)
$DeleteBitLocker.ForeColor       = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$DeleteBitLocker.BackColor       = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$DeleteWatermark                 = New-Object system.Windows.Forms.Button
$DeleteWatermark.text            = "Delete Watermark"
$DeleteWatermark.width           = 480
$DeleteWatermark.height          = 35
$DeleteWatermark.location        = New-Object System.Drawing.Point(8,211)
$DeleteWatermark.Font            = New-Object System.Drawing.Font('MS PGothic',16)
$DeleteWatermark.ForeColor       = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$DeleteWatermark.BackColor       = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$FastWin10RTStart                = New-Object system.Windows.Forms.Form
$FastWin10RTStart.ClientSize     = New-Object System.Drawing.Point(500,600)
$FastWin10RTStart.text           = "FastWin10RTStart"
$FastWin10RTStart.TopMost        = $false
$FastWin10RTStart.BackColor      = [System.Drawing.ColorTranslator]::FromHtml("#3c3c3c")

$Text2                           = New-Object system.Windows.Forms.Label
$Text2.text                      = "Install apps and dependencies"
$Text2.AutoSize                  = $true
$Text2.width                     = 25
$Text2.height                    = 10
$Text2.location                  = New-Object System.Drawing.Point(8,257)
$Text2.Font                      = New-Object System.Drawing.Font('MS PGothic',24)
$Text2.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$InstallDependencies             = New-Object system.Windows.Forms.Button
$InstallDependencies.text        = "Install dependencies (required to continue)"
$InstallDependencies.width       = 480
$InstallDependencies.height      = 35
$InstallDependencies.location    = New-Object System.Drawing.Point(8,288)
$InstallDependencies.Font        = New-Object System.Drawing.Font('MS PGothic',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$InstallDependencies.ForeColor   = [System.Drawing.ColorTranslator]::FromHtml("#ff0000")
$InstallDependencies.BackColor   = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$Text3                           = New-Object system.Windows.Forms.Label
$Text3.text                      = "UWP apps"
$Text3.AutoSize                  = $true
$Text3.width                     = 25
$Text3.height                    = 10
$Text3.location                  = New-Object System.Drawing.Point(8,333)
$Text3.Font                      = New-Object System.Drawing.Font('MS PGothic',24)
$Text3.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Text4                           = New-Object system.Windows.Forms.Label
$Text4.text                      = "Win32 apps"
$Text4.AutoSize                  = $true
$Text4.width                     = 25
$Text4.height                    = 10
$Text4.location                  = New-Object System.Drawing.Point(259,333)
$Text4.Font                      = New-Object System.Drawing.Font('MS PGothic',24)
$Text4.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$CoreApps                        = New-Object system.Windows.Forms.Button
$CoreApps.text                   = "Core apps"
$CoreApps.width                  = 230
$CoreApps.height                 = 35
$CoreApps.location               = New-Object System.Drawing.Point(8,365)
$CoreApps.Font                   = New-Object System.Drawing.Font('MS PGothic',16)
$CoreApps.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$CoreApps.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$7z                              = New-Object system.Windows.Forms.Button
$7z.text                         = "7z"
$7z.width                        = 230
$7z.height                       = 35
$7z.location                     = New-Object System.Drawing.Point(260,365)
$7z.Font                         = New-Object System.Drawing.Font('MS PGothic',16)
$7z.ForeColor                    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$7z.BackColor                    = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$Office                          = New-Object system.Windows.Forms.Button
$Office.text                     = "Office apps (Lens, etc.)"
$Office.width                    = 230
$Office.height                   = 35
$Office.location                 = New-Object System.Drawing.Point(8,410)
$Office.Font                     = New-Object System.Drawing.Font('MS PGothic',16)
$Office.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Office.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$IE11                            = New-Object system.Windows.Forms.Button
$IE11.text                       = "Internet Explorer 11"
$IE11.width                      = 230
$IE11.height                     = 35
$IE11.location                   = New-Object System.Drawing.Point(260,410)
$IE11.Font                       = New-Object System.Drawing.Font('MS PGothic',16)
$IE11.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$IE11.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$BingXbox                        = New-Object system.Windows.Forms.Button
$BingXbox.text                   = "Bing and Xbox apps"
$BingXbox.width                  = 230
$BingXbox.height                 = 35
$BingXbox.location               = New-Object System.Drawing.Point(8,455)
$BingXbox.Font                   = New-Object System.Drawing.Font('MS PGothic',16)
$BingXbox.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$BingXbox.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$Notepad                         = New-Object system.Windows.Forms.Button
$Notepad.text                    = "Notepad++"
$Notepad.width                   = 230
$Notepad.height                  = 35
$Notepad.location                = New-Object System.Drawing.Point(260,455)
$Notepad.Font                    = New-Object System.Drawing.Font('MS PGothic',16)
$Notepad.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Notepad.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$Telemetry                       = New-Object system.Windows.Forms.Button
$Telemetry.text                  = "Clear all telemetry"
$Telemetry.width                 = 480
$Telemetry.height                = 35
$Telemetry.location              = New-Object System.Drawing.Point(8,500)
$Telemetry.Font                  = New-Object System.Drawing.Font('MS PGothic',16)
$Telemetry.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Telemetry.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$Restart                         = New-Object system.Windows.Forms.Button
$Restart.text                    = "Apply changes and restart PC"
$Restart.width                   = 340
$Restart.height                  = 35
$Restart.location                = New-Object System.Drawing.Point(7,551)
$Restart.Font                    = New-Object System.Drawing.Font('MS PGothic',16)
$Restart.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Restart.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$Exit                            = New-Object system.Windows.Forms.Button
$Exit.text                       = "Exit"
$Exit.width                      = 130
$Exit.height                     = 35
$Exit.location                   = New-Object System.Drawing.Point(359,551)
$Exit.Font                       = New-Object System.Drawing.Font('MS PGothic',16)
$Exit.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Exit.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#505050")

$FastWin10RTStart.controls.AddRange(@($FixCam,$ActivateWin,$RUlocale,$DeleteBitLocker,$DeleteWatermark,$InstallDependencies,$dependencies,$CoreApps,$7z,$Office,$IE11,$BingXbox,$Notepad,$Telemetry,$Restart,$Exit,$Text,$Text2,$Text3,$Text4))

$ActivateWin.Add_Click({  
})
$FixCam.Add_Click({  
})
$RUlocale.Add_Click({  
})
$DeleteBitLocker.Add_Click({  
})
$DeleteWatermark.Add_Click({  
})
$InstallDependencies.Add_Click({  
})
$CoreApps.Add_Click({  
})
$7z.Add_Click({  
})
$Notepad.Add_Click({  
})
$IE11.Add_Click({  
})
$Office.Add_Click({  
})
$BingXbox.Add_Click({  
})
$Telemetry.Add_Click({  
})
$Restart.Add_Click({  
})
$Exit.Add_Click({ 
})

[void]$FastWin10RTStart.ShowDialog()