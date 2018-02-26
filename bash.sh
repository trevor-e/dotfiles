# Update brew + packages
brew update
brew upgrade

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

brew install bash-completion
brew install cairo
brew install carthage
brew install clang-format
brew install emacs
brew install fd
brew install git
brew install go
brew install groovy
brew install htop
brew install openssl
brew install pidcat
brew install postgresql
brew install python
brew install python3
brew install ruby
brew install swiftgen
brew install swiftlint
brew install vim

# Remove outdated versions from the cellar.
brew cleanup

xcode-select --install