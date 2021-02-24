# My personal dotfiles

## Dependencies

### Neovim

A nerd font
`yay -S nerd-fonts-hack`

Neovim version 5.0+
`yay -S neovim-nightly-bin`

packer.nvim

```
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

#### Optional

If you want to use :LspInstall for installing language servers you will need npm.

`pacman -S npm`

Install `npm` packages globally without sudo

###### 1. Create a directory for global packages

```sh
mkdir "${HOME}/.npm-packages"
```

###### 2. Tell `npm` where to store globally installed packages

```sh
npm config set prefix "${HOME}/.npm-packages"
```

###### 3. Ensure `npm` will find installed binaries and man pages

Add the following to your `.bashrc`/`.zshrc`:

```sh
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
```
