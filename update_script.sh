#!/bin/sh

# Display welcome message and info
echo "Welcome to atom-io-customization update script\n"
echo "Updating script..."

# Get absolute directory path of current dir
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into ~/.atom directory
cd ~/.atom

# Update package-list
echo "Updating package-list...\n"
apm list --installed --bare > package-list.txt

# Copy all configurations into current directory
for file in ./*
do
	# Only if it is a .cson, .coffee, .txt, .json or .less file
	if [[ "$file" == ./*.cson ]] || [[ "$file" == ./*.coffee ]] || [[ "$file" == ./*.txt ]] || [[ "$file" == ./*.json ]] || [[ "$file" == ./*.less ]]
	then
		relFile=$(echo $file | cut -c 3-)
		echo "Copying: ~/.atom/${relFile} -> ${dir}/atom/${relFile}"
  		cp $relFile "${dir}/atom/${relFile}"
	fi
done

# Change into ~/ directory
cd ~/

# Copy linter configurations
echo "Copying: ~/.htmlhintrc -> ${dir}/linter-conf/.htmlhintrc"
cp .htmlhintrc "${dir}/linter-conf/.htmlhintrc"
echo "Copying: ~/.jshintrc -> ${dir}/linter-conf/.jshintrc"
cp .jshintrc "${dir}/linter-conf/.jshintrc"

echo "\nDone copying"

# Change into atom-io-customization directory
cd $dir

# Create Node.js package-list
echo "Create Node.js package-list..."
npm list -json -g --depth=0 >> node-package-list.json

# Done! :)
echo "\nDone.\nDon't forget to remove Node.js packages from packagelist file, which you don't need for this setup!"
