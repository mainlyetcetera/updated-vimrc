
# export PATH=~/Library/Python/3.7/bin:$PATH
export PATH=/Users/eclipse_sd/Library/Python/3.8/bin:$PATH

# aliases
alias python="python3"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/eclipse_sd/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=/Users/eclipse_sd/.pyenv/versions/3.7.3/bin:$PATH

# set vim shortcuts as default for cli
set -o vi

# Aim: open vim to type out commands on cli
export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line

# also saw bindkey -M vicmd v edit...
bindkey -M vicmd v edit-command-line

# binding space-k-j to esc in insert mode on command line
bindkey -M viins ' en' vi-cmd-mode
bindkey -M viins ' kj' vi-cmd-mode

# binding space-j-k to esc in insert mode on command line
# bindkey -M viins ' jk' vi-cmd-mode

# aliases...again
alias vim="nvim"
alias blurgs="jobs"
alias lg="lazygit"
alias cn="~/my_scripts/connect.sh"
alias cdb="~/my_scripts/db_connect.sh"
alias ta="~/tmux_scripts/t_admin.sh"
alias pswd="cat ~/mfa_pass.txt | pbcopy"
alias ebhlth="~/my_scripts/check_aws_eb_env_health.sh"
alias note="~/my_scripts/notes.sh"
alias moby="docker run --rm -it docker/doodle:dockercon2022"
alias tree="tree -I node_modules"

# Setting new default command so fzf finds hidden files
# this didn't work...
export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# changing exec color to brown
export LSCOLORS=Gxfxcxexdxdgedabagacad

# get rid of beep in shell
unsetopt BEEP

# install php for a tutorial, may remove
export PATH="$PATH:/usr/local/opt/php@8.1/bin"

# use brew vim, has python support
export PATH="/usr/local/Cellar/vim/8.2.4150/bin:$PATH"

# add my scripts to path
export PATH="$PATH:~/my_scripts"

# add my tmux scripts to path
export PATH="$PATH:~/tmux_scripts"

# twilio-cli stuff
eval 
TWILIO_AC_ZSH_SETUP_PATH=/Users/eclipse_sd/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup

# set .pgpass so can find with psql and script
export PGPASSFILE='/Users/eclipse_sd/.pgpass'

# set path for ngrok
export PATH="$PATH:/Users/eclipse_sd/Downloads/ngrok_container"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# luajit-openresty is keg-only, which means it was not symlinked into /usr/local,
# because it conflicts with the LuaJIT formula.

# If you need to have luajit-openresty first in your PATH, run:
#   echo 'export PATH="/usr/local/opt/luajit-openresty/bin:$PATH"' >> ~/.zshrc

# For compilers to find luajit-openresty you may need to set:
#   export LDFLAGS="-L/usr/local/opt/luajit-openresty/lib"
#   export CPPFLAGS="-I/usr/local/opt/luajit-openresty/include"

# For pkg-config to find luajit-openresty you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/luajit-openresty/lib/pkgconfig"
