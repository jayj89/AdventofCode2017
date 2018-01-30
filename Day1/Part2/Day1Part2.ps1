#The captcha requires you to review a sequence of digits (your puzzle input) Now, instead of considering the next digit, it wants you to consider the digit halfway around the circular..
##..list. That is, if your list contains 10 items, only include a digit in your sum if the digit 10/2 = 5 steps forward matches it. 
##..Fortunately, your list has an even number of elements.

#For example:

#1212 produces 6: the list contains 4 items, and all four digits match the digit 2 items ahead.
#1221 produces 0, because every comparison is between a 1 and a 2.
#123425 produces 4, because both 2s match each other, but no other digit has a match.
#123123 produces 12.
#12131415 produces 4.
#What is the solution to your captcha?

[int]$Counter = -1
#[int]$HalfwayCounter = 0
[int]$Number
[int]$Results = $null

$puzzleinput = gc S:\Prod\AdventOfCode\JayJ\AdventofCode2017\Day1\Part2\PuzzleInput.txt
#$simpleinput = "1111"

$numbers = ([int[]]($puzzleinput -split '' | where {$_ -match '.'}))
[int]$halfway = $numbers.length/2
#$simplenumber = ([int[]]($simpleinput -split '' | where {$_ -match '.'}))

foreach ($number in $numbers)
    {
        #$HalfwayCounter+=$halfway
        Write-Host "The current number is $number" -ForegroundColor Cyan                       
        Write-Host "The current number $halfway digits ahead of $number (halfway) is $($numbers[$halfway])"
        
        if($number -eq $numbers[$halfway])
        {
        Write-host " $number matched $($numbers[$halfway])! Adding to total.." -ForegroundColor Green
        $Results += ($number+$($numbers[$halfway]))
        Write-host "The current total is $Results" -ForegroundColor Magenta

        }
            else
                {
                Write-Host " $number and $($numbers[$halfway]) didnt match, moving on.." -ForegroundColor Yellow
                }
                $halfway++
    }
Write-host "The results are $Results"
        
        
        



