# Copilot Instructions

## Architecture

This is a macOS dotfiles repository. It has two main components:

- **`homedir/`** — Config files that get synced to `$HOME`. The directory structure inside `homedir/` mirrors `$HOME` exactly (e.g., `homedir/.config/fish/config.fish` → `~/.config/fish/config.fish`).
- **`sync.sh`** — Uses `rsync` to deploy configs. Default direction is repo → home. The `-u` flag reverses it (home → repo), syncing only files that already exist in the repo.

Homebrew packages and Mac App Store apps are declared in `Brewfile`. Personal-only packages live in `homedir/Brewfile.personal`, which the master `Brewfile` sources via a `brewfile` directive. On work machines, `sync.sh -w` excludes `Brewfile.personal` from deployment.

## Setup

```sh
brew bundle        # install all packages
./sync.sh          # deploy configs to $HOME
./sync.sh -w       # deploy configs, excluding personal packages
./sync.sh -u       # pull updated configs back from $HOME into repo
```

## Conventions

- **Adding a new config**: Place it under `homedir/` at the exact path it should occupy relative to `$HOME`. It will be deployed on the next `./sync.sh` run.
- **Git config**: `homedir/.gitconfig` uses `[include] path = .gitconfig.local` for machine-specific settings (name, email, signing keys). Never put personal identity info in the tracked `.gitconfig`.
- **Neovim**: `init.vim` sources `~/.vimrc` — all vim configuration lives in the shared `.vimrc`, not duplicated in the nvim config.
- **Shell**: Both bash (`.bash_profile`) and fish (`config.fish`) are configured. Fish is the primary shell. Both define the same aliases (`p`=pushd, `o`=popd, colored grep). Keep aliases in sync across both shells.
- **Vim plugins**: Managed via vim-plug in `.vimrc`. Linting uses ALE with language-specific linters/fixers configured inline.
- **Indentation**: 2 spaces (set in `.vimrc` as the default; Python uses 4, Go uses tabs).
