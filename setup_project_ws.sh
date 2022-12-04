#!/bin/bash

# REMOVE project_dir PATH BEFORE COMMITTING!
#project_dir=<PATH_OF_PROJECT_PATH>

while getopts "ftvd" flag;

do
	case "${flag}" in
		d)
		  printf "Please select folder:\n"
		  select d in $project_dir; do test -n "$d" && break; echo ">>> Invalid Selection"; done
		  cd "$d" && pwd
		  ;; 
		f)   
		  firefox="${OPTARG}"   
                  firefox   
                  ;;     
                t)    
                  term="${OPTARG}"   
                  gnome-terminal --working-directory "$d"   
                  ;;            
  		v)
		  echo "Opening Vscode"
		  if [ -z "$d" ]; then
			  code
		  else
			  code "$d"   
		  fi
		  ;;
		
		
	esac
done

shift $((OPTIND-1))

