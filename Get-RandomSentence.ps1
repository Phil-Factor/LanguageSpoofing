<#
	.SYNOPSIS
		Picks out random sentences from JSON data that is formatted as a dictionary of arrays
	
	.DESCRIPTION
	this function takes a powershell object that has several keys representing phrase-banks,each 
    of which has an array that describes all the alternative components of a string and from it,
    it returns a string.
    basically, you give it a list of alternatives in an arreay and it selects one of them. 
    However, if you put in the name of an array as one of the alternatives,rather than 
    a word,it will, if it selects it, treat it as a new reference and will select one of 
    these alternatives.
	
	.PARAMETER AllPhraseBanks
	This is the powershell object with the phrasebanks.
	
	.PARAMETER bank
	The name of the phrase-bank to use
	
	.EXAMPLE
		Get-RandomSentence -AllPhraseBanks $MyPhrasebank -bank 'start'
        
        1..1000 | foreach{
	        Get-RandomSentence -AllPhraseBanks ($PhraseLists | convertfrom-Json) -bank 'note'
        }>'MyDirectory\notesAboutBooks.txt'

        
        1..10000 | foreach{
	        ConvertTo-TitleCase(
		        Get-RandomSentence -AllPhraseBanks ($PhraseLists | convertfrom-Json) -bank 'title')
        }>'Mydirectory\BookTitles.txt'
	
	.NOTES
		This function gets called recursively so imitates the elaborate
        recursion of normal written language and, to a lesser extent, speech.

#>
function Get-RandomSentence
{
	[CmdletBinding()]
	param
	(
		$AllPhraseBanks,
		$bank
	)
	
	$bankLength = $AllPhraseBanks.$bank.Length
	$return = ''
	$AllPhraseBanks.$bank[(Get-Random -Minimum -0 -Maximum ($bankLength - 1))] -split ' ' |
	foreach {
		if ($_[0] -eq '^')
		{
			$collection = $_.TrimStart('^');
			$endPunctuation = if ($collection.Trim() -match '[^\w]+') { $matches[0] }
			else { '' }
			$collection = $collection.TrimEnd(',.;:<>?/!@#$%&*()-_=+')
			$return += (Get-RandomSentence -AllPhraseBanks $AllPhraseBanks -bank $collection)+ $endPunctuation
		}
		else
		{ $return += " $($_)" }
	}
	$return
}


<#
	.SYNOPSIS
		Converts a phrase to Title Case, using current culture
	
	.DESCRIPTION
		Takes a string made up of words and gives it the same UpperCase letters as is conventional 
        with the title of books, chapter headings,  or films.
	
	.PARAMETER TheSentence
		This is the heading, sentence, book title or whatever
	
	.EXAMPLE
				PS C:\> ConvertTo-TitleCase -TheSentence 'to program I am a fish'
	
	.NOTES
		Phil Factor November 2020
#>
function ConvertTo-TitleCase
{
	param
	(
		[string]$TheSentence
	)
	
	$OurTextInfo = (Get-Culture).TextInfo
	$result = '';
	$wordnumber = 1
	$result += $TheSentence -split ' ' | foreach {
		if ($WordNumber++ -eq 1 -or $_ -notin ('of', 'in', 'to', 'for', 'with', 'on', 'at', 'from',
				'by', 'as', 'into', 'like', 'over', 'out', 'and', 'that', 'but', 'or', 'as', 'if',
				'when', 'than', 'so', 'nor', 'like',
				'once', 'now', 'a', 'an', 'the'))
		{
			$OurTextInfo.ToTitleCase($_)
		}
		else
		{ $OurTextInfo.ToLower($_) }
		
	}
	$result
}


