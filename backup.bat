setlocal
@echo off

REM Display welcome message and info
echo \nWelcome to automatic Atom.io backup script by Andre Sieverding\n
echo Backing up packages and configurations into repository...

REM Get absolute directory path of current file
SET dir=%~dp0
echo %dir%

REM Change into ~/.atom directory
REM cd "${HOME}/.atom"

REM Update package-list
REM echo "Updating package-list...\n"
REM apm list --installed --bare > package-list.txt

REM Copy all configurations into current directory
REM echo "Copying files...\n"

REM for file in ./*
REM do
REM 	Only if it is a .cson, .coffee, .txt, .json or .less file
REM 	if [[ "$file" == ./*.cson ]] || [[ "$file" == ./*.coffee ]] || [[ "$file" == ./*.txt ]] || [[ "$file" == ./*.json ]] || [[ "$file" == ./*.less ]]
REM 	then
REM 		relFile=$(echo $file | cut -c 3-)
REM 		echo "Copying: ${HOME}/.atom/${relFile} -> ${dir}/atom/${relFile}"
REM   		cp $relFile "${dir}/atom/${relFile}"
REM 	fi
REM done

REM Change into icon directory
REM cd ./touchbar-icons

REM Copy tochbar icons
REM for file in ./*
REM do
REM 	# Only .png
REM 	if [[ "$file" == ./*.png ]]
REM 	then
REM 		relFile=$(echo $file | cut -c 3-)
REM 		echo "Copying: ${HOME}/.atom/touchbar-icons/${relFile} -> ${dir}/icon/${relFile}"
REM   		cp $relFile "${dir}/icon/${relFile}"
REM 	fi
REM done

REM Change into ~/ directory
REM cd $HOME

REM Copy linter configurations
REM echo "Copying: ${HOME}/.htmlhintrc -> ${dir}/linter-conf/.htmlhintrc"
REM cp .htmlhintrc "${dir}/linter-conf/.htmlhintrc"
REM echo "Copying: ${HOME}/.jshintrc -> ${dir}/linter-conf/.jshintrc"
REM cp .jshintrc "${dir}/linter-conf/.jshintrc"

REM echo "Done copying\n"

REM Change into atom-io-customization directory
REM cd $dir

REM Create Node.js package-list
REM echo "Create Node.js package-list..."
REM rm node-package-list.json
REM npm list -json -g --depth=0 >> node-package-list.json

REM Done! :)
REM echo "\nDone ✅\nDon't forget to remove Node.js packages from packagelist file, which you don't need for this setup!\n"

pause
endlocal
