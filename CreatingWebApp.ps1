#Login To Azure
Connect-AzAccount

#Create Resource Group
New-AzResourceGroup -Name WebAppRG -Location canadacentral -Tag @{ "Env"="WebApp"; "Owner"="Roman" }


#Create an application service plan
New-AzAppServicePlan -Name WebAppSP -ResourceGroupName WebAppRG -Location canadacentral -Tier Free
New-AzWebApp -Name WebApp1793 -ResourceGroupName WebAppRG -Location canadacentral -AppServicePlan WebAppSP
Stop-AzWebApp -Name WebApp1793

