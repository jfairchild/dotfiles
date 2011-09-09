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

# Remove any existing completions for ssh
complete -r ssh
# Complete hosts based on Host and HostName lines in ~/.ssh/config
_ssh () {
	local cur prev opts
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}
	opts="-l"
	[[ -e ~/.ssh/config ]] && hosts="$(sed -n -E 's/^Host(Name)?[[:space:]]+(.*)$/\2/p' ~/.ssh/config)"

	if [[ $cur == -* || ${COMP_CWORD} -eq 1 ]] ; then
		COMPREPLY=( $(compgen -W "${hosts}" -- ${cur}) )
		return 0
	fi

	case "${prev}" in
		# ...
	esac
}
# Associate the _ssh_config function with the ssh command completion
complete -F _ssh ssh

# Run keychain last so we can cancel it safely
[[ -x $(which keychain 2>/dev/null) ]] && \
	eval $(keychain --eval --quick --quiet --ignore-missing --nogui \
	$(find ~/.ssh -name "*.pub" -print0 | xargs -0 printf "%s\n" | sed -e 's/\.pub//g'))
