# check-last-users-logon
This Script is to give the system admin to check the last time that users connected to the domain.

# show the adress where the file was create
$Path = 'C:\LastLogon.csv'

# call to all users with use the properties to extract the name,ou and time connect
Get-ADUser -Filter * -Properties * | 
Select Name,@{l='OU';e={$_.DistinguishedName.split(',')[1].split('=')[1]}},@{Name="TIME"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('dd-MM-yy')}}

# export to file csv
Export-Csv -Path $Path –notypeinformation
