Import-Module “sqlps” -DisableNameCheckin
Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Businessunit.sql  -QueryTimeout 0  | Export-Csv  -NoType C:\BUExits\Businessunit.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Email.sql  -QueryTimeout 0  | Export-Csv  -NoType C:\BUExits\Email.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\MemberData.sql  -QueryTimeout 0  | Export-Csv  -NoType C:\BUExits\memberdata.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Notes.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Notes.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Phone.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\PhoneNumber.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\address.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Address.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Contracts.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Contracts.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Cancellations.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Cancellations.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Suspensions.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Suspensions.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Activity.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Activity.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\RemainingSessions.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\RemainingSessions.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Accounts.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Accounts.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\CardData.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\CardData.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\MemberAgreementAcctAndBillType.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\MemberAgreementAcctAndBillType.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\AgreementbyItem.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\AgreementbyItem.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Transactions.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Transactions.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\checkins.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\checkin.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\Organization.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Organization.csv 

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Contracts_ORG.sql   -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Contracts_ORG.csv 

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\Organization_MemberAgreementAndBillType.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Organization_MemberAgreementAndBillType.csv 

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\Employee.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Employee.csv 

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\EmployeeAddress.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\EmployeeAddress.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\EmployeeEmail.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\EmployeeEmail.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\EmployeePhone.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\EmployeePhone.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\EmployeeWorkRole.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\EmployeeWorkRole.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\Inventory.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Inventory.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1' -InputFile   C:\BUExits\Carddata.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Carddata.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-Query "select Roleid,Partyid Filename from rpt_MemberList WHERE BusinessUnitID = 205" | Export-Csv  -NoType C:\BUExits\PhotoFile.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\Age.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\Age.csv

Invoke-Sqlcmd -Variable buid="'205'" -ServerInstance tsi-proddb.mosodomain.com -Database Tenant_TSI -Username "slow" -Password 'password$1'-InputFile   C:\BUExits\ClientAccountData.sql  -QueryTimeout 0 | Export-Csv  -NoType C:\BUExits\ClientAccountData.csv
