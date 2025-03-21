# dotfiles

以下自分用メモ:  

wsl含めたwin環境と、LABのubuntuの2つで分けている。
変更するときにシンボリックリンク外れちゃうので、場所の移動は慎重に。


自動化できるようにしたいなぁ。

## zsh + sheldon + starship
zsh と shell change
```
sudo apt install zsh
chsh -s $(which zsh)

```

起動後に出てくるinit処理はquitする。

cargo install
[cargo install](https://doc.rust-lang.org/cargo/getting-started/installation.html)
```
curl https://sh.rustup.rs -sSf | sh
```

sheldon, starship

build-essential入れないと、ccがなくて、installできないと思う。
pkg-configも無いって言われた。
libssl-devも無いって言われた。
```
sudo apt install build-essential pkg-config libssl-dev
```
あとは、install
```
cargo install sheldon
curl -sS https://starship.rs/install.sh | sh

```


## symbolic link 
```
mkdir ~/.config/tmux
mkdir ~/.config/sheldon
ln -s ~/dotfiles/linux/.zshrc ~/.zshrc
ln -s ~/dotfiles/common/.tmux.conf ~/.config/tmux/tmux.conf
ln -s ~/dotfiles/common/plugins.toml ~/.config/sheldon/plugins.toml
ln -s ~/dotfiles/common/starship.toml ~/.config/starship.toml
```



dotfilesで管理したい設定ファイルが出てきたら。

dotfilesにcpして 元のファイルを削除してから、
シンボリックリンクを貼る
```
cp ~/.zshrc ~/dotfiles/path/to/.zshrc
ln -s ~/dotfiles/path/to/.zshrc ~
```



## win terminal

powershellにもstarshipを入れる。
starship
```
winget install starship
```
powershellの`$PROFILE`に以下を追加する
```
Invoke-Expression (&starship init powershell)
```


Alacritty
```
winget install Alacritty
```

winでシンボリックリンク作るには
```
mklink linkファイル target(リンク元)のファイル
mklink \path\.wslconfig \path\dotfiles\win\.wslconfig
```


## nvim
.appimage をDL

実行権限渡して起動してみる。
```
chmod u+x nvim.appimage && ./nvim.appimage
```

確認できたら、
`~/.app`
にnvim移動して、シンボリックリンクを通す。 移動させるところは任意。シンボリックリンクもPATHを確認して、分かりやすいところに。
```
ln -s ~/.app/nvim.appimage ~/.local/bin/nvim
```

configファイルは、ディレクトリをリンクする
```
ln -s ~/dotfiles/nvim ~/.config/nvim
```


## font
今は、 これがすき。
[moralerspace](https://github.com/yuru7/moralerspace)
