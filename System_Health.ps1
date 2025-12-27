Write-Host "===== SYSTEM HEALTH REPORT =====" -ForegroundColor Cyan

Write-Host "`nOperating System Info:" -ForegroundColor Yellow
Get-CimInstance Win32_OperatingSystem |
Select-Object Caption, Version, OSArchitecture |
Format-Table -AutoSize

Write-Host "`nCPU Usage:" -ForegroundColor Yellow
$cpu = Get-CimInstance Win32_Processor | Select-Object -ExpandProperty LoadPercentage
Write-Host "CPU Load: $cpu %"

Write-Host "`nMemory Status:" -ForegroundColor Yellow
$mem = Get-CimInstance Win32_OperatingSystem
Write-Host "Total Memory: $([math]::Round($mem.TotalVisibleMemorySize/1MB,2)) GB"
Write-Host "Free Memory : $([math]::Round($mem.FreePhysicalMemory/1MB,2)) GB"

Write-Host "`nDisk Space:" -ForegroundColor Yellow
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object DeviceID,
@{Name="Total(GB)";Expression={[math]::Round($_.Size/1GB,2)}},
@{Name="Free(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}} |
Format-Table -AutoSize

Read-Host "`nPress Enter to exit"
