@echo off
call .\make.bat clean
call .\make.bat html
@echo Opening built site in default browser.
start .\_build\html\index.html
