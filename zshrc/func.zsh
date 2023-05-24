nvimWithSwapCheck () {
  # ディレクトリ名を引数から取得
  dir=$PWD
  dir=${dir//desktop/Desktop}
  # ディレクトリ名の '/' を '%' に置き換える
  swapdir=${dir//\//%}

  # 指定したディレクトリとそのサブディレクトリを再帰的に検索し、指定したパターンのスワップファイルが存在するかどうかをチェック
  if find ~/.local/state/nvim/swap -name "${swapdir}*.swp" | grep -q .; then
    echo "スワップファイルが存在します。"
  else
    nvim
  fi
}
