<#
    .NOTES
    Defender_PassProtectedArchive.ps1
    Anna Lena G.
    v1.0
    
    .SYNOPSIS
    Create password protected archive with 7-zip to safely download suspicious file(s) from target machine.
    Purpose of predefined standard password is to prevent accidental suspicious file execution not to maintain archive secrecy.
    Script requires 7-zip standalone console version: https://www.7-zip.org/download.html 
    
    .EXAMPLE
    PS> put 7za.exe
    PS> put Defender_PassProtectedArchive.ps1
    PS> run Defender_PassProtectedArchive.ps1 -parameters "-Source <full_path_to_the_file>"
#>

param (
    [string]$Source
)

$Password = "infected"
$7zip = "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads"
$OutputPath = "C:\temp\liveresponse"
$Archive = "FileSample-" + $env:computername + "-" + (get-date -f dd-MM-yyyy-hhmm) + ".7z"


# Has user provided full path to the file or directory?
if ([string]::IsNullOrEmpty($Source)) {
    Write-Host '-Source argument was not provided. Exiting.'
    exit
}

# Does this file exist?
if (-not (Test-Path -Path $Source)) {
    Write-Host "File does not exist. Exiting."
    exit
}

# Has user added 7za.exe?
if (-not (Test-Path -Path "$7zip\7za.exe")) {
    Write-Host "Missing 7za.exe. Download it to the device and try again. Exiting."
    exit
}

# If output directory does not exists, make one!
if (-not (Test-Path -Path $OutputPath)) {
    New-Item -Path $OutputPath -ItemType Directory
}

# All good? Let's go!

Write-Host ""
Write-Host "
Creating password protected archive for a file:
$Source
"
Set-Location $7zip
.\7za.exe a -t7z -p"$Password" $OutputPath\$Archive $Source

Write-Host "

Password protected archive is ready:
$OutputPath\$Archive

Download archive with command:
getfile $OutputPath\$Archive

Password: infected
"
