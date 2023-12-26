###### wsl

# clip board
# alias pbcopy='clip.exe'







###### ubuntu
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# prezto
autoload -Uz promptinit
promptinit
prompt pure


# cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"


# pbcopy
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'


# poetry path
export PATH="/home/cafelatte/.local/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit


# ctrl-h (ubuntu)
alias backtoh='sudo systemctl start xremap'

###### common


# tmux 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux 
fi

# alias
alias workspace='cd /media/cafelatte/Lab/workspace'
alias relogin='exec $SHELL -l'
alias memoryfree='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias vim='nvim'
alias python='python3'
alias pip='pip3'

# atcoder
alias ojmake='touch main.cpp'
alias oj t=''



###### zsh
# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SACEHIST=100000
# historyの共有
setopt share_history
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
