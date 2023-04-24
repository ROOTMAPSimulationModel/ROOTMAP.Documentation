@echo off
if exist .\_build\ del .\_build\ /F /Q
call .\make.bat html
@echo Opening built site in default browser.
start .\_build\html\index.html
