# This script will take an Active Directory group
# name from a user input and return all users that
# that belong to the given Active Directory group.

Import-Module ActiveDirectory

#Get AD group for user
$adGroup = Read-Host "Enter AD Group"

#Get output information
$output = Read-Host "Output CSV location"
$outputName = "$adGroup Users_$(get-date -f yyyy-MM-dd_HHmm)"

#Let user know script is running
Write-Host "Script running..." -ForegroundColor Yellow

#Search for group in AD and return user values
Get-ADGroupMember $adGroup | Where-Object { $_.objectclass -eq 'user' } | Get-ADUser -Properties Displayname, samAccountName, Mail, Office, Enabled, CanonicalName | Select-Object Name, samAccountName, Displayname, Mail, Office, Enabled, CanonicalName | Export-csv -Path "$output\$outputName.csv" -NoTypeInformation -Append

#Let user know script is finished
Write-Host "Reached end of input file." -ForegroundColor Green
Write-Host "Output file can be found here: $outputPath\$outputName.csv" -ForegroundColor Green