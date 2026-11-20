# dotfiles

This is my personal setup `dotfiles`.

```sh
git clone https://github.com/duhow/dotfiles $HOME/.dotfiles
```

- Install `zsh`
- Run `install.sh` to download libraries and deps
- Reopen terminal and check `zsh` is running
- Run `source setup` to copy files to their location

## Karabiner-Elements (macOS)

`karabiner/` holds `karabiner.json` and `assets/complex_modifications`.
`source setup` copies them to `~/.config/karabiner` (backing up any existing `karabiner.json` first);
Karabiner-Elements reloads the file automatically.

To refresh the backup after changing rules:

```sh
cp ~/.config/karabiner/karabiner.json ~/.dotfiles/karabiner/
cp -R ~/.config/karabiner/assets ~/.dotfiles/karabiner/
```

## Projects used

[oh-my-zsh], [powerlevel10k], [SpaceVim]

[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[SpaceVim]: https://github.com/SpaceVim/SpaceVim
