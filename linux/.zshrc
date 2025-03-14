# sheldon
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"

###### ubuntu
# pbcopy
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# ctrl-h
alias backtoh='sudo systemctl start xremap'

# cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# poetry path
export PATH="/home/cafelatte/.local/bin:$PATH"
fpath+=~/.zfunc

# alias
alias workspace='cd /media/cafelatte/Lab/workspace'

###### common
# tmux 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
    tmux attach || tmux new
fi

# alias
alias relogin='exec $SHELL -l'
alias memoryfree='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias python='python3'
alias pip='pip3'
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -F -a'
alias latest='cd `ls -t | head -1`'

# atcoder
alias ojmake='touch main.cpp'
alias oj t=''



###### zsh
autoload -Uz compinit && compinit

# history
setopt histignorealldups sharehistory

HISTFILE=~/.zsh_history
HISTSIZE=100000
SACEHIST=100000


# 同じコマンドは追加しないand残さない
setopt hist_ignore_all_dups
setopt hist_ignore_dups

# spaceから始まるものを残さない
setopt hist_ignore_space

# cdしたdirをディレクトリスタックに追加
setopt auto_pushd

# pushdしたときに すでにスタックに含まれていたら追加しない
setopt pushd_ignore_dups

# pathを直接入力してたらcd
setopt AUTO_CD

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# SSHの起動と鍵の追加
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/lab2
fi

##### fzf
alias nfzf='nvim $(fzf-tmux -p 80% --multi --preview "bat --color=always --style=numbers --line-range=:500 {}")'

# C-t option
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--select-1 --exit-0 --preview "bat --color=always --style=numbers --line-range :500 {}"'

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
