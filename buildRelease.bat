@echo off

set DEFHOMEDRIVE=d:
set DEFHOMEDIR=%DEFHOMEDRIVE%%HOMEPATH%
set HOMEDIR=
set HOMEDRIVE=%CD:~0,2%

set RELEASEDIR=d:\Users\jbb\release
set ZIP="c:\Program Files\7-zip\7z.exe"
rem echo Default homedir: %DEFHOMEDIR%

rem set /p HOMEDIR= "Enter Home directory, or <CR> for default: "

if "%HOMEDIR%" == "" (
set HOMEDIR=%DEFHOMEDIR%
)
echo %HOMEDIR%

SET _test=%HOMEDIR:~1,1%
if "%_test%" == ":" (
set HOMEDRIVE=%HOMEDIR:~0,2%
)

d:
cd D:\Users\jbb\github\QuizTechAeroPackContinued\GameData\QuizTechAeroContinued

type QuizTechAeroPackCont.version
set /p VERSION= "Enter version: "

set FILE="%RELEASEDIR%\QuizTechAeroPackContinued-%VERSION%.zip"
IF EXIST %FILE% del /F %FILE%
%ZIP% a -tzip %FILE% -xr!QuizTechAeroPackContinued\.git -xr!QuizTechAeroPackContinued\.git\* d:\Users\jbb\github\QuizTechAeroPackContinued


