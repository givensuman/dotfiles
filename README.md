### dotfiles
these are my dotfiles with a bit of sauce to help organize them

the `track.toml` file lists files that will be tracked. in under the field `["track"]`, each key will be a path on my system and each value will be a list of corresponding files or directories. so, for example:

```toml
["track"]

"~" = [".tool-versions"]

"~/.config/" = [
  "bat",
  "cosmic",
  "fish",
  "ghostty",
  "lazygit",
  "nvim",
  "wallpapers",
]
```
this is worked on by a Go program in `_manager`. There's also some helper scripts in `_scripts`. The former should work on anything UNIX, the latter is intended only for wherever I have Fedora installed, which is my current distro of choice.
