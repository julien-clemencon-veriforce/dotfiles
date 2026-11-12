# Developer Mise en Place

These are my dotfiles.
Targets macOS on Apple Silicon (Homebrew in `/opt/homebrew`).

- One command installs and links everything: [mise](https://mise.jdx.dev)'s `bootstrap`, configured in [mise.toml](./mise.toml)
- Declarative: packages, CLI tools, symlinks, shell setup and macOS defaults live in config files
- Safe to rerun: `mise bootstrap` applies only what changed, and `--dry-run` previews it
- `~/.zshrc` stays the machine's own file; the repo manages only blocks inside it
- One small shell config file per tool
- macOS defaults for the Dock, Finder, keyboard, trackpad and screenshots

## Packages Overview

- [Homebrew](https://brew.sh) formulae and casks (packages: `[bootstrap.packages]` in [mise.toml](./mise.toml))
- [mise](https://mise.jdx.dev) global CLI tools (packages: `[tools]` in [config/mise/config.toml](./config/mise/config.toml)), such as `gh`, `neovim`, `ripgrep`, `fzf`, `bat`, `eza`, `lazygit` and `starship`
- Terminal: [Ghostty](https://ghostty.org) with JetBrains Mono Nerd Font, [Starship](https://starship.rs) prompt, [zoxide](https://github.com/ajeetdsouza/zoxide) and [atuin](https://atuin.sh)
- Editor: Neovim with [LazyVim](https://www.lazyvim.org) (`EDITOR`, `VISUAL` and the `vim` alias)

## Layout

| Path | What it holds |
| --- | --- |
| [mise.toml](./mise.toml) | The bootstrap: Homebrew formulae and casks, dotfile links, shell activation, macOS defaults |
| [config/](./config) | Application configs, linked into `~/.config` |
| [config/mise/](./config/mise) | Global CLI tools, linked to `~/.config/mise` so they're on `PATH` everywhere |
| [config/git/](./config/git) | Global git config (`config`) and global ignore (`ignore`), linked to `~/.config/git` |
| [config/zsh/](./config/zsh) | Shell config split per tool, plus `clemencon.zsh` for personal aliases, linked to `~/.config/zsh` (see [Shell](#shell)) |
| [config/nvim/](./config/nvim) | [LazyVim starter](https://github.com/LazyVim/starter) plus overrides in `lua/plugins/` and extras in `lazyvim.json`, linked to `~/.config/nvim` (see [Neovim](#neovim)) |

## Installation

On a fresh macOS install:

```sh
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools include `git` and a compiler for formulae without a prebuilt bottle.

1. Install mise:

```sh
curl -fsSL https://mise.run | sh
```

1. Clone this repo:

```sh
git clone <this-repo> ~/Developer/dotfiles
```

1. Trust the config, preview the changes, then apply them:

```sh
cd ~/Developer/dotfiles
~/.local/bin/mise trust
~/.local/bin/mise bootstrap --dry-run
~/.local/bin/mise bootstrap
```

This installs the [packages listed above](#packages-overview), links the [config](./config) files, wires up the shell and applies the macOS defaults.
Then open a new shell.

## Everyday use

| Task | Command |
| --- | --- |
| Apply config changes | `mise bootstrap` (from this directory) |
| Upgrade mise, packages, and tools | `miseup` (alias for `mise self-update && mise -C ~/Developer/dotfiles bootstrap --upgrade`) |
| Add a CLI tool | `mise use -g <tool>` (writes to `config/mise/config.toml`) |
| Add an app or formula | Add a `brew-cask:` or `brew:` entry to `mise.toml`, then `mise bootstrap` |
| Check state | `mise bootstrap status` |
| Run one part only | `mise bootstrap --only packages` (or `dotfiles`, `macos-defaults`, `tools`, …) |

Removing an entry doesn't uninstall it. Preview cleanup with `mise bootstrap packages prune --dry-run`.

## Shell

`~/.zshrc` isn't in the repo.
It stays the machine's own file; bootstrap adds two managed blocks to it:

1. `mise:activate`, from `[bootstrap.mise_shell_activate]`
2. `mise:config`, from the `"~/.zshrc/config"` entry in `mise.toml`, with one `source ~/.config/zsh/<file>.zsh` line per file in `config/zsh/`

To add a tool:

1. Create `config/zsh/<tool>.zsh`.
2. Add `source ~/.config/zsh/<tool>.zsh` to the `"~/.zshrc/config"` block in `mise.toml`.
3. Run `mise dot apply ~/.zshrc` and open a new shell.

Editing an existing file in `config/zsh/` needs no apply: open a new shell or run `source ~/.zshrc`.

Installers that append to `~/.zshrc` write outside the managed blocks. Move those lines into `config/zsh/` to keep them.
