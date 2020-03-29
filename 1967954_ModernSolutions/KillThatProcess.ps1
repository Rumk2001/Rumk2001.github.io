$NumOfProcesses = 420
$NameOfApp = "Notepad"
KillThatProcess $NameOfApp $NumOfProcesses
function KillThatProcess([string] $NameOfApp, [int] $NumOfProcesses)
{
    Set-Location -Path C:\
    $Location = "C:\Windows\System32"
    $Process= Get-Process $NameOfApp -ea Ignore 
    $NumOfProcesses -eq $Process.Count

    $Userinput = Read-Host -Prompt "There are $NumOfProcesses processes with the name of $NameOfApp, proceed? Y/N"
    if(($Userinput -eq "y") -or ($Userinput -eq "Y"))
    {
        cd $Location
        $Process | Stop-Process
        Write-Host -ForegroundColor Green "Wait While Murdering Programs ..."
        Write-Host -ForegroundColor Blue "Murdering Completed"
    }
    else
    {
        Write-Host -BackgroundColor White -ForegroundColor Red "You Have Chosen Death"
    }

}
