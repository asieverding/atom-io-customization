@echo off & setlocal

REM Display welcome message and info
echo\
echo Welcome to automatic Atom.io installer with packages by Andre Sieverding
echo\

REM Get absolute directory path of current file and remove last character (backslash)
SET dir=%~dp0
SET dir=%dir:~0,-1%

REM Get home dir path
SET home=%systemdrive%%homepath%

REM Change into ~/.atom directory
cd %home%\.atom

REM Install apm packages
echo Installing Atom.io packages...
echo\
call apm install --packages-file %dir%\atom\package-list.txt
echo Package List goes here
echo\

REM Install npm packages
REM echo "Installing Node.js packages...\n"
REM ...

REM Change into atom-io-customization/atom directory
cd %dir%\atom

REM Copy all configurations into current directory
echo Copying files...
echo\

for %%f in (*.cson *.coffee *.txt *.json *.less) do (
	echo Copying: %%f -^> %home%\.atom\%%f
	copy %%f %home%\.atom\%%f > nul
)

REM Check touchbar-icons\ dir and create it, if it doesn't already exists
cd %home%\.atom

if not exist touchbar-icons\ (
	mkdir touchbar-icons
)

REM Change into atom-io-customization/icon directory
cd %dir%\icon

REM Copy touchbar icons
for %%f in (*.png) do (
	echo Copying: %%f -^> %home%\.atom\touchbar-icons\%%f
	copy %%f %home%\.atom\touchbar-icons\%%f > nul
)

REM Change into ~/ directory
cd %home%

REM Copy linter configurations
echo Copying: .htmlhintrc -^> %home%\.htmlhintrc
copy %dir%\linter-conf\.htmlhintrc .htmlhintrc > nul
echo Copying: .jshintrc -^> %home%\.jshintrc
copy %dir%\linter-conf\.jshintrc .jshintrc > nul

echo\
echo Done! :)
echo\
echo Enjoy your customized Atom.io Code-Editor!
echo\

pause
endlocal
