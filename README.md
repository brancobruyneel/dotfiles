# My personal dotfiles

## Dependencies

### Neovim

Nerd font

```
yay -S nerd-fonts-hack
```

Neovim version 5.0+

```
yay -S neovim-nightly-bin
```

Plugin manager: [packer.nvim](https://github.com/wbthomason/packer.nvim)

```
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

#### Optional

If you want to use :LspInstall for installing language servers you will need npm.

```
pacman -S npm
```

To install `npm` packages globally without sudo follow [this](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md) guide
