@echo off
echo Welcome to Ycut- The best and fastest video trimmer in the world*!
set /p location="Original Video Location (Drag and Drop): "
set dlocation=%~dp0
set /p dlocation="Trimmed Video Folder (or press enter for %dlocation%): "
:start
set /p st="Start Time (HH:MM:SS): "
set /p et="End Time (HH:MM:SS): "
if not x%st::=%==x%st% (set starttime=%st%) else (set starttime=%st:~0,2%:%st:~2,2%:%st:~4,2%)
if not x%et::=%==x%et% (set endtime=%et%) else (set endtime=%et:~0,2%:%et:~2,2%:%et:~4,2%)
set /p filename="Trimmed Video Name:"
ffmpeg -ss %starttime% -to %endtime% -i %location% -c copy "%dlocation%%filename%".mp4
echo %filename% completed
pause
goto start
