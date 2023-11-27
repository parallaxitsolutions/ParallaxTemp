<#
  .SYNOPSIS
  Deploys a web app to an existing Azure web app instance.

  .DESCRIPTION
  Uses a zip file to deploy a web app to an existing Azure web app instance

  .PARAMETER resourceGroup
  Specifies which Azure resoure group to deploy to

  .PARAMETER Subscription
  Specifies which subscription to target

  .EXAMPLE
  PS> .\Deploy-Content.ps1 -subscription 'Parallax Core' -resourceGroup 'aptitude_test_rg' -webappName 'parallaxtestapp-2611' -zipPath "..\content\AptitudeApp.zip" 

#>

param (
    [Parameter(Mandatory=$true)]
    [String] $subscription, 
    [Parameter(Mandatory=$true)]
    [String] $resourceGroup, 
    [Parameter(Mandatory=$true)]
    [String] $webappName, #Specifies the name of the webApp to deploy to
    [Parameter(Mandatory=$true)]
    [String] $zipPath #Species the relative path to the zip file
)



az webapp deploy --async false --clean true --subscription $subscription --resource-group $resourceGroup --name $webappName --restart true --src-path $zipPath 