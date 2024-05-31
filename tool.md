# nvim plugin

## fzf
sheldon で installされる。



## bat
highlight command
```
sudo dpkg -i bat_0.18.3_amd64.deb  # adapt version number and architecture
```
dependencies fzf


## live_grep(ripgrep)
[rip_grep](https://github.com/BurntSushi/ripgrep)
Debianは dpkgでインストールっぽい。
```zsh
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

dependencies telescope, fzf



## pynvim
`python3 -m pip install --user --upgrade pynvim`
dependencies telescope


## fd
`apt install fd-find`
`ln -s $(which fdfind) ~/.local/bin/fd`

dependencies telescope 

## coc-nvim
node が必要っぽいので installしてから次を実行。
`:call coc#util#install()`

## fean-vim(使ってない)
fern-action-trashするためには、linuxの場合trash-cliが必要
