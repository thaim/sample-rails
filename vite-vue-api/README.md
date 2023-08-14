Vite Vue API
============

Rails をAPIモードで、フロントエンドをVueで構築するプロジェクト。

## 実行

### backend
バックエンドはRails をAPIモードで構築。
以下の通り実行することで、Railsサーバーが起動する。
APIコントローラがサンプルとなるメッセージを返している。

```
$ bin/rails s -b 0.0.0.0
```

### frontend
フロントエンドは Vite + Vue + TypeScriptで構築。
以下の通り実行することで、Vite+Vueプロジェクトが起動する。
内部では localhost:3000 のAPIを叩いてメッセージを表示している。

```
$ npm install
$ npm run dev
```

## 参考
https://qiita.com/generonishimura/items/51ea51a152375ced9129
