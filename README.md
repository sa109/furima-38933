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
| password           | string | null: false              |
| email              | string | null: false,unique: true |

### Association
- has_many: items
- has_one: purchase,dependent:destroy
- has_one: card,dependent:destroy
- has_one: shipping adress,dependent:destroy

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
- belongs_to:category
- has_one: purchase,dependent:destroy
- has_one: card,dependent:destroy
- has_many: images,dependent:destroy

## purchasesテーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| last_name          | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| email              | string  | null: false,unique: true       |
| phone_number       | string  |                                |
| user_id            | integer | null: false, foreign_key: true |

### Association
- belongs_to:user

## shipping adressテーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| post_code  | string  | null: false                    |
| prefecture | string  | null: false                    |
| city       | string  | null: false                    |
| block      | string  | null: false                    |
| building   | string  | null: false                    |
| user_id    | integer | null: false, foreign_key: true |

### Association
- belongs_to:user

## imagesテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| image   | string  | null: false                    |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to:item

## categoryテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### Association
has_many: items
has_ancestry

## cardsテーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| user_id    | integer | null: false, foreign_key: true |
| custmer_id | string  | null: false                    |
| card_id    | string  | null: false, foreign_key: true |

### Association
- belongs_to:user