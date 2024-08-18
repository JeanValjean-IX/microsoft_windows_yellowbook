# Obtener los adaptadores de red
$netAdapters = Get-NetAdapter
$networkAdapters = Get-WmiObject -Class Win32_NetworkAdapterConfiguration

# Mostrar los datos de cada adaptador de red
foreach ($adapter in $netAdapters) {
    $wmiAdapter = $networkAdapters | Where-Object {$_.Index -eq $adapter.InterfaceIndex}

    Write-Host "Adaptador de red: $($adapter.Name)"
    Write-Host "Descripción: $($adapter.InterfaceDescription)"
    Write-Host "Tipo de interfaz: $($adapter.InterfaceType)"
    Write-Host "Velocidad: $([Math]::Round($adapter.Speed / 1MB, 2)) Mbps"
    Write-Host "Estado: $($adapter.Status)"
    Write-Host "Dirección MAC: $($adapter.MacAddress)"
    Write-Host "GUID: $($adapter.GUID)"
    Write-Host "Índice de interfaz: $($adapter.InterfaceIndex)"
    Write-Host "Nombre de interfaz: $($adapter.InterfaceAlias)"
    Write-Host "Habilitado: $($adapter.Enabled)"
    Write-Host "Recepción de paquetes: $($adapter.ReceiveLinkSpeed) bps"
    Write-Host "Transmisión de paquetes: $($adapter.TransmitLinkSpeed) bps"
    Write-Host "Número de puerto: $($adapter.PortNumber)"
    Write-Host "Número de ranura: $($adapter.SlotNumber)"
    Write-Host "Número de PCI: $($adapter.PciDeviceId)"
    Write-Host "Número de PCI de bus: $($adapter.PciBusNumber)"
    Write-Host "Número de PCI de ranura: $($adapter.PciSlotNumber)"
    Write-Host "Número de PCI de función: $($adapter.PciFunction)"
    Write-Host "Número de PCI de dispositivo: $($adapter.PciDeviceNumber)"
    Write-Host "Número de PCI de subdevice: $($adapter.PciSubDeviceId)"
    Write-Host "Número de PCI de subvendedor: $($adapter.PciSubVendorId)"
    Write-Host "Número de PCI de vendedor: $($adapter.PciVendorId)"
    Write-Host "Número de PCI de revisión: $($adapter.PciRevisionId)"
    Write-Host "Número de PCI de clase: $($adapter.PciClassName)"
    Write-Host "Número de PCI de subclase: $($adapter.PciSubClassName)"
    Write-Host "Número de PCI de progr. de interfaz: $($adapter.PciProgIf)"
    Write-Host "Dirección IP: $($wmiAdapter.IPAddress)"
    Write-Host "Máscara de subred: $($wmiAdapter.IPSubnet)"
    Write-Host "Puerta de enlace predeterminada: $($wmiAdapter.DefaultIPGateway)"
    Write-Host "DHCP habilitado: $($wmiAdapter.DHCPEnabled)"
    Write-Host "Servidor DHCP: $($wmiAdapter.DHCPServer)"
    Write-Host "DNS: $($wmiAdapter.DNSServerSearchOrder)"
    Write-Host "------------------------------"
}