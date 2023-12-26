### wsl

# clip board
alias pbcopy='clip.exe'


#### common

# tmux 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux 
fi

# alias
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

autoload -Uz promptinit
promptinit

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
