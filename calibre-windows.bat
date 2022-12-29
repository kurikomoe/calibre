@Echo off

Set "RootDir=%~d0\"

Echo Injecting calibre from %ROOT%

Set CALIBRE_DEVELOP_FROM=%ROOT%\src

calibre.exe
