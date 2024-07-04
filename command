$urls = Get-Content -path C:\Users\dferr\OneDrive\Documents\Z9-TEMP\urls
$urls | ForEach-Object {
    Write-Host "hostname: $($_)" -BackgroundColor White -ForegroundColor Black
}

"add text" | Out-File logs.txt -Append
"new line" | Out-File logs.txt -Append

$conectstat = Test-NetConnection  www.google.com -Port 443
$conectstat | Select *

Get-Date
clear

$urls | ForEach-Object {
    Start-Sleep -Seconds 2
    Write-Host "Test host: $($_)" 
    "$(Get-Date): Testing host: $($_)." | Out-File host_test.log -Append
    Test-NetConnection -ComputerName $_ -Port 443
    Test-NetConnection -ComputerName $_ -Port 80
    Write-Host ""

}
