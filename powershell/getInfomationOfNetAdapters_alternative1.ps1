# Obtener información detallada de las targetas de red del equipo

$networkAdapters = Get-WmiObject -Class Win32_NetworkAdapterConfiguration

foreach ($adapter in $networkAdapters) {
    Write-Host "---------------------------------"
    Write-Host "Nombre          : $($adapter.Description)"
    Write-Host "MAC Address     : $($adapter.MACAddress)"
    Write-Host "DHCP Habilitado : $($adapter.DHCPEnabled)"
    Write-Host "IP Address      : $($adapter.IPAddress)"
    Write-Host "Subnet Mask     : $($adapter.IPSubnet)"
    Write-Host "Default Gateway : $($adapter.DefaultIPGateway)"
    Write-Host "DNS Servers     : $($adapter.DNSServerSearchOrder)"
    Write-Host "VLAN ID         : $($adapter.SettingID)" # Este campo puede no reflejar la VLAN directamente
}
