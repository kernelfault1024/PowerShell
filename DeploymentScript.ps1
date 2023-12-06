##AD DS install and join to existing domain
Add-Computer -DomainName ReinerChiro.local -Credential ReinerChiro\oit -Verbose -Restart -Force

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -DomainName 'ReinerChiro.local' -InstallDns -Credential (Get-Credential 'ReinerChiro\oit') -SafeModeAdministratorPassword (Get-Credential 'SafeModeAdministratorPassword').Password -NoRebootOnCompletion:$false




Install-WindowsFeature DNS -IncludeManagementTools
Install-WindowsFeature DHCP -IncludeManagementTools