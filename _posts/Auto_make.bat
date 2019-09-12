@echo off
set YEAR=%date:~6,4%
set MONTH=%date:~0,2%
set DAY=%date:~3,2%
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
set SECOND=%time:~6,2%

set Title=%YEAR%-%MONTH%-%DAY%
echo ^--- > title.markdown
