$systemDrive = [Environment]::GetFolderPath("System")
$drive = Get-PSDrive -PSProvider FileSystem | Where-Object {$_.Root -eq $systemDrive}
Disable-BitLocker -MountPoint $drive.Root -ForceDetach
Get-BitLockerVolume -MountPoint $drive.Root
