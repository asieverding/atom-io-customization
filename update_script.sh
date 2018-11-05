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
	if [[ "$file" == ./*.cson ]] || [[ "$file" == ./*.coffee ]] || [[ "$file" == ./*.txt ]] || [[ "$file" == ./*.json ]] || [[ "$file" == ./*.less ]]
	then
		relFile=$(echo $file | cut -c 3-)
		echo "Copying: ~./atom/${relFile} -> ${dir}/${relFile}"
  		cp $relFile "${dir}/${relFile}"
	fi
done

echo "\nDone copying"

# Change into atom-io-customization directory
cd $dir

# Create Node.js package-list
echo "Create Node.js package-list..."
npm list -json -g --depth=0 >> node-package-list.json

# Done! :)
echo "\nDone.\nDon't forget to remove Node.js packages from packagelist file, which you don't need for this setup!"
