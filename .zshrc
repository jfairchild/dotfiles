# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm osx knife vagrant)

source $ZSH/oh-my-zsh.sh

# Environment variable extravaganza
JAVA_HOME="$(/usr/libexec/java_home)"
EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
ANDROID_SDK_ROOT="/usr/local/Cellar/android-sdk/r20.0.1"
PATH=$PATH:$HOME/bin
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Use GNU coreutils with their normal names
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
PATH=$PATH:$(brew --prefix coreutils)/libexec/gnubin
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform_tools
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PYTHONPATH="${HOME}/Library/Python/2.7/site-packages:${PYTHONPATH}"
HISTSIZE=1000000
SAVEHIST=1000000
TZ="$(readlink /etc/localtime)"
EDITOR=vim

eval `dircolors ~/.dircolors`
eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
source "${HOME}/.functions"
source "${HOME}/.rvm/scripts/rvm"
if [ -e "${HOME}/.aws_export" ]; then source "${HOME}/.aws_export"; fi

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias sudo="nocorrect sudo"
alias ls="ls --color=auto"
alias rdesktop="rdesktop -g 1280x800 -P -r disk:tmp=/tmp -r sound:off"
alias mvim="reattach-to-user-namespace mvim"
alias knife="nocorrect knife"
alias pbcopy="reattach-to-user-namespace pbcopy"
alias pbpaste="reattach-to-user-namespace pbpaste"
alias aws="aws --region $AWS_DEFAULT_REGION"
