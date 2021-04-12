# My personal dotfiles

## Dependencies

### Neovim

#### :camera_flash: Example Screenshots

![telescope](./Pictures/screenshots/test4.png)
![lsp](./Pictures/screenshots/test5.png)

Nerd font

```
paru -S nerd-fonts-hack
```

Neovim version 5.0+

```
paru -S neovim-nightly-bin
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

## Quick Neovim setup guide

### Installation

Copy the `.config/nvim` folder to your nvim config location.

```sh
git clone https://github.com/BrancoBruyneel/dotfiles.git
cp -r dotfiles/.config/nvim ~/.config
```

Open nvim and press `y` to install `packer.nvim`.

Next restart `nvim` and install the plugins by executing the `:PackerInstall` command.
