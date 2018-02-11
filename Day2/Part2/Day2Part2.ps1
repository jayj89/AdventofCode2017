﻿#the goal is to find the only two numbers in each row where one evenly divides the other - that is, 
#where the result of the division operation is a whole number. They would like you to find those numbers
#on each line, divide them, and add up each line's result.

#5 9 2 8
#9 4 7 3
#3 8 6 5
#In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
#In the second row, the two numbers are 9 and 3; the result is 3.
#In the third row, the result is 2.
#In this example, the sum of the results would be 4 + 3 + 2 = 9

$puzzleinput = gc C:\Git\AdventofCode2017\Day2\Part2\PuzzleInput.txt
$SimpleInput = '8 4 2 12'
$rownumbers = @()
[int]$i=0
[int]$c=-1
#[int]$DividedOutput=$null
[int]$number=$null
[int]$total=$null

foreach ($row in $SimpleInput)
    {
    $rownumbers+=$row
    Write-host "This is a row: $row" -ForegroundColor Yellow
    $splitrownumbers=([int[]]($rownumbers[$i] -split '\s+' | where {$_ -match '.'}))
    Write-Host "This is a split row: $splitrownumbers" -ForegroundColor Cyan
    #$iterations=($splitrownumbers.length*$splitrownumbers.length)
 
        foreach ($number in $splitrownumbers)
            {
            Write-host "Dividing $($splitrownumbers[$i]) by $($splitrownumbers[$c]) to determine if whole number..." -ForegroundColor Yellow
            $DividedTotal=$($splitrownumbers[$i])/$splitrownumbers[$c] 
            Write-host "That equals $DividedTotal!" -ForegroundColor Cyan
            $Remainder=$DividedTotal % 2
            Write-host "Remainder = $Remainder" -ForegroundColor Magenta                   
            $c++


             if ($Remainder -eq 0)
                {

                write-host "Current divided output is even! ($DividedTotal), adding to total..." -ForegroundColor Green
                $total+=$DividedTotal

                }

              if ($Remainder -eq 1) 
                    {
                
                    write-host "The current divided output is odd ($DividedTotal), not adding to total, moving on..." -ForegroundColor Cyan

                    }

                    if ($Remainder -ne 1 -and $Remainder -ne 0)
                        {
                        Write-Host "The current divided output is not whole..." -ForegroundColor Magenta
                        }
          
                    
            }

    }

write-host "The final total is $total" -ForegroundColor Green