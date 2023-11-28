if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    Set-PSReadLineOption -HistorySearchCursorMovesToEnd

    # function prompt { "$pwd> " }`
    # Set-PSReadLineOption -PromptText '> ', 'X ' 

    oh-my-posh init pwsh | Invoke-Expression

    Set-PSReadLineKeyHandler -Chord Enter -Function ValidateAndAcceptLine
}
