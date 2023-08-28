workflow Suspend_Resume_PBI-Embedded
{
    Param 
    (
        [Parameter(Mandatory=$true)]   
        $SubscriptionId, 
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
    
    #Please enable appropriate RBAC permissions to the system identity of this automation account. Otherwise, the runbook may fail...

    try
    {
        "Logging in to Azure..." 
        Disable-AzContextAutosave -Scope Process 
        Connect-AzAccount -Identity
        $AzureContext = Set-AzContext -SubscriptionId $SubscriptionId    
    }
    catch {
        Write-Error -Message $_.Exception
        throw $_.Exception
    }

    #checking if the PowerBI Embedded Capacity Exisit 

    $IsPBEmbExisit = Test-AzPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -DefaultProfile $AzureContext

    if($IsPBEmbExisit -eq $true)
    {
        if($Suspend -eq $true )
        {
            try
            {
                #Suspending the Service 

                "Suspending $PowerBIEmbeddedName started"
                $SuspendOperation = Suspend-AzPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -ResourceGroupName $AzureResourceGroup -PassThru -DefaultProfile $AzureContext
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
                $ResumeOperation = Resume-AzPowerBIEmbeddedCapacity -Name $PowerBIEmbeddedName -ResourceGroupName $AzureResourceGroup -PassThru -DefaultProfile $AzureContext
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
