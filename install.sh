#!/bin/sh

# Display welcome message and info
echo "\nWelcome to automatic Atom.io installer with packages by Andre Sieverding\n"

# Get absolute directory path of current file
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into ~/.atom directory
cd "${HOME}/.atom"

# Install apm packages
echo "Installing Atom.io packages...\n"
apm install --packages-file "${dir}/atom/package-list.txt"
echo "\n"

# Install npm packages
# echo "Installing Node.js packages...\n"
# ...

# Change into atom-io-customization/atom directory
cd ${dir}/atom

# Copy all configurations into current directory
echo "Copying files...\n"

for file in ./*
do
	# Only if it is a .cson, .coffee, .txt, .json or .less file
	if [[ "$file" == ./*.cson ]] || [[ "$file" == ./*.coffee ]] || [[ "$file" == ./*.txt ]] || [[ "$file" == ./*.json ]] || [[ "$file" == ./*.less ]]
	then
		# Change into ~/.atom directory
		cd "${HOME}/.atom"

		relFile=$(echo $file | cut -c 3-)
		echo "Copying: ${relFile} -> ${HOME}/.atom/${relFile}"
  		cp "${dir}/atom/${relFile}" $relFile
	fi
done

# Change into atom-io-customization/icon directory
cd ${dir}/icon

# Copy touchbar-icons
for file in ./*
do
	# Only if it is a .png file
	if [[ "$file" == ./*.png ]]
	then
		# Change into ~/.atom directory
		cd "${HOME}/.atom"

		# Create touchbar-icons directory, if doesn't exists
		if [ ! -d "touchbar-icons" ]; then
			mkdir touchbar-icons
		fi

		# Change into ~/.atom/touchbar-icons directory
		cd ./touchbar-icons

		relFile=$(echo $file | cut -c 3-)
		echo "Copying: ${relFile} -> ${HOME}/.atom/touchbar-icons/${relFile}"
  		cp "${dir}/icon/${relFile}" $relFile
	fi
done

# Change into ~/ directory
cd $HOME

# Copy linter configurations
echo "Copying: .htmlhintrc -> ${HOME}/.htmlhintrc"
cp "${dir}/linter-conf/.htmlhintrc" .htmlhintrc
echo "Copying: .jshintrc -> ${HOME}/.jshintrc"
cp "${dir}/linter-conf/.jshintrc" .jshintrc

# Done! :)
echo "\nDone ✅\nEnjoy your customized Atom.io Code-Editor!\n"
