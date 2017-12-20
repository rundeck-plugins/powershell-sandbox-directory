#Requires -Version 4

<#
.SYNOPSIS
  Sandbox Create
.DESCRIPTION
  Delete a Sandbox folder on a remote node
.PARAMETER Destination
    Destination
.PARAMETER Ident
    The identity string
.NOTES
  Version:        1.0.0
  Author:         Miguel
  Creation Date:  12/12/2017
  
#>

Param (
	[string]$Destination,
	[string]$Ident
)

Begin {
	try{

		If (-Not ( Test-Path $Destination) )
		{
			Write-Error "Error: destination path doesn't exists"
        	exit 1
		}

		$folder = $Destination + "\" + $Ident

		Write-Host "Deleting directory: $($folder)"

		If ( Test-Path $folder )
		{
			Remove-Item -Recurse -Force $folder  
		}else{

			Write-Error "Sandbox folder doesn't exists"
        	exit 1
		}

	}Catch{
        Write-Error "Error: $($_.Exception.Message) - Line Number: $($_.InvocationInfo.ScriptLineNumber)"
        exit 1
    }



}