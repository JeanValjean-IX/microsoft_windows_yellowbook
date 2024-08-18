# Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, VlanID
# Obtener información detallada de las targetas de red del equipo
# Alternativa con NetAdapter para obtener información detallada del adaptador si está disponible

$netAdapters = Get-NetAdapter

foreach ($adapter in $netAdapters) {
    Write-Host "------------------------------------------------------"
    Write-Host "Name        : $($adapter.Name)"
    Write-Host "Description : $($adapter.InterfaceDescription)"
    Write-Host "Status      : $($adapter.Status)"
    Write-Host "Link Speed  : $($adapter.LinkSpeed)"
    Write-Host "Mac Address : $($adapter.MacAddress)"
    Write-Host "VLAN ID     : $($adapter.VlanID)"
}
