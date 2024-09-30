@echo off
:: Get the current date
for /f "tokens=1-4 delims=/- " %%a in ('wmic os get localdatetime ^| find "."') do (
    set datetime=%%a
)

:: Extract year, month, and day from the datetime
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%

:: Ask the user for a title, categories, and tags
set /p customTitle=Enter the custom title for the file: 
set /p categories=Enter the categories (comma-separated): 
set /p tags=Enter the tags (comma-separated): 

:: Replace spaces in customTitle with hyphens
set customTitle=%customTitle: =-%

:: Create the filename with the format yyyy-mm-dd-customTitle.md
set filename=%year%-%month%-%day%-%customTitle%.md
echo Creating file: %filename%
echo. > %filename%

:: Get the current time
set hour=%datetime:~8,2%
set minute=%datetime:~10,2%
set second=%datetime:~12,2%
set currenttime=%hour%:%minute%:%second%

:: Write default heading content for a GitHub blog post
(
echo ---
echo layout: post
echo title:  "%customTitle%"
echo date:   %year%-%month%-%day% %currenttime%
echo author: BenzeneKim
echo categories: %categories%
echo tags: %tags%
echo cover:  "/assets/instacode.png"
echo ---
) > %filename%

echo File created and content written to %filename%

pause
