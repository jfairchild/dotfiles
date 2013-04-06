# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

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
plugins=(git osx vagrant rbenv gem brew bundler ruby pip knife screen)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Environment variable extravaganza
JAVA_HOME="$(/usr/libexec/java_home)"
EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
ANDROID_SDK_ROOT="/usr/local/Cellar/android-sdk/r20.0.1"
PATH=$PATH:$HOME/bin
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH=$PATH:$(brew --prefix coreutils)/libexec/gnubin
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform_tools
PATH=/usr/local/share/npm/bin:$PATH
PYTHONPATH="${HOME}/Library/Python/2.7/site-packages:${PYTHONPATH}"
HISTSIZE=1000000
SAVEHIST=1000000
TZ="$(readlink /etc/localtime)"
export EDITOR="reattach-to-user-namespace subl --wait"
export JAVA_HOME="$(/usr/libexec/java_home)"
export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"
export LESS="-R"
export LESSOPEN="|lesspipe.sh %s"

eval `dircolors ~/.dircolors`
eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
source "${HOME}/.functions" >/dev/null 2>&1
# AWS credentials (for aws-cli, knife, boto, etc.)
source "${HOME}/.aws_export" >/dev/null 2>&1
# aws-completions
source "/usr/local/bin/zsh_complete.sh" >/dev/null 2>&1

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias sudo="nocorrect sudo"
alias ls="gls --color=auto"
alias rdesktop="rdesktop -g 1280x800 -P -r disk:tmp=/tmp -r sound:off"

# Bundler aliases
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

#eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_ecdsa ~/.ssh/id_rsa)
