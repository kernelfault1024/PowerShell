##Parameters
$source = "\\server\D$\ServerFolders\"
$destination = "\\rcdc01\D$\"

$folders = 'Quickbooks', 'Users', 'Company'

##get-childitem -path c:\images | measure-object -Property Length -Sum

Write-Host Source
foreach ($folder in $folders) {
    $source_folder = $source + $folder
    $size = (get-childitem -path $source_folder -recurse -file | measure-object -Property Length -Sum).Sum 
    Write-Host $Folder $size
    }
Write-Host Destination
foreach ($folder in $folders) {
    $destination_folder = $destination + $folder
    $size = (get-childitem -path $destination_folder -recurse -file | measure-object -Property Length -Sum).Sum 
    Write-Host $Folder $size
    }