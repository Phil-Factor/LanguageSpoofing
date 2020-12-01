Invoke-Expression "$pwd\Get-RandomSentence.ps1"
$PhraseLists = get-content "$pwd\HumanitiesPublications.json"

        1..1000 | foreach{
	        Get-RandomSentence -AllPhraseBanks ($PhraseLists | convertfrom-Json) -bank 'note'
        }>"$($env:HOMEDRIVE)$($env:homepath)\documents\notesAboutBooks.txt"
        
        1..10000 | foreach{
	        ConvertTo-TitleCase(
		        Get-RandomSentence -AllPhraseBanks ($PhraseLists | convertfrom-Json) -bank 'title')
        }>"$($env:HOMEDRIVE)$($env:homepath)\documents\BookTitles.txt"
