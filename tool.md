# nvim plugin

## live_grep(ripgrep)
[rip_grep](https://github.com/BurntSushi/ripgrep)
Debianは dpkgでインストールっぽい。
```zsh
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

telescope dependencies

## pynvim
`python3 -m pip install --user --upgrade pynvim`
telescope dependencies


## fd-find
`apt install fd-find`

telescope dependencies

## coc-nvim
node が必要っぽいので installしてあげる。
`:call coc#util#install()`

## fean-vim(使ってない)
fern-action-trashするためには、linuxの場合trash-cliが必要
