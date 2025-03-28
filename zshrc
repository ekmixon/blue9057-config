# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  )

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM=screen-256color

# some more ls aliases
[[ "$OSTYPE" == "darwin"* ]] && export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" && \
  alias ls='ls -G' || alias ls='ls --color'


alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -als'
alias l='ls -ls'

alias scr='screen -T screen-color'
alias tmux='TERM=screen-256color tmux'

alias v='vim'
alias gdb='gdb -q'

export EDITOR=/usr/bin/vim

export PATH="/usr/local/bin:$HOME/bin:$HOME/bin/jumphosts:$PATH:/home/blue9057/ghidra/current"

#export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export PATH="$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
#source $HOME/.rvm/scripts/rvm

if [[ "blue9057-gram" == $(hostname) ]]; then
    if [ -z "$SSH_AUTH_SOCK" ] ; then
        eval `ssh-agent` > /dev/null
        ssh-add -l ~/.ssh/id-rsa > /dev/null
        ssh-add -l ~/.ssh/id-ed25519 > /dev/null
        ssh-add
    fi
fi

#changwoo
alias ssh2='ssh -p 2222 $@'
alias ssh3='ssh2 -t falcon.ece.vt.edu -- ssh $@'
alias mosh2='mosh --ssh "ssh -p 2222" $@'
alias mosh3='mosh2 falcon.ece.vt.edu -- mosh $@'
alias mangalyaan='mosh3 mangalyaan'
alias sgx-gdb='/opt/intel/sgxsdk/bin/sgx-gdb'

#if [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi

[[ -s /home/blue9057/.autojump/etc/profile.d/autojump.sh ]] && source /home/blue9057/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
if [[ -f /opt/intel/sgxsdk/environment ]]
then
    source /opt/intel/sgxsdk/environment
fi
export TERM=xterm-256color
