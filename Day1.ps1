#The captcha requires you to review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.

#For example:

#1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
#1111 produces 4 because each digit (all 1) matches the next.
#1234 produces 0 because no digit matches the next.
#91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
#What is the solution to your captcha?

[int]$Counter = -2
[int]$Number
$Results = $null

$puzzleinput = gc S:\Prod\AdventOfCode\JayJ\PuzzleInput.txt
$simpleinput = "1111"

$numbers = ([int[]]($puzzleinput -split '' | where {$_ -match '.'}))
$simplenumber = ([int[]]($simpleinput -split '' | where {$_ -match '.'}))

foreach ($number in $numbers)
    {
        $Counter++
        
        if($number -eq $numbers[$Counter])
        {

        $Results += $number

        }
            else
                {
                }
    }
Write-host "The results are $results"
        
        
        



