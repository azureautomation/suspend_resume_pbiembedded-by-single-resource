Suspend_Resume_PBI-Embedded by Single resource
==============================================

            

This script suspends/Resume the PowerBI  Embedded Capacity in Azure by a given PBE resource name.


 


**Pre-Requisites **


  *  Install [Az.PowerBIEmbedded](https://learn.microsoft.com/en-us/powershell/module/az.powerbiembedded) module

  *  You have to create your automation account as System-assigned managed identity feature, since this script uses Connect-AzAccount for authentication against Azure.


 


**Parameters for the Script **


 


  *  **PowerBIEmbeddedName :** The Name of the PowerBI Embedded Capacity which you want to Suspend or Resume.

  *  **AzureResourceGroup :** Name of the Azure Resource Group where the PowerBI Embedded capacity Resides

  *  **Suspend: ** 

**True **- If we want to Suspend ;


**False **- If we want to resume the PBI Capacity


 


 

 

 


        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
