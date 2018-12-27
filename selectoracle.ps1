<#


Gets the loaded assembly 

function Select-TNS
{
    $enu = New-Object Oracle.DataAccess.Client.OracleDataSourceEnumerator
    Write-Output $enu.GetDataSources()
}

 Select-TNS | where-object {$_.InstanceName -like '*DEV*'} | ft

#>

$odpAssemblyName = "Oracle.DataAccess, Version=2.112.3.0, Culture=neutral, PublicKeyToken=89b483f429c47342"
[System.Reflection.Assembly]::Load($odpAssemblyName)

 

 

$AssemblyFile = "C:\Oracle\ODAC_11_2_Release_5_64_Bit\odp.net\bin\4\Oracle.DataAccess.dll"
$ConnectionString = "User ID=username;Password=password;Data Source=computername:1521/XE"
$CommandText = "SELECT * FROM EMPLOYEES"
[Reflection.Assembly]::LoadFile($AssemblyFile) | Out-Null
$OracleConnection = New-Object -TypeName Oracle.DataAccess.Client.OracleConnection
$OracleConnection.ConnectionString = $ConnectionString
$OracleConnection.Open()
$OracleCommand = New-Object -TypeName Oracle.DataAccess.Client.OracleCommand
$OracleCommand.CommandText = $CommandText
$OracleCommand.Connection = $OracleConnection
$OracleDataAdapter = New-Object -TypeName Oracle.DataAccess.Client.OracleDataAdapter
$OracleDataAdapter.SelectCommand = $OracleCommand
$DataSet = New-Object -TypeName System.Data.DataSet
$OracleDataAdapter.Fill($DataSet) | Out-Null
$OracleDataAdapter.Dispose()
$OracleCommand.Dispose()
$OracleConnection.Close()
$DataSet.Tables[0] 

 