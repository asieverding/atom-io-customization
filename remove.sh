#!/bin/sh

# Display welcome message and info
echo "\nWelcome to automatic Atom.io Customization uninstaller by Andre Sieverding\n"

# Get absolute directory path of current file
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into atom-io-customization directory
cd $dir

# First of all, create backup from your Atom.io packages and configurations
echo "Calling backup-script -> backup.sh"
./backup.sh

# Remove apm packages
echo "Removing Atom.io packages...\n"
#apm uninstall --packages-file "${dir}/atom/package-list.txt"
echo "\n"

# Change into ~/ directory
cd ~/

# Remove all configuration files
echo "Removing configuration files and touchbar icons...\n"

# Remove linter-configurations
echo "Remove: .htmlhintrc"
rm .htmlhtinrc
echo "Remove: .jshintrc"
rm .jshintrc

# Change into ~/.atom directory
cd ~/.atom

for file in ./*
do
	# Only if it is a .cson, .coffee, .txt, .json or .less file
	if [[ "$file" == ./*.cson ]] || [[ "$file" == ./*.coffee ]] || [[ "$file" == ./*.txt ]] || [[ "$file" == ./*.json ]] || [[ "$file" == ./*.less ]]
	then
		relFile=$(echo $file | cut -c 3-)
		echo "Remove: ${relFile}"
  		rm $relFile
	fi
done

# Remove touchbar icons
echo "Remove: touchbar-icons/"
rm -r ./touchbar-icons

# Done! :)
echo "\n\nDone ✅\nEnjoy your customized Atom.io Codeeditor!\n"
