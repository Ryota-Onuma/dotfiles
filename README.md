# ローカルで構築

vim-plugいれる
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
telescopeを使えるようにする
```
brew install ripgrep

brew install luarocks

brew install sqlite3

brew install chafa

luarocks install lua-sqlite3
```

シンボリックリンクをはる
```
mkdir -p ~/.config/nvim/
ln -fns このリポジトリのパス/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -fns このリポジトリのパス/dotfiles/git-cz/changelog.config.js ~/changelog.config.js

ln -fns このリポジトリのパス/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

依存ライブラリ入れる
```
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
```

vimを開いてpluginをインストールする
```
:PlugInstal
```

aliasを設定する
```
alias vim='nvim'
```

