# dotfiles

wsl含めたwin環境と、ubuntuのみの2つで分けてる。たぶんmacも加わりそうかも。

設定共通で使えそうなやつはそのまま置いてるけど。 変更するときにシンボリックリンク外れちゃうので、場所の移動は慎重に。


dotfilesで管理したい設定ファイルが出てきたら。

ex: .zshrc

dotfilesにcp 

今の設定を退避させて移動 mv 
シンボリックリンクを貼る
```
ln -s ~/dotfiles/.zshrc ~
```

こんな感じ。

winでシンボリックリンク作るときは、リンクを起きたい階層に移動して
```
mklink ファイルの名前 リンク元のファイルの場所
mklink .wslconfig \path\dotfiles\win\.wslconfig
```
