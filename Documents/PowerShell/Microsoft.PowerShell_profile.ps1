if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    # Set-PSReadLineOption -PredictionViewStyle ListView # use F2 to switch

    # function prompt { "$pwd> " }`
    # Set-PSReadLineOption -PromptText '> ', 'X ' 

    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin.omp.json" | Invoke-Expression

    Set-PSReadLineKeyHandler -Chord Enter -Function ValidateAndAcceptLine
    
    if ($null -ne (Get-Command rustup -ErrorAction SilentlyContinue)) {
        rustup completions powershell | Out-String | Invoke-Expression
    }
}


function OneFuzz-Repro($jobId) {
    Push-Location ~/Downloads
    mkdir $jobId
    Set-Location $jobId
    onefuzz containers download_job $jobId
    onefuzz debug logs get --job_id $jobId
    Pop-Location
}

# Assume programs print UTF-8 (default $OutputEncoding)
[System.Console]::OutputEncoding = $OutputEncoding