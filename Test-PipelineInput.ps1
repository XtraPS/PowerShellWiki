[CmdletBinding()]
param (
    #accept pipeline input
    [Parameter(ValueFromPipeline)]
    [PsObject]$inputObject
)
process {
    # Add a member to the inputobject pscustomobject
    
    $inputObject | Add-Member -MemberType NoteProperty -Name "Test_Property" -Value "Test_Value"
   
    $inputObject 
}



