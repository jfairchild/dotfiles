# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export ANDROID_SDK_ROOT="/usr/local/Cellar/android-sdk/r20.0.1"
export PATH="${HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
export PYTHONPATH="${HOME}/Library/Python/2.7/site-packages:${PYTHONPATH}"
export BCFG2_BIN_DIR="${HOME}/bin"
export IN_WGEN_ENV_PATH="${HOME}/bin/in_wgen_env"

eval "$(rbenv init -)"
