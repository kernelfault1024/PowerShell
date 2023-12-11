##Join pc to the domain
Add-Computer -DomainName ReinerChiro.local -Credential ReinerChiro\oit -Verbose -Restart -Force
##Install ADDS feature
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
##Install as a domain controller, make sure the oit account is an enterprise admin
Install-ADDSDomainController -DomainName 'ReinerChiro.local' -InstallDns -Credential (Get-Credential 'ReinerChiro\oit') -SafeModeAdministratorPassword (Get-Credential 'SafeModeAdministratorPassword').Password -NoRebootOnCompletion:$false



##Install DNS
Install-WindowsFeature DNS -IncludeManagementTools

##Install DHCP
Install-WindowsFeature DHCP -IncludeManagementTools
##Add DHCP Scope
Add-DhcpServerv4Scope -Name Scope01 -StartRange 192.168.1.100 -EndRange 192.168.1.200 -SubnetMask 255.255.255.0
##Run to get scope ID
Get-DhcpServerv4Scope
##Configure Scope options
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -DnsDomain ReinerChiro.local -DnsServer 192.168.1.2 -Router 192.168.1.254
##Add DHCP server to AD and authorize it
Add-DhcpServerInDC -DnsName host.domain.local -IPAddress 192.168.20.10

## install printer services
Install-WindowsFeature -Name Print-Server -IncludeManagementTools