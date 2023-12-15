$info = get-computerinfo

$memory = [math]::round($info.CsTotalPhysicalMemory / 1Gb)

Write-Host OS Version: $info.WindowsProductName
Write-Host Manufacturer: $info.CsManufacturer
Write-Host Computer Name: $info.CsName
Write-Host Physical Processors: $info.CsNumberOfProcessors
Write-Host Logical Processors: $info.CsNumberOfLogicalProcessors
Write-Host Physicam Memory: $memory GB