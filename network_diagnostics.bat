@echo off
title "Network Diagnostics & Reset Tool"
color 0A

net session >nul 2>&1
if %errorlevel% neq 0 (
 echo Run this script as Administrator.
 pause
 exit /b
)

echo Current Network Configuration:
ipconfig /all
echo.

netsh winsock reset
netsh int ip reset
ipconfig /flushdns
ipconfig /release
ipconfig /renew

echo.
ipconfig /all
echo.
ping google.com
echo.
nslookup google.com
pause
