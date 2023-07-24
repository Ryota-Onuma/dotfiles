# ローカルで構築

packerいれる

```
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
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

ln -fns このリポジトリのパス/dotfiles/nvim ~/.config/nvim

ln -fns このリポジトリのパス/dotfiles/git-cz/changelog.config.js ~/changelog.config.js

ln -fns このリポジトリのパス/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

依存ライブラリ入れる

```
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
```

vimを開いてpluginを使えるようにする

```
:PackerInstall
:PackerCompile
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
