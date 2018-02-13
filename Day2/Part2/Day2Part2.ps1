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

$puzzleinput = gc D:\jayj\AdventofCode2017\Day2\Part2\PuzzleInput.txt
$SimpleInput = '8 9 8 2'
$rownumbers = @()
[int]$i=0
[int]$c=-1
[int]$r=0
#[int]$DividedOutput=$null
[int]$number=$null
[int]$total=0

foreach ($row in $puzzleInput)
    {
    $rownumbers+=$row
    Write-host "This is a row: $row" -ForegroundColor Yellow
    $splitrownumbers=([int[]]($rownumbers[$r] -split '\s+' | where {$_ -match '.'}))
    Write-Host "This is a split row: $splitrownumbers" -ForegroundColor Cyan
    #$iterations=($splitrownumbers.length*$splitrownumbers.length)
    $r++

        foreach ($number in $splitrownumbers)
            {

                foreach ($secondnumber in ($splitrownumbers | ? {$_ -ne $number}))
                    {

                   if ($secondnumber/$number -notmatch '\.')                  
                    {

                    $DividedTotal=$secondnumber/$number
                    Write-host " Divided total = $DividedTotal" -ForegroundColor Cyan
                    Write-host " $($secondnumber) divided by $($number) equalled a whole number ($DividedTotal)! Adding to $Dividedtotal to total..." -ForegroundColor Green
                    $total+=$Dividedtotal
                       
                    }

                         else
                            {
                            $DividedTotal=$secondnumber/$number
                            Write-host " Divided total = $DividedTotal" -ForegroundColor Cyan
                            Write-host " $($secondnumber) divided by $($number) equalled a fraction! Not Adding to total..." -ForegroundColor Yellow

                            }
                    }


            #Write-host "Dividing $($splitrownumbers[$i]) by $($splitrownumbers[$c]) to determine if whole number..." -ForegroundColor Yellow
            #Write-host "Dividing $($splitrownumbers[$i]) by $($splitrownumbers[$c]) to determine if whole number..." -ForegroundColor Yellow
            #$DividedTotal=$($splitrownumbers[$i])/$splitrownumbers[$c] 
            #Write-host "That equals $DividedTotal!" -ForegroundColor Cyan
            #$Remainder=$DividedTotal % 2
            #Write-host "Remainder = $Remainder" -ForegroundColor Magenta                   
            #$i++
            #$c++

            }
                               
    }

write-host "The final total is $total" -ForegroundColor Green

#$number
#$numbers
#foreach ($number in $numbers)
#{
#    foreach ($secondnumber in ($numbers | ? {$_ -ne $number}))
#    {
#        if ($number % $number
#    }
#}

             #if ($Remainder -eq 0)
                #{

                #write-host "Current divided output is even! ($DividedTotal), adding to total..." -ForegroundColor Green
                #$total+=$DividedTotal

                #}

                  #if ($Remainder -eq 1 -and $DividedTotal -eq 1) 
                    #{
                
                    #write-host "Current divided output is odd! But divided total was ($DividedTotal) so not adding to total..." -ForegroundColor Red
                    #$total+=$DividedTotal

                    #}
              
                        #if ($Remainder -eq 1 -and $DividedTotal -gt 1) 
                        #{
                
                        #write-host "Current divided output is odd! ($DividedTotal), adding to total..." -ForegroundColor Green
                        #$total+=$DividedTotal

                        #}
                        
                #    if ($Remainder -ne 1 -and $Remainder -ne 0)
               #         {
              #          Write-Host "The current divided output is not whole..." -ForegroundColor Magenta
             #           }
            #    }
                    
           # }  