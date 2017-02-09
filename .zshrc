source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle aws
antigen bundle pip
antigen bundle docker
antigen bundle command-not-found
antigen bundle python
antigen bundle virtualenv
antigen bundle colored-man-pages
antigen bundle mosh

antigen bundle carloscuesta/materialshell

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme carloscuesta/materialshell zsh/materialshell-dark

# Tell antigen that you're done.
antigen apply

cdpath=(.. ~)
alias e='subl -add'
export EDITOR='subl --add --wait'
