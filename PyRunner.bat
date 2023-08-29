@echo off
mode con: cols=80 lines=20
cls
:onload
setlocal enableDelayedExpansion
if exist ".\*.py" (
	GOTO start
) else (
	GOTO NOTEXIST
)

:NOTEXIST
echo.
echo [41mCurrent Directory = %cd%[0m
echo.
echo You don't have in this directory a ".py" file
echo.
echo.
pause

:start
set fileCount=0
for /f "delims=" %%F in ('dir ".\*.py" /b') do (
  set /a fileCount+=1
  set "pyFile!fileCount!=%%F"
)
echo.
echo [41mCurrent Directory = %cd%[0m
echo.
for /l %%I in (1,1,%fileCount%) do echo %%I - !pyFile%%I!

GOTO menu

:menu
echo.
set selection=
set /p "selection=Enter a number to run file: "
cls
python "!pyFile%selection%!"

