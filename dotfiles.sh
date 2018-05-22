#####
# dotfiles.sh -- install dotfiles symlinks
#
#   author:     Pat Gaffney <pat@hypepat.com>
#   created:    2016-09-17
#   modified:   2017-04-10
#
#   This file creates symlinks for the dotfiles in the *current
#   directory* to $HOME.
#
#####################################################################

# Symlink all the dotfiles.
# ln -s :: create symbolic link
# ln -v :: verbose mode- print details

echo $'\e[1;34mInstalling symlinks:\e[0m'

# Create a symlink for each file in this directory.
for file in $(ls -A)
do
    if [[ -d $file ]]; then 
        printf "dotfiles.sh: Skipping \'%s\' -- it is a directory\n" $file
    elif [[ -x $file ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is an executable\n" $file
    elif [[ $file == *.png ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a picture\n" $file
    elif [[ $file == .gitignore ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a gitignore\n" $file
    elif [[ $file == *.md ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Markdown file\n" $file
    elif [[ $file == *.terminal ]]; then
        printf "dotfiles.sh: Skipping \'%s\' -- it is a Terminal settings file\n" $file
    else ln -sv "$PWD/$file" "$HOME";
    fi
done

# Assumes brew is already installed on the machine
echo $'\e[1;34mInstalling brew dependencies:\e[0m'

brew update
brew upgrade
brew bundle
brew cleanup

echo $'\e[1;34mInstalling Xcode command line tools:\e[0m'

xcode-select --install

echo $'\e[1;34mSwitching Bash version:\e[0m'

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;