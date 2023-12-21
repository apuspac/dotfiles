#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


# cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# prezto
autoload -Uz promptinit
promptinit
prompt pure

# neovim
alias vim='nvim'

# tmux 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux 
fi


# workspace
alias workspace='cd /media/cafelatte/Lab/workspace'

# pbcopy
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# python
alias python='python3'
alias pip='pip3'

# poetry path
export PATH="/home/cafelatte/.local/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# relogin
alias relogin='exec $SHELL -l'

# ctrl-h (ubuntu)
alias backtoh='sudo systemctl start xremap'

#### history
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
