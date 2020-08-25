# This script will take an input csv file and query
# Active Directory for the logon account and return
# properties for that account if found.
# Input file should be formatted with 1 column with
# the header of Username.

Import-Module ActiveDirectory

# Get input and output information
$input = Read-Host "Input CSV location"
$output = Read-Host "Output CSV location"
$outputName = "AccountLookup_Output_$(get-date -f yyyy-MM-dd_HHmm)"

# Load in CSV file and run through each row
ForEach ($user in (Import-Csv -Path $input)) {
    $username = $user.username
    Write-Host "Looking for $username in Active Directory..." -ForegroundColor Yellow
    
    # If found, let user know in command window and log to output file
    if ([bool] (Get-ADUser -Filter { samAccountName -eq $username })) {
        Get-ADUser -Filter { samAccountName -eq $username } -Properties samAccountName, Mail, Enabled, physicalDeliveryOfficeName, st, c | Select-Object Name, samAccountName, Mail, Enabled, physicalDeliveryOfficeName, st, c  | Export-Csv -Path "$output\$outputName.csv" -NoTypeInformation -Append
        Write-Host "Found $username in Active Directory!" -ForegroundColor Green
    }
    else {
        Write-Host "Could not find $username in Active Directory." -ForegroundColor Red
    }
}
""
Write-Host "Reached end of input file." -ForegroundColor Green
Write-Host "Output file can be found here: $outputPath\$outputName.csv" -ForegroundColor Green