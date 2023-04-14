# テーブル設計

## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |
| encrypted_password | string | null: false              |
| email              | string | null: false,unique: true |

### Association
- has_many: items
- has_many: purchases

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| status_id        | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |

### Association
- belongs_to: user
- has_one: purchase

## purchasesテーブル
| Column | Type       | Options                      |
| ---- | ---------- | ------------------------------ |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: shipping_adress

## shipping_adressテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| region_id    | integer    | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to: purchase


