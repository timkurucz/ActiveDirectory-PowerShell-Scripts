# This script will take an input csv file of user logon
# ids and add the listed users to the Active Directory
# specified by the user during input.
# Input file should be formatted with 1 column with
# the header of Username.

Import-Module ActiveDirectory

# Get input information
$csv = Read-Host "Input CSV location"
$adgroup = Read-Host "Which AD Group would you like to add the users to"

# Let user know script is running
Write-Host "Script is running..." -ForegroundColor Yellow

#Add listed users to the AD group
Import-Csv -Path $csv | ForEach-Object { Add-ADGroupMember -Identity $adgroup -Members $_.'Username' }

#Let user know script is finished
""
Write-Host "Reached end of input file." -ForegroundColor Green