# 使い方
1.  既存でdocker composeでコンテナ立ててたらdownする
2. `vscode/golang/devcontainer.json` をプロジェクトルート直下に`.devcontainer/devcontainer.json`として配置
3. `vscode/golang/launch.json` を、デバッグ対象のコンテナのルート直下（に対応するローカルのディレクトリ）に`.vscode/launch.json`として配置
4. `vscode/golang/docker-compose.yml`をプロジェクトルート直下に`.devcontainer/docker-compose.yml`として配置
5. `.devcontainer/devcontainer.json`、`.vscode/launch.json`、`.devcontainer/docker-compose.yml`を書き換えて、デバッグ対象のサービスを指定する
6. Reopen in Containerでデバッグ対象のコンテナに接続してVSCodeを開く（`.devcontainer/devcontainer.json`の設定でdocker compose upが実行され、その上でコンテナに入れる）
7. Run and Debugからdebugger clientを起動してdebug開始

![起動](デバッグ.png)

# 備考
- VSCodeのGoのextention、及びgopls、staticcheck、goimports、delveはコンテナ起動時に自動で入るようにしています。
- delveのサーバーは5050番ポートでコンテナ起動後に自動で起動するようにしています。
