# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
echo "Setting up environment variables from zshrc..."
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# install zsh-autosuggestions with brew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# install zsh-syntax-highlighting with brew https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# # this loads krew kubectl plugin
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
alias k="kubectl"
alias kc-use-ct="kubectl config use-context"
alias kc-get-ct="kubectl config get-contexts"
# create a new session everytime open a new terminal
# if [[ "$TERM" != "screen-256color" ]]
#  then
#   tmux attach-session -t "$USER" || tmux new-session -s "$USER"
# fi

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
# https://formulae.brew.sh/formula/asdf
# remove this https://asdf-vm.com/guide/upgrading-to-v0-16.html#breaking-changes
# . $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
# . /opt/homebrew/opt/asdf/libexec/asdf.sh
# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

#customize prompt
#PROMPT='%(?:%{%}➜ :%{%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
# this is right prompt. it only shows the current time
RPROMPT='%*'

# alias ls='ls -lAFhG'
alias ls='eza -lAhGF --git'
alias eza='eza -lAhGF --git'
# bat can be used as a colorizing pager for man, by setting the MANPAGER environment variable
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export HOMEBREW_NO_AUTO_UPDATE=1

# SSL keys
export LOCALHOST_SSL_CERT="$HOME/Certs/localhost.crt"
export LOCALHOST_SSL_KEY="$HOME/Certs/localhost.key"
alias trail='<<<${(F)path}'
alias bbd='brew bundle dump --force --describe'
export NULLCMD='bat'

typeset -U path
path=(
  $path
)
HISTFILE="$HOME/.zsh_history"
# https://www.zsh.org/mla/users/2013/msg00689.html
HISTSIZE=9223372036854775807
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
# Don't record an entry that was just recorded again.
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY         # Append, don’t overwrite, history file
setopt INC_APPEND_HISTORY     # Write history after each command
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_SAVE_BY_COPY
setopt HIST_FCNTL_LOCK

# https://github.com/processone/fast_tls
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
# export CFLAGS="-I/opt/homebrew/opt/openssl/include/"
# this is to install erlang with asdf
export CFLAGS="-O2 -g"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include/"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# cache terraform downloading
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
echo "zshrc file loaded"
# https://github.com/pyenv/pyenv     Set up your shell environment for Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ysc/.lmstudio/bin"
# End of LM Studio CLI section

