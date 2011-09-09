# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in bash_prompt exports aliases functions extra; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Set an overly paranoid umask
umask 0077

# BashFAQ/088
unset HISTFILESIZE
HISTSIZE=50000
export HISTSIZE PROMPT_COMMAND
shopt -s histappend

# Run keychain last so nothing else fails to run on fail or cancel
[[ -x $(which keychain 2>&1 >/dev/null) ]] && \
	eval $(keychain --eval --quick --quiet --ignore-missing --nogui \
	~/.ssh/nlopez-lyra)
