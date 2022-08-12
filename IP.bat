echo off

:LOOPSTART

echo %DATE:~0% %TIME:~0,8% >> Pingtest.log

SETLOCAL ENABLEDELAYEDEXPANSION
SET scriptCount=1
FOR /F "tokens=* USEBACKQ" %%F IN (`ping SITE OU IP -n 1`) DO (
  SET commandLineStr!scriptCount!=%%F
  SET /a scriptCount=!scriptCount!+1
)
@ECHO %commandLineStr1% >> PingTest.log
@ECHO %commandLineStr2% >> PingTest.log
ENDLOCAL

timeout 5 > nul

GOTO LOOPSTART
