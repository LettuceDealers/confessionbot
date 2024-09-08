@echo off
:loop
    echo Starting Luvit bot...
    luvit main.lua
    echo Exit code %ERRORLEVEL%.
    echo Restarting in 5 seconds...
    timeout /t 5
goto loop
