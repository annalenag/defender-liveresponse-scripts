<#
	.NOTES
	DefenderAV-DetectionStatus.ps1
	Anna Lena G.
	v1.0
	
	.SYNOPSIS
	Script returns Defender Antivirus threat detection status.
	It is intended to use with Defender XDR LiveResponse console to investigate active malware alerts.
	Status is displayed in the console as well as is being written to the file that can downloaded.
	
	.EXAMPLE
	PS> put DefenderAV-DetectionStatus.ps1 -overwrite
	PS> run DefenderAV-DetectionStatus.ps1
	
#>

Write-Host "
Defender AV Detection status, v1.0

Working...
"

$output_path = "C:\temp\liveresponse"
$filename = "AV-Status--" + $env:computername + "--" + (get-date -f dd-MM-yyyy-hhmm) + ".txt"

Write-Host -fore Green "

AV DETECTION STATUS:
"

$AV_status = Get-MpThreatDetection 
Write-Output $AV_status


# Create output path if it doesn't exist
if (-Not (Test-Path -Path $output_path)) {
  New-Item -Path $output_path -ItemType Directory
}
Out-File -FilePath $output_path\$filename -InputObject $AV_status -Append

Write-Host "

Status saved to file:
$output_path\$filename

Download file:
getfile $output_path\$filename
"
