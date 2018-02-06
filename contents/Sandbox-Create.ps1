#Requires -Version 4

<#
.SYNOPSIS
  Sandbox Create
.DESCRIPTION
  Create a Sandbox folder on a remote node
.PARAMETER Destination
    Destination
.PARAMETER Ident
    The identity string
 .PARAMETER Print
    Print sandbox on data passing format
.NOTES
  Version:        1.0.0
  Author:         Rundeck
  Creation Date:  12/12/2017
  
#>

Param (
	[string]$Destination,
	[string]$Ident,
	[string]$Print
)

Begin {
	try{

		If (-Not ( Test-Path $Destination) )
		{
			Write-Host "Creating base folder: $($Destination)"
			New-Item $Destination -ItemType Directory
		}

		$folder = $Destination + "\" + $Ident

		Write-Host "Creating directory: $($folder)"

		If ( Test-Path $folder )
		{
			Write-Error "Sandbox folder already exists"
        	exit 1
		}else{

			New-Item -type directory -Path $folder  

		}

		if($Print -eq "true"){
            Write-Host "RUNDECK:DATA:sandbox.path=$($folder)"
            Write-Host "RUNDECK:DATA:sandbox.base=$($Destination)"
            Write-Host "RUNDECK:DATA:sandbox.ident=$($Ident)"
        }


	}Catch{
        Write-Error "Error: $($_.Exception.Message) - Line Number: $($_.InvocationInfo.ScriptLineNumber)"
        exit 1
    }



}