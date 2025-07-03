###### sheldon
eval "$(sheldon source)"

###### starship
eval "$(starship init zsh)"

###### wsl

# clip board
alias pbcopy='clip.exe'

###### common
# tmux 
# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
    tmux attach || tmux new
fi


# alias
alias relogin='exec $SHELL -l'
alias q='exit'
alias memoryfree='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias python='python3'
alias pip='pip3'
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -F -a'
alias latest='cd `ls -t | head -1`'
alias img='irfanview'
alias expl='/mnt/c/windows/explorer.exe'
alias dotfiles='cd ~/dotfiles'


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


# path
export PATH=$HOME/.local/bin:$PATH

# 同じコマンドは追加しないand残さない
setopt hist_ignore_all_dups
setopt hist_ignore_dups

# spaceから始まるものを残さない
setopt hist_ignore_space

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


# pushdしたときに すでにスタックに含まれていたら追加しない
setopt pushd_ignore_dups

# pathを直接入力してたらcd
setopt AUTO_CD

# cdしたdirをディレクトリスタックに追加
# setopt AUTO_PUSHD
DIRSTACKSIZE=100

# cdしたらlsを起動
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}

# homeで~に
alias home='cd ~'




zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



### fzf
export FZF_TMUX="1"
export FZF_TMUX_OPTS='-p 80%'

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/*'"
export FZF_DEFAULT_OPTS='--no-separator --no-scrollbar --border=none'

# 履歴表示
export FZF_CTRL_R_OPTS="--reverse --preview 'bat --color=always --language=sh --style numbers' --preview-window=border-sharp,down:10:hidden:wrap --bind '?:toggle-preview'"

# export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--select-1 --exit-0 --preview "bat --color=always --style=numbers --line-range :500 {}" --preview-window=border-sharp,right:50%'

export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --preview-window=border-sharp,right:50%"

# nvim fzf
nf() {
    local selected
    selected=$(fzf-tmux -p 80% --reverse --multi --preview "bat --color=always --style=numbers --line-range=:500 {}")
    if [ -n "$selected" ]; then
        nvim $selected
    fi
}

# dirを検索して移動
fdf() {
    local dir
    dir=$(fd --type d --hidden --follow --exclude .git | fzf-tmux -p 80% --reverse --preview 'tree -C {} | head -200') && cd "$dir"
}

# ghq + fzf
g() {
    local repodir=$(ghq list | fzf-tmux -p 80% --multi +1 --preview 'tree -C {} | head -200') && cd $(ghq root)/$repodir
}




# bun completions
[ -s "/home/cafe/.bun/_bun" ] && source "/home/cafe/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH=$PATH:~/go/bin

# mise
eval "$(~/.local/bin/mise activate)"


#lazygit
alias lg='lazygit'


# raylib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# opengl のための設定
unset LIBGL_ALWAYS_INDIRECT





[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
