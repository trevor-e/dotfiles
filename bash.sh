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

brew install clang-format
brew install swiftlint
brew install carthage
brew install go
brew install mysql
brew install pidcat
brew install groovy
brew install openssl
brew install ruby
brew install python
brew install python3
brew install git
brew install bash-completion

# Remove outdated versions from the cellar.
brew cleanup

xcode-select --install