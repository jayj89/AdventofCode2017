#For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.
#For example, given the following spreadsheet:

#5 1 9 5
#7 5 3
#2 4 6 8
#The first row's largest and smallest values are 9 and 1, and their difference is 8.
#The second row's largest and smallest values are 7 and 3, and their difference is 4.
#The third row's difference is 6.
#In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.

$puzzleinput = gc C:\Git\AdventofCode2017\Day2\Part1\PuzzleInput.txt
#$numbers = ([int[]]($puzzleinput -split ' ' | where {$_ -match '.'}))
$rownumbers = @()
#$splitrownumbers = @()
[int]$i=0
[int]$checksum=$null

foreach ($row in $puzzleinput)
    {
    
        $rownumbers+=$row        
        Write-Host "This is a row : $row"
        $splitrownumbers=([int[]]($rownumbers[$i] -split '\s+' | where {$_ -match '.'}))
        #.Split([System.StringSplitOptions]::RemoveEmptyEntries)))
        Write-Host "This is a split row: $splitrownumbers"
        $SortedSplitRowNumbers=$splitrownumbers | sort
        Write-Host "This is a sorted split row: $SortedSplitrownumbers"
        $checksum+=($SortedSplitrownumbers[-1]-$SortedSplitrownumbers[0])
        Write-Host "The current checksum is $checksum" -ForegroundColor Yellow
        #$splitrownumbers+=$splitrow
        $i++

    }

Write-Host "The final Checksum is $checksum" -ForegroundColor Green


#[int]$i= 0
#$splitrownumbers = @()    
#foreach ($_ in $rownumbers)
#    {
#
#    Write-Host "This is a Group: $group"
#     $splitgroup=([int[]]($rownumbers[$i] -split ' ' | where {$_ -match '.'}))     
#     Write-Host "This is a split row: $splitgroup"
#     $splitrownumbers+=$splitgroup
     #$i++
#    }
     