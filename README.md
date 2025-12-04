dotfiles
========

My config files, for easy cross-computer synchronization.

https://www.chezmoi.io/

## Setup

1. `winget configure --enable` (wait!)
2. `winget configure -f configuration.yaml`
3. `chezmoi init https://github.com/Porges/dotfiles.git`
4. `chezmoi diff`
5. `chezmoi apply -v`

