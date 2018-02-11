#the goal is to find the only two numbers in each row where one evenly divides the other - that is, 
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
$SimpleInput = '5 2 9 8'
$rownumbers = @()
[int]$Count=0
[int]$i=0
[int]$j=0
[int]$c=-1
#[int]$DividedOutput=$null
[int]$number=$null
[int]$total=$null

foreach ($row in $PuzzleInput)
    {
    $rownumbers+=$row
    Write-host "This is a row: $row" -ForegroundColor Yellow
    $splitrownumbers=([int[]]($rownumbers[$j] -split '\s+' | where {$_ -match '.'}))
    Write-Host "This is a split row: $splitrownumbers" -ForegroundColor Cyan
    #$iterations=($splitrownumbers.length*$splitrownumbers.length)
    $j++

    foreach ($row in $rownumbers) {
 
        while ($Count -lt ($splitrownumbers.length*$splitrownumbers.length)){

        foreach ($number in $splitrownumbers)
            {            
            Write-host "Dividing $($splitrownumbers[$i]) by $($splitrownumbers[$c]) to determine if whole number..." -ForegroundColor Yellow

                #if($splitrownumbers[$i] -eq $splitrownumbers[$c] )
                  #  {

                   # Write-host "Numbers match, not checking if they are evenly divisible.." -ForegroundColor Red
                    #$Count++
                   # }

            $DividedTotal=$($splitrownumbers[$i])/$splitrownumbers[$c] 
            Write-host "That equals $DividedTotal!" -ForegroundColor Cyan
            $Remainder=$DividedTotal % 2
            Write-host "Remainder = $Remainder" -ForegroundColor Magenta                   
            $i++
            $c++

            if ($i -ige $splitrownumbers.length) {$i=-1}
            if ($c -ige $splitrownumbers.length) {$c=0}  


             if ($Remainder -eq 0)
                {

                write-host "Current divided output is even! ($DividedTotal), adding to total..." -ForegroundColor Green
                $total+=$DividedTotal

                }

             if ($Remainder -eq 1 -and $DividedTotal -eq 1) 
                    {
                
                    write-host "Current divided output is odd! But divided total was ($DividedTotal) so noy adding to total..." -ForegroundColor Red
                    #$total+=$DividedTotal

                    }
              
              if ($Remainder -eq 1 -and $DividedTotal -gt 1) 
                    {
                
                    write-host "Current divided output is odd! ($DividedTotal), adding to total..." -ForegroundColor Green
                    $total+=$DividedTotal

                    }

                    if ($Remainder -ne 1 -and $Remainder -ne 0)
                        {
                        #Write-Host "The current divided output is not whole..." -ForegroundColor Magenta
                        }
          $Count++
          
                    
            }
                                                                            }
    $Count=0
    Write-host "The total for that loop was $total" -ForegroundColor White    
                                                                                                 
                                  }
    }
                                    

write-host "The final total is $total" -ForegroundColor Green