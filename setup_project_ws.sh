#!/bin/bash

# proj_dir=<path_that_holds_projects>

while getopts "ftvd" flag;

do
	case "${flag}" in
		d) # Select project path to work in:
		  printf "Please select folder:\n"
		  select d in /home/betsey/Desktop/Projects/*; do test -n "$d" && break; echo ">>> Invalid Selection"; done
		  cd "$d" && pwd
		  #directory="${OPTARG}"
		  #echo $directory;
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
		  if [ -z "$directory" ]; then
			  code
		  else
			  code "$directory"   
		  fi
		  ;;
		
		
	esac
done

shift $((OPTIND-1))

