workflow Suspend_Resume_PBI-Embedded
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
        "Logging in to Azure..."
        Connect-AzAccount -Identity
    }
    catch {
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
    
    #checking if the PowerBI Embedded Capacity Exisit 

    $IsPBEmbExisit=Test-AzPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName

    if($IsPBEmbExisit -eq $true)
    {
        if($Suspend -eq $true )
        {
            try
            {
                #Suspending the Service 

                "Suspending $PowerBIEmbeddedName started"
                $SuspendOperation = Suspend-AzPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -ResourceGroupName $AzureResourceGroup -PassThru
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
                $ResumeOperation = Resume-AzPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -ResourceGroupName $AzureResourceGroup -PassThru
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