##Parameters
##Make sure the source and destination paths have a \ at the end
$source = "C:\source\"
$destination = "C:\Destination\"

$folders = 'QB', 'IIS'

##get-childitem -path c:\images | measure-object -Property Length -Sum

Write-Host Source
Write-Host ======

foreach ($folder in $folders) {
    $source_folder = $source + $folder
    $size = (get-childitem -path $source_folder -recurse -file | measure-object -Property Length -Sum).Sum
    $count = (get-childitem -path $destination_folder -recurse -file | measure-object -Property Length -Sum).count
    ##$sizemb = $size / 1024
    Write-Host $Folder $size KB $count Files
    ##$sourcearrayname += $source_folder
    ##$sourcearraysize += $size
    }
Write-Host
Write-Host Destination
Write-Host ======
foreach ($folder in $folders) {
    $destination_folder = $destination + $folder
    $size = (get-childitem -path $destination_folder -recurse -file | measure-object -Property Length -Sum).Sum
    $count = (get-childitem -path $destination_folder -recurse -file | measure-object -Property Length -Sum).count
    ##$sizemb = $size / 1024
    Write-Host $Folder $size KB $count Files
    ##$DestArrayName.Add($destination_folder )
    ##$DestArraySize.Add($size)
    }