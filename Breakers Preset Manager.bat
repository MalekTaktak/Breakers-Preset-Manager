@echo off
:Check
rem Check if Breakers is running, if it is, exit the script. Continue if not.
SET MyProcess=DRAGON BALL THE BREAKERS.exe
TASKLIST | FINDSTR /I "%MyProcess%")
IF ERRORLEVEL 1 (echo This script is made by MrPan, to make it easier to manage different character presets in Dragon Ball The Breakers, it only copies and renames existing save directories for you, please close the game before using this.) ELSE (GOTO :ERROR)
:List
setlocal

rem change to the Bandai Namco Entertainment directory to scout for existing presets
cd /d %LocalAppData%\BANDAI NAMCO ENTERTAINMENT\

rem List the presets with the proper BPM naming format 
echo Existing presets found:
dir /b | FIND "DRAGON BALL THE BREAKERS -" 
endlocal
:START
choice /C:sld /M "Would you like to [S]ave your current preset, [L]oad an existing preset or [D]elete a preset?"
if %ERRORLEVEL% EQU 1 (GOTO :SAVE) 
if %ERRORLEVEL% EQU 2 (GOTO :LOAD)
if %ERRORLEVEL% EQU 3 (GOTO :DELETE)
:SAVE
set /p "saven=Please type a name for your new preset to save:" 
if exist "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %saven%" (GOTO :OVERWRITE) else (GOTO :NORMALSAVE)
:OVERWRITE
choice /C:yn /M "Would you like to overwrite the existing preset %saven% ?" 
if %ERRORLEVEL% EQU 1 (xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %saven%" /c /h /e /i /Y) else (GOTO :NOACTION)
msg * "Preset DRAGON BALL THE BREAKERS %saven% overwritten successfully."
exit
:NORMALSAVE
xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %saven%" /c /h /e /i /Y
msg * "Preset successfully saved to DRAGON BALL THE BREAKERS - %saven%."
exit
:LOAD
set /p "preset=Which preset name would you like to load?" 
if exist "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %preset%" (choice /C:yn /M "Would you like to save your current preset folder?") else (GOTO :NOTFOUND)
if %ERRORLEVEL% EQU 1 (set /p "savename=Please type a name for your current preset to save:" ) else (GOTO :LOADPROCESS)
set %ERRORLEVEL%= 0
if defined savename if exist "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %savename%" (choice /C:yn /M "Would you like to overwrite the existing preset %savename% ?")
if %ERRORLEVEL% EQU 1 (xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %savename%" /c /h /e /i /Y && msg * "Saved current preset to DRAGON BALL THE BREAKERS - %savename%." ) else (if %ERRORLEVEL% EQU 2 (xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %savename% (Copy)" /c /h /e /i /Y  && msg * "Saved current preset to DRAGON BALL THE BREAKERS - %savename% (Copy)."))
:LOADPROCESS
rmdir /q /s "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" 
xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %preset%" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" /c /h /e /i /Y
if defined savename (msg * "Preset "DRAGON BALL THE BREAKERS - %preset%" loaded successfully, old preset folder saved to "DRAGON BALL THE BREAKERS - %savename%".") else (msg * "Preset "DRAGON BALL THE BREAKERS - %preset%" loaded successfully.") 
exit
:DELETE
set /p "presetd= Which preset name would you like to delete? WARNING: THE FOLDER WILL BE GONE. " 
if exist "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %presetd%" (rmdir /q /s "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %presetd%" & msg * "Preset DRAGON BALL THE BREAKERS - %presetd% deleted successfully.") else (GOTO :NOTFOUNDD)
exit
:ERROR
msg * "Please close Dragon Ball the Breakers before continuing."
exit
:NOACTION
msg * "No action was taken."
exit
:NOTFOUND
msg * "Preset "DRAGON BALL THE BREAKERS - %preset%" not found."
exit
:NOTFOUNDD
msg * "Preset "DRAGON BALL THE BREAKERS - %presetd%" not found."
exit


