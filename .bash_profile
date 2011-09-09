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
	if [[ -e ~/.ssh/config ]] ; then
		#hosts="$(sed -n -E 's/^Host(Name)?[[:space:]]+(.*)$/\2/p' ~/.ssh/config)"
		#users="${users} $(sed -n -E 's/^User[[:space:]]+(.*)$/\1/p' ~/.ssh/config)"
		hosts="$(sed -n 's/^Host[Name]*[	 ]*\(.*\)$/\1/p' ~/.ssh/config)"
		users="$(sed -n 's/^User*[	 ]*\(.*\)$/\1/p' ~/.ssh/config)"
	fi
	if [[ -e ~/.bash_history ]] ; then
		#users="$(sed -n -E 's/^ssh.*[[:space:]]+(.*)?(.*)@(.*)$/\1/p' ~/.bash_history)"
		users="${users} $(sed -n 's/^ssh[.	 ]*\([a-zA-Z0-9]*\)@\(.*\)$/\1/p' ~/.bash_history)"
	fi

	if [[ ${COMP_CWORD} -eq 1 ]] ; then
		COMPREPLY=( $(compgen -W "${hosts}" -- ${cur}) )
	fi

	case "${prev}" in
		-l)
			COMPREPLY=( $(compgen -W "${users}" -- ${cur}) )
		;;
	esac
}
# Associate the _ssh_config function with the ssh command completion
complete -F _ssh ssh

# Run keychain last so we can cancel it safely
[[ -x $(which keychain 2>/dev/null) ]] && \
	eval $(keychain --eval --quick --quiet --ignore-missing --nogui \
	$(find ~/.ssh -name "*.pub" -print0 | xargs -0 printf "%s\n" | sed -e 's/\.pub//g'))
