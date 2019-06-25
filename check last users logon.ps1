$Path = 'C:\LastLogon.csv'
Get-ADUser -Filter * -Properties * | 
Select Name,@{l='OU';e={$_.DistinguishedName.split(',')[1].split('=')[1]}},@{Name="TIME"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('dd-MM-yy')}} | Export-Csv -Path $Path –notypeinformation