#Login To Azure
Connect-AzAccount

#Create Resource Group
New-AzResourceGroup -Name WebAppRG -Location canadacentral -Tag @{ "Env"="WebApp"; "Owner"="Roman" }
$ScopeId = (Get-AzResourceGroup -Name WebAppRG).ResourceId

#Create an application service plan
New-AzAppServicePlan -Name WebAppSP -ResourceGroupName WebAppRG -Location canadacentral -Tier Free
New-AzWebApp -Name WebApp1793 -ResourceGroupName WebAppRG -Location canadacentral -AppServicePlan WebAppSP

#Creating a role assignment
az login
az ad sp create-for-rbac --name WebAppSvcAcc --role Contributor --scopes "$ScopeId" --sdk-auth

#Create ASP.NET core application
dotnet new WebApp

#Check .Net version
dotnet --version