setlocal enableextensions
Write-Host "SET (A)" -ForegroundColor red
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

# Папка Зависимостей
$DependF = "$PSScriptRoot\Files\dependencies"

# Папка сертификатов
$CERF = "$PSScriptRoot\Files\Cert"

# Папка отключения WaterMarkи
$WATEROFF = "$PSScriptRoot\Files\LP"

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
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$act=read-host
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
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$ru=read-host
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
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$water=read-host
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
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$METRO=read-host
cls

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
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$Etc=read-host
cls

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Office apps? (OneNote, Sway, Lens)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$Office=read-host
cls

write-host ">=============================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want install Bing Apps? (Sports, News, Finance)" -ForegroundColor Cyan
write-host 
write-host "Y. Yes" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">=============================================<" -ForegroundColor Cyan
write-host
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$Bing=read-host
cls
}

write-host ">====================================================<" -ForegroundColor Cyan
write-host 
write-host "Do you want clear Windows from telemetry and services?" -ForegroundColor Cyan
write-host 
write-host "Y. Yes, start clear script" -ForegroundColor Green
write-host "N. No" -ForegroundColor Red
write-host 
write-host ">====================================================<" -ForegroundColor Cyan
write-host
write-host "Write [Y] or [N]" -ForegroundColor Cyan

$clear=read-host
cls

#######################Start Fix Shit###############################

REG ADD "HKLM\SOFTWARE\Microsoft\Windows Media Foundation\Platform" /v "EnableFrameServerMode" /t REG_DWORD /d "00000000" 
Write-Host "Camera work now!" -ForegroundColor DarkGreen
cls

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
 "N"{
 write-host "Skip install Russian language"
    }
} 

$computersys = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges;
$computersys.AutomaticManagedPagefile = $False;
$computersys.Put();
$pagefile = Get-WmiObject -Query "Select * From Win32_PageFileSetting Where Name like '%pagefile.sys'";
$pagefile.InitialSize = 1024;
$pagefile.MaximumSize = 2047;
$pagefile.Put(); 
Write-Host "Pagefile set!" -ForegroundColor DarkGreen
cls

Import-Certificate -FilePath $CERF\CERbyNeonCat.cer -CertStoreLocation Cert:\LocalMachine\Root
#Import-Certificate -FilePath $CERF\21.cer -CertStoreLocation Cert:\LocalMachine\Root
cls

switch ($act){
 "Y"{
 slmgr /upk //b
 slmgr /skms //b kms9.MSGuides.com
 slmgr /ipk //b NPPR9-FWDCX-D2C8J-H872K-2YT43
 slmgr /ato
 Write-Host "Activated!" -ForegroundColor DarkGreen
    }
 "N"{
 write-host "Skip activation" 
    }
} 
cls

#Отключение Вотермарки
switch ($water){
 
 "Y"{
 bcdedit.exe -set TESTSIGNING off
 takeown /f c:\windows\system32\ru-RU\shell32.dll.mui
 takeown /f c:\windows\system32\en-US\shell32.dll.mui
 takeown /f c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui
 takeown /f c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui
 icacls c:\windows\system32\ru-RU\shell32.dll.mui /t /grant Administrators:(f)
 icacls c:\windows\system32\en-US\shell32.dll.mui /t /grant Administrators:(f)
 icacls c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui /t /grant Administrators:(f)
 icacls c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui /t /grant Administrators:(f)
 move c:\windows\system32\ru-RU\shell32.dll.mui c:\windows\system32\ru-RU\@shell32.dll.mui 
 move c:\windows\system32\en-US\shell32.dll.mui c:\windows\system32\en-US\@shell32.dll.mui 
 copy $WATEROFF\windows\system32\ru-RU\shell32.dll.mui c:\windows\system32\ru-RU\shell32.dll.mui
 copy $WATEROFF\windows\system32\en-US\shell32.dll.mui c:\windows\system32\en-US\shell32.dll.mui
 move c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui c:\Windows\Branding\Basebrd\ru-RU\@basebrd.dll.mui
 move c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui c:\Windows\Branding\Basebrd\en-US\@basebrd.dll.mui
 copy $WATEROFF\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui c:\Windows\Branding\Basebrd\ru-RU\basebrd.dll.mui
 copy $WATEROFF\Windows\Branding\Basebrd\en-US\basebrd.dll.mui c:\Windows\Branding\Basebrd\en-US\basebrd.dll.mui
 mcbuilder
exit
    }
 "N"{
 write-host "Skip disable Watermark" 
    }
} 

takeown /f c:\windows\system32\licensingui.exe
icacls c:\windows\system32\licensingui.exe /t /grant Administrators
move c:\windows\system32\licensingui.exe c:\windows\system32\licensingui00.exe 
Write-Host "Annoying POPup disabled" -ForegroundColor DarkGreen
pause
cls

###################################Install Core-Apps###########################################

Write-Host "Start Install Dependencies" 
Add-AppxPackage -Path $DependF\*.Appx
Add-AppxPackage -Path $DependF\*.AppxBundle
Write-Host "Success" -ForegroundColor DarkGreen
cls

Switch ($METRO) {
 "Y" { 
Write-Host "Start Install METROapps"
Add-AppxPackage -Path $METROapps\*.Appx
Add-AppxPackage -Path $METROapps\*.AppxBundle
  
  If ($Office -like "Y") {
  Add-AppxPackage -Path $OfficeApps\*.AppxBundle
  }

  If ($Etc -like "Y") {
  Add-AppxPackage -Path $EtcApps\*.AppxBundle
  }

  If ($Bing -like "Y") {
  Add-AppxPackage -Path $BingApps\*.AppxBundle
  }
cls
 }
"N" {
write-host "Skip intsall METRO-apps"
 }
}

######################################Clean up###################################################

#Write-Host "Remove BitLocker" 
#Remove-BitLockerKeyProtector -MountPoint "C:"
#Write-Host "Success" -ForegroundColor DarkGreen

if ($clear -like "Y" -or $clear -like "N") {
    write-host "Hm..."
    cls
}
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
    # See https://virtualfeller.com/2017/04/25/optimize-vdi-windows-10-services-original-anniversary-and-creator-updates/

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
start cmd {shutdown /r}
    }
 
 "N"{
 Write-Host "You choose dont clear services"
 Write-Host "Goodbye"
 start cmd {shutdown /r}
    }
}