### a tidy lil zsh theme

It's based on the [refined](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/refined.zsh-theme) theme built into the Oh-My-Zsh framework. And by "based" I mean I copied the file and made a few tweaks to my liking. I can't find that theme's author, but full credit goes to them. This theme is also, by the transitive property, based off of the [Pure](https://github.com/sindresorhus/pure) theme by Sindre Sorhus and the [nicoulaj](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/nicoulaj.zsh-theme) theme by Julien Nicoulaud. It's zsh themes all the way down, baby.

Requires a patched [Nerd Font](https://github.com/ryanoasis/nerd-fonts) for proper icon rendering.

![appatheme](https://github.com/givensuman/appa-zsh-theme/assets/16063606/8564a4ef-0a1b-44c7-bcaa-15d6991ad753)

The screenshot above uses the [SFMono Nerd Font](https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized), and the [tokyo-night](https://github.com/zatchheems/tokyo-night-alacritty-theme) Alacritty theme. The [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) plugin is also being featured.

### Installing

#### Oh-My-Zsh
Run the following command
```shell
git clone https://github.com/givensuman/appa-zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom/}themes
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

### License
You know the drill, do whatever you want with this.

### Appa
Named after my cutie-patootie dog, Appa
![20220531_173716(0)](https://github.com/givensuman/appa-zsh-theme/assets/16063606/8c184107-78dd-4c0c-86eb-4dc270601987)
