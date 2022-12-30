@echo off

set _ROOT=%~dp0src

echo Injecting calibre from %_ROOT%

set CALIBRE_DEVELOP_FROM=%_ROOT%

REM For Debug Output
REM calibre-debug.exe -g

calibre.exe
