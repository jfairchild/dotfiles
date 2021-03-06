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
antigen bundle kubectl

antigen bundle carloscuesta/materialshell

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# More completions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme carloscuesta/materialshell zsh/materialshell-dark

# Tell antigen that you're done.
antigen apply

cdpath=(.. ~ ~/src)
alias e='subl -add'
export EDITOR='subl --add --wait'
export PATH="$HOME/bin:$PATH"

# direnv
if which direnv >/dev/null 2>&1; then eval "$(direnv hook zsh)"; fi

# pipenv
if which pipenv >/dev/null 2>&1; then eval "$(env _PIPENV_COMPLETE=source-zsh pipenv)"; fi
