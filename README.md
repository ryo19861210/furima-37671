# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| full_name          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items

## items テーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_category | string     | null: false                    |
| item_status   | string     | null: false                    |
| send_price    | string     | null: false                    |
| send_place    | string     | null: false                    |
| send_days     | string     | null: false                    |
| price         | string     | null: false                    |
| user          | references | null :false, foreign_key: true |

### Association

- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null :false, foreign_key: true |
| item    | references | null :false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buys テーブル

| Column  | Type   | Options                        | 
| ------- | ------ | ------------------------------ |
| item    | string | null: false, foreign_key: true |
| user    | string | null: false, foreign_key: true |

### Association

- has_one :buyers_information

## buyers_information テーブル

| Column           | Type   | Options     | 
| ---------------- | ------ | ----------- |
| card_number      | string | null: false |
| card_date        | string | null: false |
| card_code        | string | null: false |
| post_code        | string | null: false |
| prefectures      | string | null: false |
| town             | string | null: false |
| number           | string | null: false |
| build_name       | string |             |
| phone_number     | string | null: false |

### Association

-belongs_to :buys