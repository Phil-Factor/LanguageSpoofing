<# first, find out where we were executed from each environment has a different way
of doing it. It all depends how you execute it #>
try {
$executablepath = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition) }
catch{$executablepath -eq ''}
if ($executablepath -eq '')
{
	$executablepath = "$(If ($psISE)
		{ Split-Path -Path $psISE.CurrentFile.FullPath }
		Else { $global:PSScriptRoot })"
}
"$executablepath\Get-RandomSentence.ps1"
& "$executablepath\Get-RandomSentence.ps1"
$PhraseLists = get-content "$executablepath\HumanitiesPublications.json"

1..1000 | foreach{
	Get-RandomSentence -AllPhraseBanks ($PhraseLists | convertfrom-Json) -bank 'note'
}>"$($env:HOMEDRIVE)$($env:homepath)\documents\notesAboutBooks.txt"

1..10000 | foreach{
	ConvertTo-TitleCase(
		Get-RandomSentence -AllPhraseBanks ($PhraseLists | convertfrom-Json) -bank 'title')
}>"$($env:HOMEDRIVE)$($env:homepath)\documents\BookTitles.txt"

