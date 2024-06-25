$systemDrive = (Get-BitLockerVolume | Where {$_.VolumeType -eq "OperatingSystem"}).MountPoint 
Write-Output "Volumen de sistema: $systemDrive"
Enable-BitLocker -MountPoint "$systemDrive" -RecoveryPasswordProtector
