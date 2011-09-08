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

# Run keychain last so nothing else fails to run on fail or cancel
eval $(keychain --eval --quick --quiet --ignore-missing --nogui \
	~/.ssh/nlopez-lyra)
