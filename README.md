# CareYou 概要

__介護における相談・悩みを一緒に考えるQ&Aサイト__

# アプリケーションURL

https://carey0u.net

# 機能一覧

- 会員登録・ログイン機能(gem: devise)
- 認証、承認機能(gem: cancancan)
- 管理者ページ(gem: rails_admin)
- アカウント停止機能
- プロフィール画像アップロード機能(gem: carrierwave, rmagick)
- 相談作成・閲覧・削除機能
- タグ作成・付与機能
- コメント作成・閲覧・削除機能
- ベストコメント機能
- ニュース記事作成・閲覧機能
- お問い合わせ作成機能
- ページネーション機能(gem: will_paginate, will_paginate-bootstrap4)
- パンくずリスト機能(gem: breadcrumbs_on_rails)
- 単体テスト(gem: rspec)
- SEO対策(gem: meta-tags)

# 使用技術一覧

- フロントエンド: Bootstrap(v4.5)
- バックエンド: Ruby(v6.0.3), Rails(v2.7.1)
- データベース: Amazaon RDS (Mysql Aurora)
- コンテナ: Docker(v19.03.13), docker-compose(v1.27.4)
- クラウドインフラ: AWS(vpc, ec2, rds, route53, Certificate Manager)
↓インフラ構築図

![infra](https://user-images.githubusercontent.com/68471488/99671374-4cbf8880-2ab5-11eb-9452-fe16e3332c21.jpg)

- favicon.ico の作成(使用サイト: [Canva](https://www.canva.com/), [エーオーシステム](https://ao-system.net/favicon/))
↓作成物

![CareYou](https://user-images.githubusercontent.com/68471488/99181158-0645f300-2770-11eb-9217-e1eebd3c4ef2.png)

# ローカル環境構築

以下を実行することで、ローカル環境で確認ができます。
ターミナルで以下を実行。
```shell:ターミナル
git clone -b dockerize https://github.com/Permz/QandAsite.git
```

その後、

`docker-compose build`
`docker-compose up`
を実行。ターミナルを別タブで開き、

`docker-compose exec app bash`
にてコンテナ内に入る。

`rails db:create`
`rails db:migrate`
`rails db:seed`
を順に実行。ブラウザを開き、`localhost:19802`に接続。