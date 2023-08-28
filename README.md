Suspend_Resume_PBI-Embedded by Single resource
==============================================

            

This script suspends/Resume the PowerBI  Embedded Capacity in Azure by a given PBE resource name.


 


**Pre-Requisites **


  *  Install [[Az.PowerBIEmbedded]](https://www.powershellgallery.com/packages/Az.PowerBIEmbedded/1.2.1) module

  *  You have to create your automation account with a Managed Identity.

 


**Parameters for the Script **

 
SubscriptionId
  *  **SubscriptionId :** The Subscription Id Automation Account & PowerBI Embedded Capacity which you want to Suspend or Resume.

  *  **PowerBIEmbeddedName :** The Name of the PowerBI Embedded Capacity which you want to Suspend or Resume.

  *  **AzureResourceGroup :** Name of the Azure Resource Group where the PowerBI Embedded capacity Resides

  *  **Suspend: ** 

**True **- If we want to Suspend ;


**False **- If we want to resume the PBI Capacity


 


 

 

 


        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
