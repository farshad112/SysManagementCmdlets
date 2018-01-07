<#
.Synopsys
Copies files and folder recursively from specified directory to destination directory. 
Supports copying on both local and remote filesystem.
.Description
This script copies subdirectories and files under a specified directory to the destination directory.
User has to specify the source and destination directory as command line argument. It is useful for
recursive copy and paste task on remote server management.   
.Parameter srcDir
This is the source directory path
.Parameter destDir
This is the destination directory path
.Parameter remoteHostName
Names of remote servers
.Example 
cpfiles -srcDir C:\SampleFiles -destDir D:\
.Example
cpfiles -srcDir C:\SampleFiles -destDir D:\ -remoteHostName user-pc
.Example
cpfiles -srcDir C:\SampleFiles -destDir D:\ -remoteHostName user1-pc,user2-pc
#>

