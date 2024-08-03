param (
    [string]$folderPath = ""
)
$GodModefolder = "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
$fullFolderPath = Join-Path -Path $folderPath -ChildPath $GodModefolder
if (-Not (Test-Path -Path $GodModefolder)) {
    New-Item -Path $fullFolderPath -ItemType Directory
    Write-Host "GodMode folder created"
} else {
    Write-Host "GodMode folder already exists"
}
