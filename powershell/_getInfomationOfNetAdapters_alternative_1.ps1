# Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, VlanID

# Obtener información detallada de las targetas de red del equipo
$networkAdapters = Get-WmiObject -Class Win32_NetworkAdapterConfiguration

foreach ($adapter in $networkAdapters) {
    Write-Host "---------------------------------"
    Write-Host "Nombre: $($adapter.Description)"
    Write-Host "MAC Address: $($adapter.MACAddress)"
    Write-Host "DHCP Habilitado: $($adapter.DHCPEnabled)"
    Write-Host "IP Address: $($adapter.IPAddress)"
    Write-Host "Subnet Mask: $($adapter.IPSubnet)"
    Write-Host "Default Gateway: $($adapter.DefaultIPGateway)"
    Write-Host "DNS Servers: $($adapter.DNSServerSearchOrder)"
    Write-Host "VLAN ID: $($adapter.SettingID)" # Este campo puede no reflejar la VLAN directamente
}

# Alternativa: Usar NetAdapter para obtener información detallada del adaptador si está disponible
$netAdapters = Get-NetAdapter

foreach ($adapter in $netAdapters) {
    Write-Host "---------------------------------"
    Write-Host "Name: $($adapter.Name)"
    Write-Host "Interface Description: $($adapter.InterfaceDescription)"
    Write-Host "Status: $($adapter.Status)"
    Write-Host "Link Speed: $($adapter.LinkSpeed)"
    Write-Host "Mac Address: $($adapter.MacAddress)"
    Write-Host "VLAN ID: $($adapter.VlanID)" # Este campo puede no estar disponible en todos los adaptadores
}

