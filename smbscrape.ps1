$info = get-computerinfo

$date = Get-Date
$formatdate = $date.tostring('yyyyMMdd_HHmmss')

$report = "$pwd\SMBReport$formatdate.txt"

$reportname = 'SMB Share Report'

$compname = 'Computer Name: ' + $info.CsName

$reportname >> $report



$compname >> $report

get-smbshare | where-object -property Name -notlike "*$" >> $report
get-smbshare | where-object -property Name -like "*$" >> $report