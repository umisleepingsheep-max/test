@echo off

･･･
echo ===== Panasonic Driver Install Start =====

timeout /t 30

set USB=

for %%D in (D E F G H I J K L M) do (
    if exist %%D:\Panasonic (
        set USB=%%D:
    )
)

if "%USB%"=="" (
    echo USB not found
    exit /b
)

echo USB Found at %USB%

xcopy %USB%\Panasonic C:\Drivers\Panasonic /E /I /Y

cd /d C:\Drivers\Panasonic

for %%i in (*.exe) do (
    echo Installing %%i
    start /wait %%i /s /quiet /norestart
)

echo ===== Driver Install Finished =====

exit
