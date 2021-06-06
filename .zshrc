# Dependancies You Need for this Config
# zsh-syntax-highlighting - syntax highlighting for ZSH in standard repos
# autojump - jump to directories with j or jc for child or jo to open in file manager
# zsh-autosuggestions - Suggestions based on your history

# Initial Setup
# mkdir -p "$HOME/.zsh"
# git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
# Setup Alias in $HOME/.zsh/aliasrc

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

if [ -f ~/.aliases ]; then
. ~/.aliases
fi

# Pure Prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
#prompt fade blue
PROMPT='%F{green}%n@%m%f %F{blue}%B%~ $ '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"

# Load ; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
setopt correct
setopt  autocd autopushd pushdignoredups

# Default editor
export EDITOR=vim
function addalias { echo "alias $1='$2'" >> ~/.aliases && source .zshrc }

PATH=$PATH:/home/nedo/.gem/ruby/2.7.0/bin
neofetch
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Add git repository support
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#PROMPT='$vcs_info_msg_0_'
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'
alias config='/usr/bin/git --git-dir=/home/nedo/.cfg/ --work-tree=/home/nedo'
set -o emacs
