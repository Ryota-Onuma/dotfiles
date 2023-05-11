# ローカルで構築

vim-plugいれる

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

homebrew系をインストール

```
brew install ripgrep

brew install luarocks

brew install sqlite3

brew install chafa

brew install gh

brew install rust

brew install jq

brew install python-lsp-server

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

.zshrcに追加読み込みの設定を書く

```
source このリポジトリのパス/dotfiles/zshrc/github.zsh
source このリポジトリのパス/dotfiles/zshrc/alias.zsh
source このリポジトリのパス/dotfiles/zshrc/env.zsh
```

env.zshを作って環境変数追加

```
cp このリポジトリのパス/dotfiles/zshrc/env.zsh.sample このリポジトリのパス/dotfiles/zshrc/env.zsh 
```

その他

```
git config --global core.editor nvim

gh config set editor "nvim"

gh auth login

cargo install silicon

luarocks install lua-sqlite3
```

PATHを通す
```
.cargo/bin へのPATH
```

読み込み直し

```
source ~/.zshrc
```
