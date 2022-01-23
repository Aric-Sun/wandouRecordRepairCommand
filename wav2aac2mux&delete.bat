@echo on &setlocal enabledelayedexpansion
:: attention: input is wav (batch)

echo ==============WAV to AAC
for %%i in (%*) do (
ffmpeg -i "%%i" -vn -sn -v 0 -c:a pcm_s16le -f wav pipe:  | "D:\Program Files (x86)\maruko-toolbox\tools\neroAacEnc.exe" -ignorelength -lc -br 256000 -if - -of "%%~di%%~pi%%~ni_AAC.mp4"
)

echo ==============combine FLV and AAC to Mux.mp4 by replacing origin audio stream with input AAC
for %%i in (%*) do (
set fullFileName=%%i
set flvNameWithoutSuffix=!fullFileName:~0,-8!
ffmpeg -y -i "!flvNameWithoutSuffix!.flv" -i "%%~di%%~pi%%~ni_AAC.mp4" -map 0:v -c:v copy -map 1:0 -c:a copy "!flvNameWithoutSuffix!_Mux.mp4"
)

echo ==============delete unrelated files (WAV, AAC.mp4)
for %%i in (%*) do (
del "%%i"
del "%%~di%%~pi%%~ni_AAC.mp4"
)

pause
rem @cmd /k