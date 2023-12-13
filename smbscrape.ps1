$info = get-computerinfo

$report = "$pwd\Report.txt"

$reportname = 'SMB Share Report'

$compname = 'Computer Name: ' + $info.CsName

$reportname >> $report



$compname >> $report

$shares = get-smbshare | where-object -property Name -notlike "*$" >> $report
$adminshares = get-smbshare | where-object -property Name -like "*$" >> $report