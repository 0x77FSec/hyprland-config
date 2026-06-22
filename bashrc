# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[36m\][\u@\h \W]\$\[\e[0m\] '
#PS1='\[\e[92m\][\u@\h \W]\$\[\e[0m\] '

. "$HOME/.cargo/env"
export PATH=$PATH:$HOME/.local/bin

# starship
 export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
 eval "$(starship init bash)"
