
# アプリケーションについて

![app-image](./image/app.jpg)

### URL

##### URL: http://withok.site

##### github: https://github.com/sasa-design/git_app

### 概要

* アプリケーション名「WithOK」

* 内容：カラオケに一緒に行く相手を探せるマッチングアプリ

# アプリケーションの詳細について

### 機能

* ログイン機能（JWT）

* CRUD機能

* プロフィール画像設定機能（active storage, S3）

* プロフィール設定機能

* 検索機能（ransack）

* フォロー、フォロワー、マッチング機能

* ページネーション機能(kaminari)

* メッセージ機能

### 使用技術

#### フロントエンド

* Vue.js（webpacker管理）

* vue-router

* vuex

* materialize(cssフレームワーク)

#### バックエンド

* Ruby ver2.6

* Ruby on Rails ver6.0(api)

* rspec 

* mysql(RDS)

#### インフラ

* Unicorn(appサーバー)

* Nginx(webサーバー)

* AWS（EC2,RDS,S3.Route53）

* Docker

* docker-compose

# アプリケーションの動作に関して

* （）にまとめました。

# 補足

### データベース構成

![detabase-image](./image/database_image.jpg)

### インフラ構成図

![aws-image](./image/aws_image.jpg)
