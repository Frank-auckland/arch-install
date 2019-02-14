# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=/usr/share/zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerline"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl)

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
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export DEFAULT_USER="frank"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH="$PATH:$HOME/.google-cloud-sdk/bin/" # Add google SDK to PATH

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

#Add Go IDE to PATH
export PATH=$PATH:$HOME/frank/GoLand-2017.3/bin

#Add terraform to PATH
export PATH=$PATH:$HOME/terraform

#POWERLINE_HIDE_HOST_NAME="true" # Not show the host name
#source $ZSH/oh-my-zsh.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/frank/google-cloud-sdk/path.zsh.inc' ]; then source '/home/frank/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
autoload -U compinit compdef
compinit
if [ -f '/home/frank/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/frank/google-cloud-sdk/completion.zsh.inc'; fi

alias vim='nvim'

alias ls='ls --color'
alias ll='ls -al --color'
alias history='history 1'

alias kc='kubectl'


alias nint='gcloud container clusters get-credentials kubernetes-cb6bcc40 --zone australia-southeast1-a --project xm-integration; kubectl proxy'
alias int='gcloud container clusters get-credentials int-plat-ause1-k8-1 --zone australia-southeast1-c --project xm-development; kubectl proxy'
alias dev='gcloud container clusters get-credentials dev-plat-ause1-k8-1 --zone australia-southeast1-c --project xm-development; kubectl proxy'
alias qa='gcloud container clusters get-credentials qa-plat-ause1-k8-1 --zone australia-southeast1-c --project xm-development; kubectl proxy'

source /opt/google-cloud-sdk/*.zsh.inc

# Lines configured by zsh-newuser-install
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/frank/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh


source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme