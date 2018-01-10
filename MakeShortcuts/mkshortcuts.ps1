<#
.SYNOPSYS
Make shortcuts for files and folder within a directory.

.DESCRIPTION 
The script supports recursive operation so it can be used to find a specific file type inside all the folders and create shortcuts of them in a specified location.
It also supports hide the orginal files. 
You can also specificy which icon to apply to shortcuts.

.PARAMETER Path
Path to main files

.PARAMETER Path2Shortcut
Shortcut name and Path where shortcut will be saved. Default is in the same directory as file.

.PARAMETER exclude
Type of files to be excluded from shortcut creation.

.PARAMETER hideOriginal
Hide original files

.PARAMETER recurse
Recursive

.PARAMETER fileOnly
Create shortcuts only for files (ignore directories)

.EXAMPLE
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop   

.EXAMPLE
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop -fileOnly

.EXAMPLE
.\mkshortcuts -Path C:\Users\User\Documents -Path2Shortcut C:\Users\User\Desktop -recurse -fileOnly
#>

param(
    [Parameter(Mandatory=$false, Position=1, ValueFromPipeline=$True, ValueFromPipelinebyPropertyName=$True)]
	[string]$Path = '.',
	[Parameter(Mandatory=$false, Position=2)]
	[string]$Path2Shortcut='.',
	[Parameter(Mandatory = $false, Position = 3)]
	[string]$exclude,
	[Parameter(Mandatory = $false, Position = 4)]
	[switch]$hideOriginal,
	[Parameter(Mandatory = $false, Position = 5)]
	[switch]$recurse,
	[Parameter(Mandatory = $false, Position = 6)]
	[switch] $fileOnly
)
IF ($exclude)
{
	IF ($recurse -eq $true)
	{
		IF ($fileOnly -eq $True)
		{
			IF ($hideOriginal -eq $True)
			{
				# create shortcuts for all files under specified root directory and subdirectories recursively and hides original files
				Get-ChildItem -Path $Path -Recurse -Exclude $exclude -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# create shortcuts for all files under specified root directory and subdirectories recursively
				Get-ChildItem -Path $Path -Recurse -Exclude $exclude -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
		Else
		{
			If ($hideOriginal -eq $True)
			{
				# get all directories under specified root directory and sub directories recursively and hides original files
				Get-ChildItem -Path $Path -Recurse -Exclude $exclude -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# get all directories under specified root directory and sub directories recursively
				Get-ChildItem -Path $Path -Recurse -Exclude $exclude -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
	}
	Else
	{
		IF ($fileOnly -eq $True)
		{
			IF ($hideOriginal -eq $True)
			{
				# get all directory and files for specified root directory and hides origianl 
				Get-ChildItem -Path $Path -Exclude $exclude -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# get all directory and files for specified root directory
				Get-ChildItem -Path $Path -Exclude $exclude -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
		Else
		{
			IF ($hideOriginal -eq $True)
			{
				# get all directory and files for specified root directory and hides original
				Get-ChildItem -Path $Path -Exclude $exclude -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# get all directory and files for specified root directory
				Get-ChildItem -Path $Path -Exclude $exclude -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
	}
}
Else
{
	IF ($recurse -eq $true)
	{
		IF ($fileOnly -eq $True)
		{
			IF ($hideOriginal -eq $True)
			{
				# create shortcuts for all files under specified root directory and subdirectories recursively and hides original files
				Get-ChildItem -Path $Path -Recurse -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# create shortcuts for all files under specified root directory and subdirectories recursively
				Get-ChildItem -Path $Path -Recurse -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
		Else
		{
			If ($hideOriginal -eq $True)
			{
				# get all directories under specified root directory and sub directories recursively and hides original files
				Get-ChildItem -Path $Path -Recurse -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# get all directories under specified root directory and sub directories recursively
				Get-ChildItem -Path $Path -Recurse -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
	}
	Else
	{
		IF ($fileOnly -eq $True)
		{
			IF ($hideOriginal -eq $True)
			{
				# get all directory and files for specified root directory and hides origianal files
				Get-ChildItem -Path $Path -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# get all directory and files for specified root directory
				Get-ChildItem -Path $Path -File | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
		Else
		{
			IF ($hideOriginal -eq $True)
			{
				# get all directory and files for specified root directory and hides original files
				Get-ChildItem -Path $Path -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save(); $_.Attributes = "Hidden" }
			}
			Else
			{
				# get all directory and files for specified root directory
				Get-ChildItem -Path $Path -Directory | ForEach-Object { $WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut("$Path2Shortcut\$_.lnk"); $Shortcut.TargetPath = $Path2Shortcut; $Shortcut.Save() }
			}
		}
	}
}
	