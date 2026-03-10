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
    function Invoke-Starship-TransientFunction { "`e[38;2;245;169;127m❯ " } # same as "peach" in starship config
    Invoke-Expression (&starship init powershell)
    Enable-TransientPrompt

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

# Assume programs print UTF-8 (default $OutputEncoding)
[System.Console]::OutputEncoding = $OutputEncoding
