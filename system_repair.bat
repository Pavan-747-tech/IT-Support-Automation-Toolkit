@echo off
title "System Repair & Maintenance Tool"
color 0E

net session >nul 2>&1
if %errorlevel% neq 0 (
 echo Run as Administrator.
 pause
 exit /b
)

sfc /scannow
pause

chkdsk C: /f
pause

DISM /Online /Cleanup-Image /RestoreHealth
pause

gpupdate /force
pause
