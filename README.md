# Scripts for Defender Live Response

Some usefull scripts for defender live response.

## DefenderAV-DetectionStatus.ps1
### Check antivirus status on a device.

You can get detailed information on detected threat by Windows Defender antivirus.
Information will be printed on screen and saved in text document in ``C:\temp\liveresponse`` that can be easily downloaded.

```
PS> put DefenderAV-DetectionStatus.ps1 -overwrite
PS> run DefenderAV-DetectionStatus.ps1
PS> getfile C:\temp\liveresponse\<file_name>
```

## Defender_PassProtectedArchive.ps1
### Create password protected archive to download potentialy malicious files.

Defender Live Response allows us to download files from the target machine for futher analysis but files downloaded as they are creating potential risk on a devices they are downloaded to. This simple script will take specifc file or folder and with 7-zip will create password protected archive ready for download. Purpose of predefined standard password in this case is to prevent accidental execution of potentialy malicious file, not to maintain archive secrecy.

Script requires 7-zip standalone console version: https://www.7-zip.org/download.html

```
PS> put 7za.exe
PS> put Defender_PassProtectedArchive.ps1
PS> run Defender_PassProtectedArchive.ps1 -parameters "-Source <full_path_to_the_file>
```
