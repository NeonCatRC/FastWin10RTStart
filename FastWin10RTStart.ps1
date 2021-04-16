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
if (Test-Path -Path $BaseFiles) {write-host "Check" -ForegroundColor Green}
if (Test-Path -Path $DependF) {write-host "Check" -ForegroundColor Green}
if (Test-Path -Path $CERF) {write-host "Check" -ForegroundColor Green}
if (Test-Path -Path $METROapps) {write-host "Check" -ForegroundColor Green}
if (Test-Path -Path $NONuwp) {write-host "Check" -ForegroundColor Green}
else {
Write-error "Missing files!"
While($Downl -notlike "Y"){
 Write-host "Do You want to start download script?"
 $Downl=read-Host "Write Y or N"
 Switch($choose){
  "Y" {$Downl=$choose}
  "N" {Write-host "Choose again"}
  }
 If ($Downl -like "Y") {powershell .\FW10RT_Download_and_Copy.ps1}
 pause
 Exit
 }
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

################### Options ############################
write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Activate Windows?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$act=read-host "Write [Y] or [N]" 

cls

write-host ">===============================================================<" -ForegroundColor Cyan
write-host 
write-host "Fix Camera? (Not need if you install non-clear image)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">===============================================================<" -ForegroundColor Cyan
write-host
$cam=read-host "Write [Y] or [N]" 

cls

write-host ">===============================================================<" -ForegroundColor Cyan
write-host 
write-host "Add RU locale? (Write N, if you install by Zerg_MOS instructions)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">===============================================================<" -ForegroundColor Cyan
write-host
$ru=read-host "Write [Y] or [N]" 

cls

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Disable Watermark? (Write N, if you install by Zerg_MOS instructions)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$water=read-host "Write [Y] or [N]" 

cls

write-host ">===============================================================<" -ForegroundColor Cyan
write-host 
write-host "Disable BitLocker?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">===============================================================<" -ForegroundColor Cyan
write-host
$BitLock=read-host "Write [Y] or [N]" -

cls

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install METRO-apps?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$METRO=read-host "Write [Y] or [N]" -

if ($METRO -like "Y")
{
write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Xbox apps?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$Etc=read-host "Write [Y] or [N]" 

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Office apps? (OneNote, Sway, Lens)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$Office=read-host "Write [Y] or [N]" 

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Bing Apps? (Sports, News, Finance)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$Bing=read-host "Write [Y] or [N]" 

}
cls

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install NON-UWP apps? (Like 7z, Notepad++)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$NONMETRO=read-host "Write [Y] or [N]" 

if ($NONMETRO -like "Y")
{
write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install 7z (not work now UwU)?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$7z=read-host "Write [Y] or [N]" 

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Notepad++" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$Notepad=read-host "Write [Y] or [N]" 

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Internet Explorer?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
$IE=read-host "Write [Y] or [N]" 

cls}

write-host ">====================================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want clear Windows from telemetry and services?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes, start clear script" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">====================================================<" -ForegroundColor Cyan
write-host
$clear=read-host "Write [Y] or [N]" -

cls

#######################Start Fix Shit###############################

#######################camera#######################
switch ($cam){
 "Y"{
 REG ADD "HKLM\SOFTWARE\Microsoft\Windows Media Foundation\Platform" /v "EnableFrameServerMode" /t REG_DWORD /d "00000000" 
 Write-Host "Camera work now!" -ForegroundColor DarkGreen
    }
 "N"{Write-Host "Skip fix camera"}
} 
cls

#######################RU#######################

switch ($ru){
 "Y"{
 REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v OEMCP /d 866
 REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v kbl /d 
 REG ADD "HKU\.DEFAULT\Keyboard Layout\Preload" /v 1 /d 00000409
 REG ADD "HKU\.DEFAULT\Keyboard Layout\Preload" /v 2 /d 00000419
 REG ADD "HKU\.DEFAULT\Keyboard Layout\Preload" /v 3 /d 00000804
 REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\MUI\UILanguages\ru-RU" 
 REG import $BaseFiles\ru.reg
 Write-Host "Ru enabled!" -ForegroundColor DarkGreen
    }
 "N"{write-host "Skip install Russian language"}
 } 

#######################Pagefile#######################

$computersys = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges;
$computersys.AutomaticManagedPagefile = $False;
$computersys.Put();
$pagefile = Get-WmiObject -Query "Select * From Win32_PageFileSetting Where Name like '%pagefile.sys'";
$pagefile.InitialSize = 1024;
$pagefile.MaximumSize = 2047;
$pagefile.Put(); 
Write-Host "Pagefile set!" -ForegroundColor DarkGreen
cls

#######################Import certificate#######################

Import-Certificate -FilePath $CERF\CERbyNeonCat.cer -CertStoreLocation Cert:\LocalMachine\Root
#Import-Certificate -FilePath $CERF\21.cer -CertStoreLocation Cert:\LocalMachine\Root
cls

#######################Activate Win#######################

switch ($act){
 "Y"{
 slmgr /upk //b
 slmgr /skms //b kms9.MSGuides.com
 slmgr /ipk //b NPPR9-FWDCX-D2C8J-H872K-2YT43
 slmgr /ato
 Write-Host "Activated!" -ForegroundColor DarkGreen
    }
 "N"{write-host "Skip activation"}
} 
cls

#######################Delete watermark#######################

switch ($water){
 
 "Y"{
  bcdedit.exe -set TESTSIGNING off
  If (Test-Path -PathType Leaf -Path "c:\windows\system32\ru-RU\shell32.dll.mui") {
  takeown /f "c:\windows\system32\ru-RU\shell32.dll.mui" /r
  icacls c:\windows\system32\ru-RU\shell32.dll.mui /t /grant "Administrators:f"
  Move-Item "c:\windows\system32\ru-RU\shell32.dll.mui" "c:\windows\system32\ru-RU\@shell32.dll.mui" -Force }
  If (Test-Path -PathType Leaf -Path "c:\windows\system32\en-US\shell32.dll.mui") {
  takeown /f "c:\windows\system32\en-US\shell32.dll.mui" /r
  icacls c:\windows\system32\en-US\shell32.dll.mui /t /grant "Administrators:f"
  Move-Item "c:\windows\system32\en-US\shell32.dll.mui" "c:\windows\system32\en-US\@shell32.dll.mui" -Force }
  If (Test-Path -PathType Leaf -Path "c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui") {
  takeown /f "c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui" /r
  icacls c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui /t /grant "Administrators:f"
  Move-Item "c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui" "c:\Windows\Branding\Basebrd\ru-RU\@basebrd.dll.mui" -Force }
  If (Test-Path -PathType Leaf -Path "c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui") {
  takeown /f "c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui" /r
  icacls c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui /t /grant "Administrators:f"
  Move-Item "c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui" "c:\Windows\Branding\Basebrd\en-US\@basebrd.dll.mui" -Force }
  Copy-Item "$WATEROFF\windows\system32\ru-RU\shell32.dll.mui" "c:\windows\system32\ru-RU\shell32.dll.mui" -Force 
  Copy-Item "$WATEROFF\windows\system32\en-US\shell32.dll.mui" "c:\windows\system32\en-US\shell32.dll.mui" -Force 
  Copy-Item "$WATEROFF\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui" "c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui" -Force 
  Copy-Item "$WATEROFF\Windows\Branding\Basebrd\en-US\basebrd.dll.mui" "c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui" -Force 
  mcbuilder
    }
 "N"{
 write-host "Skip disable Watermark" 
    }
} 

#######################Disable LicensinGUI#######################

Switch ($license) {

"True" {
 takeown /f "c:\windows\system32\licensingui.exe" /r
 icacls "c:\windows\system32\licensingui.exe" /t /grant "Administrators:f"
 Move-Item "c:\windows\system32\licensingui.exe" "c:\windows\system32\licensingui00.exe" -Force
 Write-Host "Annoying POPup disabled" -ForegroundColor DarkGreen
 pause
 cls
}
 "False" {
 Write-Host "LicenseGUI already delete!"
 }
}

###################################Install Dependencies###########################################

Write-Host "Start Install Dependencies" 
Add-AppxPackage -Path $DependF\*.Appx
Add-AppxPackage -Path $DependF\*.AppxBundle
DISM.exe /Online /Add-Package /NoRestart /PackagePath:$NONuwp\microsoft-windows-netfx3-ondemand-package.cab
Invoke-Expression -Command "$NONuwp\vcredist_arm.exe"
Write-host "install the Visual C++ package first" -BackgroundColor Red
pause
Write-Host "Success" -ForegroundColor DarkGreen


###################################Install Core-Apps###########################################
Switch ($METRO) {
 "Y" { 
  Write-Host "Start Install METROapps"
  Add-AppxPackage -Path $METROapps\*.Appx
  Add-AppxPackage -Path $METROapps\*.AppxBundle
  If ($Office -like "Y") {Add-AppxPackage -Path $OfficeApps\*.AppxBundle}
  If ($Etc -like "Y") {Add-AppxPackage -Path $EtcApps\*.AppxBundle}
  If ($Bing -like "Y") {Add-AppxPackage -Path $BingApps\*.AppxBundle}
  cls
}
"N" {write-host "Skip intsall METRO-apps"}
}
Switch ($NONMETRO) {
 "Y"{
 If ($7z -like "Y") {& "$NONuwp\7z2002-arm.exe"}
 If ($Notepad -like "Y") {Copy-Item -Path "$NONuwp\Notepad++" -Destination "C:\Program Files\" -Recurse
 $source = "C:\Program Files\Notepad++\notepad++.exe"
 $target = "$home\Desktop\Motepad++.lnk"
 $WorkingDir = "C:\Program Files\Notepad++"
 $WshShell = New-Object -comObject WScript.Shell
 $Shortcut = $WshShell.CreateShortcut($target)
 $Shortcut.WorkingDirectory = $WorkingDir
 $Shortcut.TargetPath = $source
 $Shortcut.Save()}
 If ($IE -like "Y") {DISM.exe /Online /Add-Package /NoRestart /PackagePath:$NONuwp\microsoft-windows-internetexplorer-optional-package.cab}
 }
}
pause
#######################Delete BitLocker#######################

switch ($BitLock){
 "Y"{
 Write-Host "Remove BitLocker" 
 Disable-BitLocker -MountPoint C
 Write-Host "Success" -ForegroundColor DarkGreen
    }
 "N"{
 Write-Host "Skip disable BitLocker"
    }
} 
cls

######################################Clean up###################################################

switch ($clear){
 
 "Y"{
 New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

 Write-Host 'Updating registry settings...'

# Disable some of the "new" features of Windows 10, such as forcibly installing apps you don't want, and the new annoying animation for first time login.
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\' -Name 'CloudContent'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableSoftLanding' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableFirstLogonAnimation' -PropertyType DWord -Value '0' -Force

# Set some commonly changed settings for the current user. The interesting one here is "NoTileApplicationNotification" which disables a bunch of start menu tiles.
New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\' -Name 'PushNotifications'
New-ItemProperty -Path 'HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'NoTileApplicationNotification' -PropertyType DWord -Value '1' -Force
New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\' -Name 'CabinetState'
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState' -Name 'FullPath' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -PropertyType DWord -Value '0' -Force


# Disable Cortana, and disable any kind of web search or location settings.
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\' -Name 'Windows Search'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowSearchToUseLocation' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'DisableWebSearch' -PropertyType DWord -Value '1' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'ConnectedSearchUseWeb' -PropertyType DWord -Value '0' -Force

# Disable data collection and telemetry settings.
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -PropertyType String -Value 'Off' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -PropertyType DWord -Value '0' -Force

# Disable Windows Defender submission of samples and reporting.
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\' -Name 'Spynet'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SpynetReporting' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SubmitSamplesConsent' -PropertyType DWord -Value '2' -Force

# Ensure updates are downloaded from Microsoft instead of other computers on the internet.
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\' -Name 'DeliveryOptimization'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Name 'DODownloadMode' -PropertyType DWord -Value '0' -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Name 'SystemSettingsDownloadMode' -PropertyType DWord -Value '0' -Force
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\' -Name 'Config'
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config' -Name 'DODownloadMode' -PropertyType DWord -Value '0' -Force

Write-Host 'Disabling services...'
$services = @(
   
    # Connected User Experiences and Telemetry
    'DiagTrack',

    # Data Usage service
    'DusmSvc',

    # Peer-to-peer updates
    'DoSvc',

    # AllJoyn Router Service (IoT)
    'AJRouter',

    # SSDP Discovery (UPnP)
    'SSDPSRV',
    'upnphost',

    # Superfetch
    'SysMain',

    # http://www.csoonline.com/article/3106076/data-protection/disable-wpad-now-or-have-your-accounts-and-private-data-compromised.html
    'iphlpsvc',
    'WinHttpAutoProxySvc',

    # Black Viper 'Safe for DESKTOP' services.
    # See http://www.blackviper.com/service-configurations/black-vipers-windows-10-service-configurations/
    'tzautoupdate',
    'RemoteRegistry',
    'shpamsvc',
    'SCardSvr',
    'ALG',
    'dmwappushservice',
    'MapsBroker',
    'lfsvc',
    'SharedAccess',
    'SmsRouter',
    'CscService',
    'SEMgrSvc',
    'PhoneSvc',
    'RpcLocator',
    'RetailDemo',
    'SensorDataService',
    'SensrSvc',
    'SensorService',
    'ScDeviceEnum',
    'SCPolicySvc',
    'SNMPTRAP',
    'FrameServer',
    'wisvc',
    'icssvc',
    'WinRM',
    'WwanSvc',
    'XblAuthManager',
    'XblGameSave',
    'XboxNetApiSvc'
)
foreach ($service in $services) {
    Set-Service $service -StartupType Disabled
}

# Disables all of the known enabled-by-default optional features. There are some particulary bad defaults like SMB1. Sigh.
Write-Host 'Disabling optional features...'
$features = @(
    'SMB1Protocol',
    'WorkFolders-Client',
    'Printing-Foundation-Features',
    'Printing-PrintToPDFServices-Features',
    'Printing-XPSServices-Features',
    'MSRDC-Infrastructure'
    )
foreach ($feature in $features) {
    Disable-WindowsOptionalFeature -Online -FeatureName $feature -NoRestart
}
Write-Host "Goodbye"
pause
Restart-Computer -Force
    }
 
 "N"{
 Write-Host "You choose dont clear services"
 Write-Host "Goodbye"
 Restart-Computer -Force
    }
} 

# https://github.com/NeonCatRC/FastWin10RTStart