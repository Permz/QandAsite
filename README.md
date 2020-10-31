# CareYou 概要

__介護における相談・悩みを一緒に考えるQ&Aサイト__

# アプリケーションURL

https://

# 機能一覧

- 会員登録・ログイン機能(gem: devise)
- 認証、承認機能(gem: cancancan)
- 管理者ページ(gem: rails_admin)
- アカウント停止機能
- プロフィール画像アップロード機能(gem: carrierwave, rmagick)
- 相談作成・閲覧機能
- タグ作成・付与機能
- コメント作成・閲覧機能
- ベストコメント機能
- ニュース記事作成・閲覧機能
- お問い合わせ作成機能
- ページネーション機能(gem: will_paginate, will_paginate-bootstrap4)
- パンくずリスト機能(gem: breadcrumbs_on_rails)

# 使用技術一覧

- フロントエンド: Bootstrap(v4.5)
- バックエンド: Ruby(v6.0.3), Rails(v2.7.1)
- データベース: Mysql(v8.0.21)
- コンテナ: Docker(v19.03.13), docker-compose(v1.27.4)
- インフラストラクチャ: AWS(vpc, ec2, rds, route53)
