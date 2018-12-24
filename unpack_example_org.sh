#!/bin/bash
#This copies the subdur org-files to $HOME/org-files.
# Run this from the project directory when first cloned.

if [ -d $HOME/org-files ] ; then
    echo "Cannot overwrite $HOME/org-files."
    exit 1
fi

cp -rv org-files $HOME/

