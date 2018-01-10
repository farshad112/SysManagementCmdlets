<#
.SYNOPSYS

Copies files and folder recursively from specified directory to destination directory. 
Supports copying on both local and remote filesystem.

.DESCRIPTION

This script copies subdirectories and files under a specified directory to the destination directory.
User has to specify the source and destination directory as command line argument. It is useful for
recursive copy and paste task on remote server management.   

.PARAMETER srcDir

This is the source directory path

.PARAMETER destDir

This is the destination directory path

.PARAMETER remoteHostName

Names of remote servers

.EXAMPLE 

cpfiles -srcDir C:\SampleFiles -destDir D:\

.EXAMPLE

cpfiles -srcDir C:\SampleFiles -destDir D:\ -remoteHostName user-pc

.EXAMPLE

cpfiles -srcDir C:\SampleFiles -destDir D:\ -remoteHostName user1-pc,user2-pc
#>

param(
    [Parameter (Mandatory=$true, Position=1)]
    [string] $srcDir,
    [Parameter (Mandatory=$true, Position=2)]
    [string] $destDir
)

Copy-Item -Path $srcDir -Destination $destDir -Recurse -Force