Try {
    
    # B1. Creates a new OU named finance
    New-ADOrganizationalUnit -Name finance -ProtectedFromAccidentalDeletion $false;

    # Creates variables used to import users from a file
    $ImportUsers = Import-Csv "$PSScriptRoot\financePersonnel.csv"
    $ADFinancePath = "OU=finance,DC=ucertify,DC=com"

    # Creates variables used to create new users
    Foreach ($ADUser in $ImportUsers) {
    
        # Variable list
        $FirtName = $ADUser.First_Name
        $LastName = $ADUser.Last_Name
        $DisplayName = $FirtName + " " + $LastName
        $Sam = $ADUser.SamAccount
        $Postal = $ADUser.PostalCode
        $OfficeNumber = $ADUser.OfficePhone
        $MobileNumber = $ADUser.MobilePhone

        # B2. Creates new users
        New-ADUser -Path $ADFinancePath -GivenName $FirtName -Surname $LastName -Name $DisplayName -DisplayName $DisplayName `
        -SamAccountName $Sam -PostalCode $Postal -OfficePhone $OfficeNumber -MobilePhone $MobileNumber;
    
    }

    # Imports sql module
    Import-Module -Name sqlps -DisableNameChecking

    # B3. Creates a database
    $servername = ".\UCERTIFY3"
    $srv = New-Object Microsoft.SqlServer.Management.Smo.Server -ArgumentList $servername
    $databasename = "ClientDB"
    $db = New-Object Microsoft.SqlServer.Management.Smo.Database -ArgumentList $servername,$databasename
    $db.Create()

    # B4. Creates a table
    Invoke-Sqlcmd -ServerInstance $servername -Database $databasename -InputFile "$PSScriptRoot\Client_A_Contacts.sql"

    # B5. Inserts data into a table from a file
    $table = 'dbo.Client_A_Contacts'
    Import-Csv "$PSScriptRoot\NewClientData.csv" | ForEach-Object { Invoke-Sqlcmd `
    -Database $databasename -ServerInstance $servername -Query "insert into $table `
    (first_name,last_name,city,county,zip,officePhone,mobilePhone) VALUES `
    ('$($_.first_name)','$($_.last_name)','$($_.city)','$($_.county)','$($_.zip)','$($_.officePhone)','$($_.mobilePhone)')" }

}

Catch [System.OutOfMemoryException] {

    Write-Host "An error has occured: System out of memory exception."

}
