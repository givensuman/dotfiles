My Neovim configuration files, built off of the ~~AstroNvim~~ LazyVim framework.

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/givensuman/nvimrc ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### Instantiate your own version control

```shell
cd ~/.config/nvim/
rm -rf .git
git init
```

![Screenshot from 2024-06-01 12-01-33](https://github.com/givensuman/nvimrc/assets/16063606/3ab28911-af5c-4e6c-98ef-88776e769b1b)
