# MakeShortcut

## Description
This script can be used to create shortcuts for files and folder on a specified location and provides options to hide the original files.
User can define the files and folder to be excluded from creating shortcuts.
Useful for office document management and organization.

## Parameters
-Path :Path to main files (root dir)

-Path2Shortcut : Path where shortcut will be saved. Default is in the same directory as file.

- exclude : Type of files to be excluded from shortcut creation.

-hideOriginal : Hide original files

-recurse : Recursive

-fileOnly : Create shortcuts only for files (ignore directories)

## Example
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop   
Creates shortcuts for directories inside Document folder on Desktop

## EXAMPLE
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop -fileOnly
Creates shortcuts for only files inside Document folder on Desktop

## EXAMPLE
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop -recurse -fileOnly
Creates shortcuts for only files inside Document folder on Desktop recursively. 
That means it will create shortcuts for all the files inside all the sub directories within Document on Desktop

## EXAMPLE
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop -recurse -fileOnly -hideOriginal
Creates shortcuts for only files inside Document folder on Desktop recursively. 
That means it will create shortcuts for all the files inside all the sub directories within Document on Desktop and Hide the original files. 

## BUG
-The exclude file option is not working.

## Unimplemented feature
-Custom Icon assignment to the shortcuts

