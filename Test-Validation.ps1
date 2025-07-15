

("Server01", "Server02", "Server03") | Out-File -FilePath .\servers.txt
function Test-Validation {
    param(
        [ValidateSet("System", "Application", "Security")]
        [string]$LogName,
        [ValidateRange(1, 100)]
        [int]$MaxEvents,
        [ValidateScript({ $_ -in Get-Content .\servers.txt })]
        [ArgumentCompleter({ Get-Content .\servers.txt })]
        [string]$ComputerName
    )

    Get-WinEventLog -LogName $LogName -Newest $MaxEvents -ComputerName $ComputerName
    
}