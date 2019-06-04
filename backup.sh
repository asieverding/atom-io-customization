#!/bin/sh

# Display welcome message and info
echo "\nWelcome to automatic Atom.io backup script by Andre Sieverding\n"
echo "Backing up packages and configurations into repository..."

# Get absolute directory path of current file
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into ~/.atom directory
cd ${HOME}/.atom

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
		echo "Copying: ${HOME}/.atom/${relFile} -> ${dir}/atom/${relFile}"
  		cp $relFile ${dir}/atom/${relFile}
	fi
done

# Copy touchbar-icons only when exists
if [ -d "touchbar-icons" ]; then
	# Change into icon directory
	cd ./touchbar-icons

	# Copy touchbar icons
	for file in ./*
	do
		# Only .png
		if [[ "$file" == ./*.png ]]
		then
			relFile=$(echo $file | cut -c 3-)
			echo "Copying: ${HOME}/.atom/touchbar-icons/${relFile} -> ${dir}/icon/${relFile}"
	  		cp $relFile ${dir}/icon/${relFile}
		fi
	done
fi

# Change into ~/ directory
cd $HOME

# Copy linter configurations
echo "Copying: ${HOME}/.htmlhintrc -> ${dir}/linter-conf/.htmlhintrc"
cp .htmlhintrc ${dir}/linter-conf/.htmlhintrc
echo "Copying: ${HOME}/.jshintrc -> ${dir}/linter-conf/.jshintrc"
cp .jshintrc ${dir}/linter-conf/.jshintrc

echo "Done copying\n"

# Change into atom-io-customization directory
cd $dir

# Done! :)
echo "\nDone ✅\n"
