if (Test-Path -Path "$PSScriptRoot\Bin") { write-host "Folder check" -ForegroundColor Green }
if (Test-Path -Path "$PSScriptRoot\Bin\wget") {write-host "Folder check" -ForegroundColor Green}
if (Test-Path -Path "$PSScriptRoot\Bin\7z") {write-host "Folder check" -ForegroundColor Green}
if (Test-Path -Path "$PSScriptRoot\Bin\wget-arm") {write-host "Folder check" -ForegroundColor Green} ####
if (Test-Path -Path "$PSScriptRoot\Bin\7z-arm") {write-host "Folder check" -ForegroundColor Green}
if (Test-Path -PathType Leaf -Path "$PSScriptRoot\Bin\7z\7z.exe") {write-host "7z here" -ForegroundColor Green}
if (Test-Path -PathType Leaf -Path "$PSScriptRoot\Bin\wget\wget.exe") {write-host "wget here" -ForegroundColor Green}
if (Test-Path -PathType Leaf -Path "$PSScriptRoot\Bin\7z-arm\7z.exe") {write-host "7z-arm here" -ForegroundColor Green}
if (Test-Path -PathType Leaf -Path "$PSScriptRoot\Bin\wget-arm\wget.exe") {write-host "wget-arm here" -ForegroundColor Green}####
else {
  write-error "Missing important files! Check files!" 
  pause
  Exit  
}

#checking OS version
$CPUall=(Get-WmiObject win32_processor | Where-Object{$_.deviceID -eq "CPU0"}).Caption
If ($CPUall -match "ARM") {$OSarc="ARM"
  Write-host "Processor= ARM"} 
else {$OSarc="x86"
  Write-host "Processor= x86"}

 write-host ">========================================================<" -ForegroundColor Cyan
 write-host "     Hi, that is download script for FastWin10RTStart" -ForegroundColor Cyan
 write-host "              Thanks for using my stuff" -ForegroundColor Cyan
 write-host "               Script made by NeonCatRC" -ForegroundColor Cyan
 write-host "                Used programs:wget, 7z" -ForegroundColor Cyan
 write-host "If you want to say 'Thank you'- join OpenRT discord server" -ForegroundColor DarkGreen
 write-host "          Here it is: https://discord.gg/tAxvvVC" -ForegroundColor Cyan
 write-host ">========================================================<" -ForegroundColor Cyan
 pause
 Clear-Host
 
 While ($choose -notlike "3") {
	    write-host ">=============================================<" -ForegroundColor Cyan
      write-host 
      write-host "What do you want to do?" -ForegroundColor Cyan
      write-host 
      write-host "1. Download files for core script" -ForegroundColor Green
      write-host "2. Copy files on your USB drive (not working now)" -ForegroundColor Green
      write-host "3. Exit" -ForegroundColor Red
      write-host 
      write-host ">=============================================<" -ForegroundColor Cyan
      write-host
      $choose=read-host "Write '1','2' or '3'"
      Clear-Host
    Switch ($choose){
        1 {write-host "Start download. Please, dont close powershell session" -ForegroundColor Red
          Switch ($OSarc) {
            'ARM' {$testZIP=Test-Path -PathType Leaf -Path "$PSScriptRoot\FilesWRT3.zip"
            If ($testZIP -like "False") {& "$PSScriptRoot\Bin\wget-arm\wget.exe" --no-check-certificate -i "$PSScriptRoot\Download.txt" -P "$PSScriptRoot\" -nc} 
            If (Test-Path -PathType Leaf -Path "$PSScriptRoot\Files") {& "$PSScriptRoot\Bin\7z-arm\7z.exe" x "$PSScriptRoot\FilesWRT3.zip"}
          }
          'x86' {
            $testZIP=Test-Path -PathType Leaf -Path "$PSScriptRoot\FilesWRT3.zip"
            If ($testZIP -like "False") {& "$PSScriptRoot\Bin\wget\wget.exe" --no-check-certificate -i "$PSScriptRoot\Download.txt" -P "$PSScriptRoot\" -nc} 
            If (Test-Path -PathType Leaf -Path "$PSScriptRoot\Files") {& "$PSScriptRoot\Bin\7z\7z.exe" x "$PSScriptRoot\FilesWRT3.zip"}
            }
          }
         }  
        2 {While($ny2 -notlike "Y"){
          Write-host "Please write the drive LETTER below where you want to copy the files" -ForegroundColor Red
          $Destination=read-host "Write disk letter"
          Write-host "Are you sure you want to copy the files to disk $Destination ?"
          $choose2=read-host "Write Y or N"
          Switch($choose2){
            "Y" {$ny2=$choose2}
            "N" {Write-host "Choose again"}
          }
        }
        If ($ny2 -like "Y") {
        robocopy "$PSScriptRoot\Files" "'$Destination':\FastWin10RTStart"
        robocopy "$PSScriptRoot\FastWin10RTStart.ps1" "'$Destination':\FastWin10RTStart"
      }
    }
    3 {Write-host "Goodbye"
     pause
     Exit}
    }
  }
   

 