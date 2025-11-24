taskkill /f /im vvvv.exe
timeout 3
start "" "C:\Program Files\vvvv\vvvv_gamma_7.0-win-x64\vvvv.exe" --nuget-path "%~dp0nugets" 
exit