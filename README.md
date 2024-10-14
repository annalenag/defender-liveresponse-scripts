# Scripts for Defender Live Response

Some usefull scripts for defender live response.

## DefenderAV-DetectionStatus.ps1
### Check antivirus status on a device.

You can get detailed information on detected threat by Windows Defender antivirus.
Information will be printed on screen and saved in text document in ´´C:\temp\liveresponse´´ that can be easily downloaded.

´´´
PS> put DefenderAV-DetectionStatus.ps1 -overwrite
PS> run DefenderAV-DetectionStatus.ps1
PS> getfile C:\temp\liveresponse\<file_name>

´´´
