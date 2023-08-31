@echo off
:Message

echo This script is made by MrPan, to make it easier to manage different character presets in Dragon Ball The Breakers, it only copies and renames existing save directories for you, it is highly recommended to have Dragon Ball the Breakers closed before using this. If you would still like to use this in-game, it is required to be on the title screen level the moment you run the script.

setlocal enabledelayedexpansion
rem change to the Bandai Namco Entertainment directory to scout for existing presets
cd /d %LocalAppData%\BANDAI NAMCO ENTERTAINMENT\

rem List the presets with the proper BPM naming format 
echo Existing presets found:
set /a ID=1

for /D %%G in ("DRAGON BALL THE BREAKERS - *") do (
    set f=%%~G
    set filename[!ID!]=!f:~27!
    echo [!ID!] !f:~27!
    set /a ID+=1
)
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
set /p "n=Please type the number of the preset you'd like to load: " 
set preset=!filename[%n%]!
echo %preset% selected.
if exist "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %preset%" (choice /C:yn /M "Would you like to save your current preset folder?") else (GOTO :NOTFOUND)
if %ERRORLEVEL% EQU 1 (set /p "savename=Please type a name for your current preset to save:") else (GOTO :LOADPROCESS)
set %ERRORLEVEL%= 0
if defined savename if exist "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %savename%" (choice /C:yn /M "Would you like to overwrite the existing preset %savename% ?" )
if %ERRORLEVEL% EQU 1 (xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - temp" /c /h /e /i /Y && rmdir /q /s "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" &&  xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %preset%" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" /c /h /e /i /Y && xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - temp" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %savename%" /c /h /e /i /Y && rmdir /q /s "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - temp"  && msg * "Loaded the %preset% preset and saved current preset to DRAGON BALL THE BREAKERS - %savename%. " && exit)
if %ERRORLEVEL% EQU 2 (msg * Saving to %savename% (copy). && xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %savename% (Copy)" /c /h /e /i /Y ) 
:LOADPROCESS
rmdir /q /s "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" 
xcopy "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS - %preset%" "%LocalAppData%\BANDAI NAMCO ENTERTAINMENT\DRAGON BALL THE BREAKERS" /c /h /e /i /Y
if defined savename (msg * Preset %preset%" loaded successfully, old preset folder saved to  %savename%. ) else ( msg * Preset "DRAGON BALL THE BREAKERS - %preset%" loaded successfully. ) 
exit
:DELETE
set /p "presetd= Type the name of the preset which you'd like to be deleted. WARNING: THE FOLDER WILL BE GONE : " 
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
endlocal


