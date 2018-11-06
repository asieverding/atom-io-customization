#!/bin/sh

# Display welcome message and info
echo "\nWelcome to automatic Atom.io backup script by Andre Sieverding\n"
echo "Updating script..."

# Get absolute directory path of current file
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into ~/.atom directory
cd ~/.atom

# Update package-list
echo "Updating package-list...\n"
apm list --installed --bare > package-list.txt

# Copy all configurations into current directory
echo "Copying files...\n"

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

# Change into icon directory
cd ./touchbar-icons

# Copy tochbar icons
for file in ./*
do
	# Only .png
	if [[ "$file" == ./*.png ]]
	then
		relFile=$(echo $file | cut -c 3-)
		echo "Copying: ~/.atom/touchbar-icons/${relFile} -> ${dir}/icon/${relFile}"
  		cp $relFile "${dir}/icon/${relFile}"
	fi
done

# Change into ~/ directory
cd ~/

# Copy linter configurations
echo "Copying: ~/.htmlhintrc -> ${dir}/linter-conf/.htmlhintrc"
cp .htmlhintrc "${dir}/linter-conf/.htmlhintrc"
echo "Copying: ~/.jshintrc -> ${dir}/linter-conf/.jshintrc"
cp .jshintrc "${dir}/linter-conf/.jshintrc"

echo "Done copying\n"

# Change into atom-io-customization directory
cd $dir

# Create Node.js package-list
echo "Create Node.js package-list..."
rm node-package-list.json
npm list -json -g --depth=0 >> node-package-list.json

# Done! :)
echo "\nDone ✅\nDon't forget to remove Node.js packages from packagelist file, which you don't need for this setup!\n"
