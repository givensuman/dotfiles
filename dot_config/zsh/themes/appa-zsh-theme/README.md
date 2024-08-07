### a tidy lil zsh theme

_As seen on [Awesome](https://github.com/unixorn/awesome-zsh-plugins)!_

It's based on the [refined](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/refined.zsh-theme) theme built into the Oh-My-Zsh framework. And by "based" I mean I copied the file and made a few tweaks to my liking. I can't find that theme's author, but full credit goes to them. This theme is also, by the transitive property, based off of the [Pure](https://github.com/sindresorhus/pure) theme by Sindre Sorhus and the [nicoulaj](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/nicoulaj.zsh-theme) theme by Julien Nicoulaud. It's zsh themes all the way down, baby.

Adds version control, virtual environment, and command execution time information to your prompt. Requires a patched [Nerd Font](https://github.com/ryanoasis/nerd-fonts) for proper icon rendering.

![appazsh](https://github.com/user-attachments/assets/39861b58-ade3-4cb5-b556-c9af9c5c619d)

The screenshot above uses the [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack), and the [Catppuccin](https://github.com/catppuccin/alacritty) Alacritty theme. The [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) plugin is also being featured.

### Installing

#### Oh-My-Zsh

Run the following command

```shell
git clone https://github.com/givensuman/appa-zsh-theme
cp appa-zsh-theme/appa.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
```

and add `ZSH_THEME="appa"` to your `~/.zshrc`

#### zplug

Add the following to your `~/.zshrc`

```shell
zplug 'givensuman/appa-zsh-theme', as:theme
```

#### zinit

Add the following to your `~/.zshrc`

```shell
zinit ice depth "1"
zinit light givensuman/appa-zsh-theme
```

### Customizing

You can change the prompt icon and color by modifying `APPA_ZSH_THEME_PROMPT_COLOR` and `APPA_ZSH_THEME_PROMPT_ICON` environment variables, such as adding this to your `~/.zshrc`

```shell
export APPA_ZSH_THEME_PROMPT_COLOR="yellow"
export APPA_ZSH_THEME_PROMPT_ICON="$"
```

### License

You know the drill, do whatever you want with this.

### Appa

Named after my cutie-patootie dog, Appa

![20220531_173716(0)](https://github.com/givensuman/appa-zsh-theme/assets/16063606/8c184107-78dd-4c0c-86eb-4dc270601987)
