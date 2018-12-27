 $odpAssemblyName = "Oracle.DataAccess, Version=2.112.3.0, Culture=neutral, PublicKeyToken=89b483f429c47342"
[System.Reflection.Assembly]::Load($odpAssemblyName)

 

 

$AssemblyFile = "C:\Oracle\ODAC_11_2_Release_5_64_Bit\odp.net\bin\4\Oracle.DataAccess.dll"
$ConnectionString = "User ID=username;Password=password;Data Source=computername:1521/XE"
$CommandText = "UPDATE EMPLOYEES SET LAST_NAME = :name where employee_id= :id"
[Reflection.Assembly]::LoadFile($AssemblyFile) | Out-Null
$OracleConnection = New-Object -TypeName Oracle.DataAccess.Client.OracleConnection
$OracleCommand = New-Object -TypeName Oracle.DataAccess.Client.OracleCommand
$OracleCommand.Connection = $OracleConnection
$OracleConnection.ConnectionString = $ConnectionString
$OracleCommand.CommandText = $CommandText
$OracleConnection.Open()
$pone= New-Object -TypeName Oracle.DataAccess.Client.OracleParameter
$pone.ParameterName = "name"
$pone.Value = "Hello"
$ptwo= New-Object -TypeName  Oracle.DataAccess.Client.OracleParameter
$ptwo.ParameterName = "id"
$ptwo.Value = 145.0
$OracleCommand.Parameters.Add($pone)
$OracleCommand.Parameters.Add($ptwo)
$OracleCommand.CommandTimeout = 30

$rowCount =$OracleCommand.ExecuteNonQuery()
Write-host($rowCount)
$OracleCommand.Dispose()
$OracleConnection.Close()
$OracleConnection.Close()