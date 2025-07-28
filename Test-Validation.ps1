

function Test-Validation {
    param(
        [ValidateSet("System", "Application")]
        [string]$LogName,
        [ValidateRange(1, 100)]
        [int]$MaxEvents,
        [ValidateScript({ $_ -in (Get-WinEvent -ListProvider * | where { $_. }) })]
        [ArgumentCompleter({ Get-Content .\Computers.txt })]
        [string]$ComputerName
    )

    Get-WinEventLog -LogName $LogName -Newest $MaxEvents -ComputerName $ComputerName
    
}

# Get windows event provider names

# Get 2 hours ago
$TwoHoursAgo = (Get-Date).AddHours(-2)