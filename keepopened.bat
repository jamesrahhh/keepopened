@echo off

set /p filepath="[%time%] Drag executable into window: "
for %%i in (%filepath%) do set filename=%%~nxi
set filepath="%filepath:\="\"%"

:loop
    tasklist /fo csv 2>NUL | find /I "%filename%">NUL
    if errorlevel 1 (
        echo [%time%] Starting %filename%
        start "" "%filepath%"
    )
	:: Change the number to increase or decrease the wait time
    timeout /t 5 /nobreak > nul
goto loop