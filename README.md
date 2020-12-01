# LanguageSpoofing


This is designed to make it easy to generate realistic, fake text in SQL or PowerShell.

## In SQL
We need one view (Ran) and a function (FromSentence) to do the main work. I don't mean a function to do each column, but one, with a suitable input, to do all text fields. This function uses some up-to-date features in SQL Server 2017 onwards, so apologies to anyone stuck on previous releases.

First, we need a 'disruptive' view that produces a non-determinant function. This is something you normally don't want. For performance reasons, you need a function that produces the same output when provided the same values in its parameters. For random values you want entirely the opposite. Obviously, use non-deterministic functions with care.

## In PowerShell

The PowerShell code is, unsurprisingly, a lot easier than SQL. The only components I've written is one to generate the text and another to capitalise it to title text. It takes exactly the same format of JSON file.

## The files

This includes the following files

| Filename  | Why it is there|
| ------------- | ------------- |
| Get-RandomSentence.ps1 | This is the PowerShell  version of the code that actually generates sentences |
| HumanitiesPublications.json | This is the phrase-bank used to generate phrase-banks of Publications and their notes in Humanities |
| OriginalPubsBuild.sql |  The build script for the original Pubs |
| OriginalPubsData.sql | The data script for the original Pubs |
| RunGeneration.ps1 |  This is the PowerShell script that actually generates lists of titles and notes |
| SentenceFrom.sql | the source code for the SQL Server version of the phrase generator |
| TestRandomSentenceGenerator.sql | the SQL Code used to test the codew to ensure that it works |
| TitleCase.sql | the sql source for the code that properly cases it in title case |
