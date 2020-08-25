# Active Directory Reporting

This repository is full of PowerShell scripts I've put together to query Active Directory and return reports.

## Requirements

Windows Remote Server Administration Tools (RSAT)

## Scripts

### FindUserByLogOn.ps1

Find a user by logon ID (also referred to as samAccountName in Active Directory).  The script will take a CSV input file of logon IDs and return the following fields from Active Directory:

- Name
- Logon ID (samAccountName)
- Email Address
- If account is enabled or disabled
- Office name
- State
- Country

**Note:** File format should match the below.
Username |
-------- |
tkurucz |
jsmith2 |
gbread |

### FindUserByEmail.ps1

Find a user by email address.  The script will take a CSV input file of email addresses and return the following fields from Active Directory:

- Name
- Logon ID (samAccountName)
- Email Address
- If account is enabled or disabled
- Office name
- State
- Country

**Note:** File format should match the below.
Email |
-------- |
hey@timkurucz.com |
tim.kurucz@outlook.com |
ginger.bread@gmail.com |

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)


