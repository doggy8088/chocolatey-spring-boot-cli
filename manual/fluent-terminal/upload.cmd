REM just keep retrying until it works!
REM https://github.com/chocolatey/chocolatey.org/issues/613

:push
choco push
if %ERRORLEVEL% GEQ 1 goto :push
