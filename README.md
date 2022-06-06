# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items, through: :item_users
- has_many :comments

## items テーブル

| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ |
| item_profile | string     | null: false                    |
| send_profile | string     | null: false                    |
| user         | references | null :false, foreign_key: true |

### Association

- has_many :comments
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