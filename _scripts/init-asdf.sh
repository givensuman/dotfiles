#!/bin/bash
printf "Installing some programming languages...\n\n"

if [ ! -d "$HOME/.asdf" ]; then
  echo "Downloading asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0 &>/dev/null
fi

mapfile -t languages < <(cut -d\  -f1 "$HOME/.tool-versions" | grep -E '^[^#]' | xargs -L1 echo)

for language in "${languages[@]}"; do
  printf "Registering %s plugin..." "$language"
  ~/.asdf/bin/asdf plugin-add "$language" &>/dev/null
  printf "\tDone!\n"
done

printf "\nInstalling languages...\n\n"
~/.asdf/bin/asdf install

printf "\nAll done!\n"

cat ~/.tool-versions
