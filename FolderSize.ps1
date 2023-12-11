##Parameters
$source = "\\servers\D$\"
$destination = "\\rcdc01\D$\"

$folders = 'Quickbooks', 'Users', 'Company'

##get-childitem -path c:\images | measure-object -Property Length -Sum

foreach ($folder in $folders) {
    $source_folder = $source + $folder
    $size = get-childitem -path $source_folder | measure-object -Property Length -Sum
    Write-Host $size
    }