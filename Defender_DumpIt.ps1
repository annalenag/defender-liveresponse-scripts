<#
	.NOTES
	Defender_DumpIt.ps1
	Anna Lena G.
	v1.0
	
	.SYNOPSIS
	Script creates RAM dump with DumpIt.exe from the Defender Live Response console.
	
	.EXAMPLE
	PS> put Defender_DumpIt.ps1 -overwrite
	PS> run Defender_DumpIt.ps1
	
#>
Write-Host "
RAM dump with DumpIt, v1.0

Working...
"

$output_path = "C:\temp\response"
$filename = "RAM_DUMP--" + $env:computername + "--" + (get-date -f dd-MM-yyyy-hhmm) + ".dmp"

Write-Host -fore Green "

RAM Dump:
"

# Create output path if it doesn't exist
if (-Not (Test-Path -Path $output_path)) {
  New-Item -Path $output_path -ItemType Directory
}

./DumpIt.exe /quiet /NOCOMPRESS /output $output_path\$filename

Write-Host "

RAM dump saved into:
$output_path\$filename
"