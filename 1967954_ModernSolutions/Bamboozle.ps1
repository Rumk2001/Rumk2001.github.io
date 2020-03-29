$Path ="."
$Counter= 0
$Letter = (65..90)+(97..122)|Get-Random -Count 1|%{[Char]$_} 
function Bamboozle([string] $Letter,[string] $Path,[Int] $Counter)
{ 
    $Check =0
    While($Counter -eq $Check)
    {
        foreach($file in Get-ChildItem $Path)
        {
            if($file.Name.Contains($Letter))
            {
                if($Counter -eq $Check)
                {
                    Write-Host -BackgroundColor Black -ForegroundColor Red "FOOOLLL, I SEE YOU HAVE CHOSEN DEATH. now PERISH By THE LETTER $Letter"
                }
                $file |Remove-Item -WhatIf  
                $Counter++
            }
        }
        Write-Host "The Previous Letter was $Letter but was saldy regected"
        $Letter = (65..90)+(97..122)|Get-Random -Count 1|%{[Char]$_} 
    }
}
Bamboozle $Letter $Path $Counter 