# Exports

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/telkins/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/telkins/Library/Android/sdk/tools

export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
export ANDROID_HOME=/Users/telkins/Library/Android/sdk
export ANDROID_SDK=/Users/telkins/Library/Android/sdk
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/1.6.0.jdk

export VISUAL=vim
export EDITOR="$VISUAL"
export PATH

source ~/.local
source /usr/local/etc/bash_completion.d/git-prompt.sh 
source /usr/local/etc/bash_completion.d/git-completion.bash

# Functions

setLocale() {
    adb shell "su -c 'setprop persist.sys.language $1; setprop persist.sys.country $2; stop; sleep 5; start'"
}

capture() {
    adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > ./$1.png
}

# Aliases

alias atop="adb shell dumpsys activity top"
alias capture=capture
alias setLocale=setLocale
alias crashlytics="cat ~/Library/Caches/com.crashlytics/com.crashlytics.tools/crashlytics.log"
alias androidShowLayoutBounds="adb shell setprop debug.layout true;adb shell input keyevent KEYCODE_APP_SWITCH;adb shell input keyevent KEYCODE_APP_SWITCH"
alias androidHideLayoutBounds="adb shell setprop debug.layout false;adb shell input keyevent KEYCODE_APP_SWITCH;adb shell input keyevent KEYCODE_APP_SWITCH"
alias androidSetLocaleGerman="setLocale de GE"
alias androidSetLocaleUS="setLocale en US"
alias androidFragments="atop | grep -A 5 'Added Fragments:'"

alias iosdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias ioslint="ios; scripts/lint-swift-staged autocorrect"

alias lsa="ls -altrG"

# Git Configuration

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
GIT_PS1_SHOWDIRTYSTATE=true
BRANCH_COLOR="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"
PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\$(__git_ps1 \" ${BRANCH_COLOR}(%s)${RESET} \")\$ "
export PS1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx