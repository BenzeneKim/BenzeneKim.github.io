@echo off
set YEAR=%date:~6,4%
set MONTH=%date:~0,2%
set DAY=%date:~3,2%
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
set SECOND=%time:~6,2%
 
set POSTFIX=%YEAR%-%MONTH%-%DAY%
echo ^--- >%POSTFIX%.markdown
echo title: "[SAS 프로젝트] OpenCV 설치하기" >>%POSTFIX%.markdown
echo date: %YEAR%-%MONTH%-%DAY% %HOUR%:%MINUTE%:%SECOND% >>%POSTFIX%.markdown
echo author: BenzeneKim >>%POSTFIX%.markdown
echo categories: cartegories_names >>%POSTFIX%.markdown
echo tags: tag names >>%POSTFIX%.markdown
echo cover: "/assets/instacode.png" >>%POSTFIX%.markdown
echo ^--- >>%POSTFIX%.markdown

echo
set YEAR=
set MONTH=
set DAY=
set HOUR=
set MINUTE=
set SECOND=
set POSTFIX=
