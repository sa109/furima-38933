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

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| description   | string  | null: false                    |
| status        | string  | null: false                    |
| postage       | string  | null: false                    |
| region        | string  | null: false                    |
| shipping_days | string  | null: false                    |
| price         | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |
| category_id   | integer | null: false, foreign_key: true |
| image_id      |	integer | null: false, foreign_key: true |

### Association
- belongs_to:user
- has_one: purchase
- has_many: images,dependent:destroy

## purchases historyテーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| last_name          | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| email              | string  | null: false,unique: true       |
| user_id            | integer | null: false, foreign_key: true |

### Association
- belongs_to:user

## shipping adressテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | string  | null: false |
| region       | string  | null: false |
| city         | string  | null: false |
| block        | string  | null: false |
| building     | string  |             |
| phone_number | string  |             |
| user_id      | integer |             |

### Association
- belongs_to:purchase

## imagesテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| image   | string  | null: false                    |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to:item

