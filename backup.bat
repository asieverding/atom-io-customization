@echo off & setlocal

REM Display welcome message and info
echo\
echo Welcome to automatic Atom.io backup script by Andre Sieverding
echo\
echo Backing up packages and configurations into repository...
echo\

REM Get absolute directory path of current file and remove last character (backslash)
SET dir=%~dp0
SET dir=%dir:~0,-1%

REM Get home dir path
SET home=%systemdrive%%homepath%

REM Change into ~/.atom directory
cd %home%\.atom

REM Update package-list
echo Updating package-list...
echo\
call apm list --installed --bare > package-list.txt

REM Copy all configurations into current directory
echo Copying files...
echo\

for %%f in (*.cson *.coffee *.txt *.json *.less .htmlhintrc .jshintrc .sass-lint.yml .gitignore) do (
	echo Copying: %home%\.atom\%%f -^> %dir%\atom\%%f
	copy %%f %dir%\atom > nul
)

REM Copy touchbar-icons only when exists
if exist touchbar-icons\ (
	REM Change into icon directory
	cd .\touchbar-icons

	REM Copy touchbar icons
	for %%f in (*.png) do (
		echo Copying: %home%\.atom\touchbar-icons\%%f -^> %dir%\atom\icon\%%f
		copy %%f %dir%\icon > nul
	)
)

echo Done! :)
echo\

pause
endlocal
