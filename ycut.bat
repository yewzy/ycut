@echo off
echo Welcome to YCut! Created by Yew
set /p location="Original Video Location (Drag and Drop): "
set dlocation=%~dp0
set /p dlocation="Trimmed Video Folder (or press enter for %dlocation%): "
set checkslash=%dlocation:~-1%
set var2=\
set var2slash=%var2:~-1%
if %checkslash% == %var2slash% (
  echo Saving files to %dlocation%
  ) else (
  set dlocation=%dlocation%\
  echo Saving files to %dlocation%
  )
:start
set /p st="Start Time (HH:MM:SS): "
set /p et="End Time (HH:MM:SS): "
if not x%st::=%==x%st% (set starttime=%st%) else (set starttime=%st:~0,2%:%st:~2,2%:%st:~4,2%)
if not x%et::=%==x%et% (set endtime=%et%) else (set endtime=%et:~0,2%:%et:~2,2%:%et:~4,2%)
set /p filename="Trimmed Video Name:"
echo -ss %starttime% -to %endtime% -i %location% -c copy "%dlocation%%filename%".mp4
pause
ffmpeg -ss %starttime% -to %endtime% -i %location% -c copy "%dlocation%%filename%".mp4
echo %filename% completed
pause
goto start