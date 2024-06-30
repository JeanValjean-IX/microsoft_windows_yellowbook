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
