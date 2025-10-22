if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    # Set-PSReadLineOption -PredictionViewStyle ListView # use F2 to switch

    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin.omp.json" | Invoke-Expression
    $env:STARSHIP_CONFIG = "$HOME/.config/starship.toml"
    Invoke-Expression (&starship init powershell)
    Invoke-Expression (& { (zoxide init powershell | Out-String) })

    Set-PSReadLineKeyHandler -Chord Enter -Function ValidateAndAcceptLine

    if ($null -ne (Get-Command rustup -ErrorAction SilentlyContinue)) {
        Invoke-Expression (rustup completions powershell | Out-String)
    }

    if ($null -ne (Get-Command jj -ErrorAction SilentlyContinue)) {
        Invoke-Expression (jj util completion power-shell | Out-String)
    }

    # imported last so it doesn't override the prompt
    # I only want it for completions
    Import-Module posh-git
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
