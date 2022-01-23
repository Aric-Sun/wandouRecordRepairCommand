@echo on

echo ==============convert any format to WAV

for %%i in (%*) do (
ffmpeg -y -i "%%i" -f wav "%%~di%%~pi%%~ni_WAV.wav"
)

pause
rem @cmd /k