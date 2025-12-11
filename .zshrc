# VIM MODE
# set -o vi

# ENVIROMENT VARIABLES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export ZSH="$HOME/.oh-my-zsh"
# export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"

export DEV="$HOME/Dev"
export GITUSER="p-droaraujo"
export GHREPOS="$DEV/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"

export EDITOR="nvim"
export VISUAL="nvim"

export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# OH-MY-ZSH CONFIG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Use case-sensitive completion.
# CASE_SENSITIVE="false"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

function precmd () {
  window_title="\033]0;${PWD}\007"
  echo -ne "$window_title"
}

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# oh-my-zsh plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions zsh-syntax-highlighting git-prompt tmux)

# set tmux to auto-start
# ZSH_TMUX_AUTOSTART=true

export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
source $ZSH/oh-my-zsh.sh


# ALIASES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# For a full list of active aliases, run `alias`.
alias vim="nvim"

# configs
alias termconf="nvim ~/.config/ghostty/config"
alias zshconf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimconf="nvim ~/.config/nvim/"
alias tmuxconf="nvim ~/.config/tmux/tmux.conf"
alias config="nvim ~/.config"

# dirs
alias dot="cd $DOTFILES"
alias dev="cd $DEV"
alias repos="cd $GHREPOS"
alias docs="cd ~/Documents"
alias desktop="cd ~/Desktop"
alias brain="cd ~/Documents/Brain"
# git
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"

# python
# Always use the newest brew Python (works even in non-interactive scripts)
(( $+commands[python3] )) && alias python=python3 pip=pip3

# utilities
alias activate="source .venv/bin/activate"
alias cat="bat"
alias cl="clear"

# fzf
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# FZF CONFIG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
eval "$(fzf --zsh)"


# OVERWRITE DEFAULT TERMINAL PROMPT TITLE:
PS1="%1~ ❯ "

# setting colors 
autoload -U colors && colors

# SET VIRTUAL ENVIRONMENT COLOR
VENV_COLOR="%F{green}"

# FUNCTION TO SET PROMPT ACCORDING TO VIRTUAL ENVIRONMENT
set_prompt() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    VENV_PROMPT="${VENV_COLOR}($(basename $VIRTUAL_ENV))%f "
  else
    VENV_PROMPT=""
  fi
  PROMPT="${VENV_PROMPT}%1~ ❯ "
}
precmd_functions+=(set_prompt)

# FUNCTION TO COMPILE AND RUN C CODE
run_c() {
    gcc "$1" -o "${1%.*}" && "./${1%.*}"
}

eval "$(uv generate-shell-completion zsh)"

# ─── CLEAN & DEDUPLICATED PATH (put near the bottom of .zshrc) ───
clean_path() {
  if [[ -n "$PATH" ]]; then
    # Remove duplicates while preserving order (pure zsh, no external tools)
    typeset -U path   # “U” = unique
    # Optional: remove empty entries
    path=($path:#)
  fi
}
clean_path
precmd_functions+=(clean_path)
# ─────────────────────────────────────────────────────────────────────
