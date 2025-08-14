[CmdletBinding()]
param (
    #accept pipeline input
    [Parameter(ValueFromPipeline)]
    [PsCustomObject]$UserObject,
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]$Name
)
# get local group membership for the user object

process {
    $Groups = Get-LocalGroup | Where-Object { $_.Members.Name -contains $Name }

    [PSCustomObject]@{
        Name   = $Name
        Groups = $Groups
    }

}