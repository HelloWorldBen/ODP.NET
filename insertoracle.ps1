 $odpAssemblyName = "Oracle.DataAccess, Version=2.112.3.0, Culture=neutral, PublicKeyToken=89b483f429c47342"
[System.Reflection.Assembly]::Load($odpAssemblyName)

 

 

$AssemblyFile = "C:\Oracle\ODAC_11_2_Release_5_64_Bit\odp.net\bin\4\Oracle.DataAccess.dll"
$ConnectionString = "User ID=username;Password=password;Data Source=computername:1521/XE"
$CommandText = "INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES(:id,:title,:min,:max)"
[Reflection.Assembly]::LoadFile($AssemblyFile) | Out-Null
$OracleConnection = New-Object -TypeName Oracle.DataAccess.Client.OracleConnection
$OracleCommand = New-Object -TypeName Oracle.DataAccess.Client.OracleCommand
$OracleCommand.Connection = $OracleConnection
$OracleConnection.ConnectionString = $ConnectionString
$OracleCommand.CommandText = $CommandText
$OracleConnection.Open()
$pone= New-Object -TypeName Oracle.DataAccess.Client.OracleParameter
$pone.ParameterName = "id"
$pone.Value = "H_RP"
$ptwo= New-Object -TypeName  Oracle.DataAccess.Client.OracleParameter
$ptwo.ParameterName = "title"
$ptwo.Value = "Prsident"
$pthree= New-Object -TypeName  Oracle.DataAccess.Client.OracleParameter
$pthree.ParameterName = "min"
$pthree.Value = 1000.0
$pfour= New-Object -TypeName  Oracle.DataAccess.Client.OracleParameter
$pfour.ParameterName = "max"
$pfour.Value = 20000.0

$OracleCommand.Parameters.Add($pone)
$OracleCommand.Parameters.Add($ptwo)
$OracleCommand.Parameters.Add($pthree)
$OracleCommand.Parameters.Add($pfour)
$OracleCommand.CommandTimeout = 10

$rowCount =$OracleCommand.ExecuteNonQuery()
Write-host($rowCount)
$OracleCommand.Dispose()
$OracleConnection.Close()
$OracleConnection.Close()