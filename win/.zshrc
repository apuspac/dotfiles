### wsl

eval "$(sheldon source)"
eval "$(starship init zsh)"

# clip board
alias pbcopy='clip.exe'


#lsの色 (default:exfxcxdxbxegedabagacad)
# export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls --color=auto"
alias ll="ls --color=auto -l"
alias la="ls --color=auto -a"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'



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
