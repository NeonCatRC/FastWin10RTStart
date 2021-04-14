if (Test-Path -Path "$PSScriptRoot\Bin") { write-host "Folder check" -ForegroundColor Green }
if (Test-Path -Path "$PSScriptRoot\Bin\wget") {write-host "Folder check" -ForegroundColor Green}
if (Test-Path -Path "$PSScriptRoot\Bin\7z") {write-host "Folder check" -ForegroundColor Green}
if (Test-Path -PathType Leaf -Path "$PSScriptRoot\Bin\7z\7z.exe") {write-host "7z here" -ForegroundColor Green}
if (Test-Path -PathType Leaf -Path "$PSScriptRoot\Bin\wget\wget.exe") {write-host "wget here" -ForegroundColor Green}
else {write-error "Missing important files! Check files!" 
pause
Exit}

$ARCH = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match ‘(x86)’
 if ($var = "True") {

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Download_and_Copy               = New-Object system.Windows.Forms.Form
$Download_and_Copy.ClientSize    = New-Object System.Drawing.Point(433,163)
$Download_and_Copy.text          = "Download and Copy for WRT3"
$Download_and_Copy.TopMost       = $false
$Download_and_Copy.BackColor     = [System.Drawing.ColorTranslator]::FromHtml("#4d4d4d")

$text                            = New-Object system.Windows.Forms.Label
$text.text                       = "If you need to copy or download files for my script, please, use this util"
$text.AutoSize                   = $true
$text.width                      = 25
$text.height                     = 10
$text.location                   = New-Object System.Drawing.Point(2,8)
$text.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$text.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "DOWNLOAD FILES"
$Button1.width                   = 425
$Button1.height                  = 40
$Button1.location                = New-Object System.Drawing.Point(3,33)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#f5f3f3")

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "COPY ON USB DRIVE"
$Button2.width                   = 425
$Button2.height                  = 40
$Button2.location                = New-Object System.Drawing.Point(3,87)
$Button2.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button2.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#f8f8f8")

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 100
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(134,167)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Download_and_Copy.controls.AddRange(@($TextBox1,$text,$Button1,$Button2))

$Button1.Add_Click({ 
If (Test-Path -PathType Leaf -Path "$PSScriptRoot\FilesWRT3.zip" ) {& "$PSScriptRoot\Bin\7z\7z.exe" x "$PSScriptRoot\FilesWRT3.zip"} 
else {& "$PSScriptRoot\Bin\wget\wget.exe" --no-check-certificate -i "$PSScriptRoot\Download.txt" -P "$PSScriptRoot\" -nc} 
If (Test-Path -PathType Leaf -Path "$PSScriptRoot\Files") {& "$PSScriptRoot\Bin\7z\7z.exe" x "$PSScriptRoot\FilesWRT3.zip"}})

$Button2.Add_Click({ 
While($ny -notlike "Y"){
Write-host "Please write the drive LETTER below where you want to copy the files" -ForegroundColor Red
$Destination=read-host
Write-host "Are you sure you want to copy the files to disk $Destination ?"
Write-host "Write Y or N"
$choose=read-host
Switch($choose){
"Y" {$ny=$choose}
"N" {Write-host "Choose again"}}
}
If ($ny -like "Y") {
#Copy-Item -Path "$PSScriptRoot\Files" -Destination $Destination:\FastWin10RTStart -Verbose -Force -Recurce
#Copy-Item -Path "$PSScriptRoot\FastWin10RTStart.ps1" -Destination $Destination:\FastWin10RTStart -Verbose -Force
}})

#Write your logic code here

[void]$Download_and_Copy.ShowDialog()
}
else {
	Write-host "Sorry, only for x86 systems"
	pause
	exit
}



