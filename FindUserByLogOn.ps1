Import-Module ActiveDirectory

$time = Get-Date -Format "MM-dd-yyyy_HH:mm K"
$input = Read-Host "Input CSV location"
$output = Read-Host "Output CSV location"
$outputName = "AccountLookup_Output_$(get-date -f yyyy-MM-dd_HHmm)"

ForEach ($user in (Import-Csv -Path $input)) {
    $username = $user.username
    Write-Host "Looking for $username in Active Directory..."
    if ([bool] (Get-ADUser -Filter { samAccountName -eq $username })) {
        Get-ADUser -Filter { samAccountName -eq $username } -Properties samAccountName, Mail, Enabled, physicalDeliveryOfficeName, st, c | Select Name, samAccountName, Mail, Enabled, physicalDeliveryOfficeName, st, c  | Export-Csv -Path "$output\$outputName.csv" -NoTypeInformation -Append
        Write-Host "Found $username in Active Directory!"
    }
    else {
        Write-Host "Could not find $username in Active Directory."
    }
}