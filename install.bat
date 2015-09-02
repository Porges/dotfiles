FOR %%F IN (home\*) DO MKLINK "%UserProfile%\.%%~nF" "%%~fF"

call :mkvimfiles vimfiles
goto :eof

:mkvimfiles
MKLINK /D "%UserProfile%\vimfiles" %~f1
goto :eof