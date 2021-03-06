﻿workflow Suspend_Resume_PBI-Embedded
{
    Param 
    (    
        [Parameter(Mandatory=$true)] 
        [String] 
        $AzureResourceGroup,
        [Parameter(Mandatory=$true)] 
        [String] 
        $PowerBIEmbeddedName,
        [Parameter(Mandatory=$true)] 
        [Boolean] 
        $Suspend
    )  
    $connectionName = "AzureRunAsConnection" 
 
    try 
    { 
        # Get the connection "AzureRunAsConnection " 
        $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName          
 
        "Logging in to Azure..." 
        Add-AzureRmAccount -ServicePrincipal -TenantId $servicePrincipalConnection.TenantId -ApplicationId $servicePrincipalConnection.ApplicationId -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint  
              
    } 
    catch { 
        if (!$servicePrincipalConnection) 
        { 
            $ErrorMessage = "Connection $connectionName not found." 
            throw $ErrorMessage 
        } else{ 
            Write-Error -Message $_.Exception 
            throw $_.Exception 
        } 
    }

    #checking if the PowerBI Embedded Capacity Exisit 

    $IsPBEmbExisit=Test-AzureRmPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName

    if($IsPBEmbExisit -eq $true)
    {
        if($Suspend -eq $true )
        {
            try
            {
                #Suspending the Service 

                "Suspending $PowerBIEmbeddedName started"
                $SuspendOperation = Suspend-AzureRmPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -ResourceGroupName $AzureResourceGroup -PassThru
                "$PowerBIEmbeddedName is Suspended Successfully"
            }
            catch
            {
                    Write-Error -Message $_.Exception 
                    throw $_.Exception           
            }
            
        }
        else
        {
            try
            {  
                #Resuming the Service 

                "Resuming $PowerBIEmbeddedName"
                $ResumeOperation = Resume-AzureRmPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -ResourceGroupName $AzureResourceGroup -PassThru
                "$PowerBIEmbeddedName Resumed Successfully "
            }
            catch
            {
                    Write-Error -Message $_.Exception 
                    throw $_.Exception 
            }
        }

    }

    else
    {
        "The Provided Resource $PowerBIEmbeddedName doesnot exist"
    }

} 