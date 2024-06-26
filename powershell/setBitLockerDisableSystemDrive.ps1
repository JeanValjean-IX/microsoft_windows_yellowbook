$systemDrive = (Get-BitLockerVolume | Where {$_.VolumeType -eq "OperatingSystem"}).MountPoint
Write-Output "Volumen de sistema: $systemDrive"
$BitLockerStatus = Get-BitLockerVolume -MountPoint $systemDrive
Disable-BitLocker -MountPoint "$systemDrive"
$BitLockerStatus = Get-BitLockerVolume -MountPoint $systemDrive
if ($BitLockerStatus.ProtectionStatus -eq 'On') {
    Write-Host "Iniciando la desencriptación..."
    Unlock-BitLocker -MountPoint $SystemDrive
} else {
    Write-Host "BitLocker deshabilitado o unidad de sistema no cifrada."
}
$DecryptionStatus = Get-BitLockerVolume -MountPoint $systemDrive
if ($DecryptionStatus.VolumeStatus -eq 'FullyDecrypted') {
    Write-Host "La unidad del sistema ya está completamente desencriptada."
} else {
    Write-Host "Esperando a que la desencriptación finalice. Esto puede tardar algún tiempo..."
    while ($DecryptionStatus.VolumeStatus -ne 'FullyDecrypted') {
        Start-Sleep -Seconds 60
        $DecryptionStatus = Get-BitLockerVolume -MountPoint $systemDrive
        Write-Host "Progreso -> $($DecryptionStatus.EncryptionPercentage)%"
    }
    Write-Host "Desencriptación completada."
}
Write-Host "BitLocker deshabilitado y unidad de sistema desencriptada."
