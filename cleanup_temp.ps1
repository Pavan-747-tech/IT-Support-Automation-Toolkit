function Clean-Folder ($Path) {
 if (Test-Path $Path) {
  Get-ChildItem $Path -Recurse -Force -ErrorAction SilentlyContinue |
  Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
 }
}

Clean-Folder $env:TEMP
Clean-Folder "C:\Windows\Temp"
Clean-Folder "C:\Windows\Prefetch"

Read-Host "Cleanup completed. Press Enter to exit"
