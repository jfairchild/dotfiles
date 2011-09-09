# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in bash_prompt exports aliases functions extra; do
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

if [[ -e ~/.ssh/config ]]; then
	complete -r ssh
	_ssh_config () {
		local cur=${COMP_WORDS[COMP_CWORD]}
		COMPREPLY=($(compgen -W "$(sed -n -E 's/^Host(Name)?[[:space:]]+(.*)$/\2/p' ~/.ssh/config)" -- $cur))
	}
	fi
complete -F _ssh_config ssh

# Run keychain last so nothing else fails to run on fail or cancel
[[ -x $(which keychain 2>/dev/null) ]] && \
	eval $(keychain --eval --quick --quiet --ignore-missing --nogui \
	$(find ~/.ssh -name "*.pub" -print0 | xargs -0 printf "%s\n" | sed -e 's/\.pub//g'))
