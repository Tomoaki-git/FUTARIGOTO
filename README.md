# README

## アプリ名
YOTSUBA-POST

## 概要

## 本番環境
HEROKU(※起動に時間がかかる場合がございます。ご了承ください。)
https://yotsuba-posts.herokuapp.com/

## ペルソナストーリー
- 今の生活に不満はないが毎日が同じ作業の繰り返しで、将来のことも見据えて今の生活を変えたいと考えている。
- ただ、自分の中ではほぼ転職することが決まっているものの、最後の一歩を踏み出すことができず立ち止まってしまっている。
- 転職の話のため、会社の同僚や先輩には相談しづらく、友人や家族を心配させてしまうかもしれないと思うとなかなか相談することはできずもやもやしている。

##  課題
- 自分の中ではほぼ決まっているものの、後一歩を踏み出す勇気が欲しいが、優柔不断な性格が合間ってなかなか踏ん切りがつかない。
- 自分に自信がない分誰かに相談したい気持ちがあるが、相談することに不慣れなため声に出すことができない。

## 課題解決
- 自分が迷っている内容を投稿することで、投稿を見た他のユーザーがいいねや応援コメントすることで、自分の選択に自信をつけて行動に移すことができる。
- 選択肢を設けることで、他の方がどう思っているのかをアンケート形式で知ることができる。
- コメント欄を開放（選択式）することで、選択肢だけでなく、他の方からの意見も求めることができる。（コメントはログイン式を採用）
- 投稿内容は3日間経過することで投稿者以外は見ることができないようになるため、プライベートに関わる内容であっても永遠にSNS上に残らないことから、安心して投稿することができる。

## 実装内容
- 投稿3日後、自動非表示機能(投稿者は3日後も確認可)
- いいね機能(アプリ活性化のため、ログイン不要にて実装)
- ユーザー管理機能(gem 'devise')
- 投稿機能
- 投稿詳細機能
- 投稿コメント機能
- ページネーション機能(gem 'kaminari')

## DEMO

### トップページ

### 投稿一覧画面

### 新規投稿

## 工夫したポイント

### バックエンド
Ruby on Rails

### フロントエンド
HTML, SCSS

### WEBサーバー(本番環境)
HEROKU

### ソース管理
GitHub, GtiGubDesktop

### テスト
RSpec

### エディタ
VScode

### 今後実装予定の機能
- いいねいいねのAjax化
- 投稿内容のタグ機能

## DB設計

### users テーブル

| column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| email              | string  | null: false, uniqueness: true |
| nickname           | string  | null: false                   |
| encrypted_password | string  | null: false                   |

#### Association

- has_many :posts
- has_many :comments

## posts テーブル

| column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| title           | string      | null: false                    |
| content         | text        | null: false                    |
| first_choice    | string      |                                |
| second_choice   | string      |                                |
| third_choice    | string      |                                |
| comment         | boolean     |                                |
| user            | references  | null: false, foreign_key: true |

#### Association

- has_one :comments
- belongs_to :user

### comments テーブル

| column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| comment         | string      | null: false                    |
| user            | references  | null: false, foreign_key: true |
| post            | references  | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :post

### choice_counts テーブル

| column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| first_choice_count   | boolean     |                                |
| second_choice_count  | boolean     |                                |
| third_choice_count   | boolean     |                                |
| user                 | references  | null: false, foreign_key: true |
| post                 | references  | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :post

### likes テーブル

| column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| comment    | references  | null: false, foreign_key: true |

#### Association

- belongs_to :post
