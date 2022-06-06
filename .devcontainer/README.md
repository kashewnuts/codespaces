Visual Studio Code の devcontainer 設定
============================================

* [Visual Studio Code](https://azure.microsoft.com/ja-jp/products/visual-studio-code/) 環境で、[devcontainer](https://code.visualstudio.com/docs/remote/codespaces)による開発が行えます
* [GitHub Codespaces](https://github.co.jp/features/codespaces) でこのdevcontainerを使うことを想定しています

## 利用手順

1. GitHub リポジトリでCodeボタンからCodespaceを起動してください。
   *  `Create codespaces on develop` の下矢印ボタンから `Configure and create codespaces` を選択し、 `Machine type` を `4-core` にするのを推奨します。
2. `docker-compose up -d` でDocker起動まで自動で行われます
3. リポジトリルートにあるREADMEの手順でDBの初期設定を行うとセットアップ完了です。

## 制限事項
* コード補完や静的解析を有効にするためにプロジェクトのPython及びNode.jsのバージョンを一致させ、ローカルに必要なパッケージをインストールしています。