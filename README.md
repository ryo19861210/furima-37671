# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        | 
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| profile                | text       | null: false                    | 
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| send_price_id          | integer    | null: false                    |
| place_id               | integer    | null: false                    |
| scheduled_day_id       | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null :false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column           | Type       | Options     | 
| ---------------- | ---------- | ----------- |
| post_code        | string     | null: false |
| place_id         | integer    | null: false |
| town             | string     | null: false |
| number           | string     | null: false |
| build_name       | string     |             |
| phone_number     | string     | null: false |
| order            | references | null: false, foreign_key: true |

### Association

-belongs_to :order