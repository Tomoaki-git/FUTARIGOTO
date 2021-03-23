# README

## users テーブル

| column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| email              | string  | null: false, uniqueness: true |
| nickname           | string  | null: false                   |
| encrypted_password | string  | null: false                   |

### Association

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

### Association

- has_one :comments
- belongs_to :user

## comments テーブル

| column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| comment         | string      | null: false                    |
| user            | references  | null: false, foreign_key: true |
| post            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## choice_counts テーブル

| column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| first_choice_count   | boolean     |                                |
| second_choice_count  | boolean     |                                |
| third_choice_count   | boolean     |                                |
| user                 | references  | null: false, foreign_key: true |
| post                 | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## likes テーブル

| column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| comment    | references  | null: false, foreign_key: true |

### Association

- belongs_to :post