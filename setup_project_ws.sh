#!/bin/bash

# Need to set project path!
#project_dir=<Path_of_Projects>

while getopts "dgn:" flag;

do
	case "${flag}" in
		n)
		  new_dir=${OPTARG}
		  new_project=true
		  project_dir=$project_dir$new_dir
		  ;;
		d)
		  existing_dir=true
		  ;;
		g)
		  init_git=true
		  ;;
	esac
done

shift $((OPTIND-1))

# Check that flags n and d aren't both set
if [ "$new_project" = true ] && [ "$existing_dir" = true ]; then
	echo "Cannot use -n and -d together!"
	exit 1
fi

# If wanting to work on new project
if [ ! -z "$new_dir" ]; then
	mkdir $project_dir

	if [ "$init_git" = true ]; then
		cd "$project_project"

		# Will create a github repo and clone it locally
		gh repo create "$new_dir" --public --clone

	fi

	code "$project_dir"

	gnome-terminal --working-directory "$project_dir"

	firefox
fi

# If wanting to work existing project
if [ "$existing_dir" = true ]; then
	printf "Please select folder:\n"
	select d in ${project_dir}*; do test -n "$d" && break; echo ">>> Invalid Selection"; done

	# Open vscode in project directory
	code "$d"

	# Open terminal in project directory
	gnome-terminal --working-directory "$d"

	firefox
fi


