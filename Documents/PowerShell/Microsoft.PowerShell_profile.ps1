if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    Set-PSReadLineOption -HistorySearchCursorMovesToEnd

    # function prompt { "$pwd> " }`
    # Set-PSReadLineOption -PromptText '> ', 'X ' 

    # oh-my-posh init pwsh | Invoke-Expression
    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/jandedobbeleer.omp.json" | Invoke-Expression


    Set-PSReadLineKeyHandler -Chord Enter -Function ValidateAndAcceptLine
}

function OneFuzz-Repro($jobId) {
    Push-Location ~/Downloads
    mkdir $jobId
    Set-Location $jobId
    onefuzz containers download_job $jobId
    onefuzz debug logs get --job_id $jobId
    Pop-Location
}
