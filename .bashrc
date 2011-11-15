# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in git-completion.bash extra bash_prompt exports aliases functions; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Don't overwrite existing files with shell redirection
set -o noclobber

# Set an overly paranoid umask
umask 0077

# BashFAQ/088
unset HISTFILESIZE
HISTSIZE=50000
export HISTSIZE PROMPT_COMMAND
shopt -s histappend
export HISTCONTROL="ignorespace:erasedups"

# rbenv it up if we have it
[[ -x $(which rbenv 2>/dev/null) ]] && \
	eval "`rbenv init -`"
