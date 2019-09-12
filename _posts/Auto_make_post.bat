@echo off
@set YEAR=%date:~6,4%
@set MONTH=%date:~0,2%
@set DAY=%date:~3,2%
@set HOUR=%time:~0,2%
@set MINUTE=%time:~3,2%
@set SECOND=%time:~6,2%
 
@set POSTFIX=%YEAR%-%MONTH%-%DAY%
echo ^--->%POSTFIX%.makrdown
echo title:  "[SAS 프로젝트] OpenCV 설치하기" >>%POSTFIX%.makrdown
echo date:   %YEAR%-%MONTH%-%DAY% %HOUR%:%MINUTE%:%SECOND% >>%POSTFIX%.makrdown
echo author: BenzeneKim >>%POSTFIX%.makrdown
echo categories: SAS >>%POSTFIX%.makrdown
echo tags: SAS System_of_Agriculture_Systme >>%POSTFIX%.makrdown
echo cover:  "/assets/instacode.png" >>%POSTFIX%.makrdown
echo --- >>%POSTFIX%.makrdown

echo
@set YEAR=
@set MONTH=
@set DAY=
@set HOUR=
@set MINUTE=
@set SECOND=
@set POSTFIX=