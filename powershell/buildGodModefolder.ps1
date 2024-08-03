$folder = "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
if (-Not (Test-Path -Path $folder)) {
    # Create the GodMode folder
    New-Item -Path $folder -ItemType Directory
    Write-Host "GodMode folder created"
} else {
    Write-Host "GodMode folder already exists"
}
