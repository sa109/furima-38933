## README

概要
テックキャンプの最終課題にて作成したアプリケーションを紹介します。
<br>
<br>

アプリケーション概要
フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。
<br>
<br>

接続先情報
https://35.79.236.174/
Basic認証
ID/Pass
ID: admin
Pass: 2222

<br>
<br>

テスト用アカウント等
購入者用
メールアドレス: 121sasakp@yahoo.co.jp
パスワード: sasa10

購入用カード情報
番号：4242424242424242
期限：9月/24年（未来の年月であれば可能）
セキュリティコード：123

出品者用
メールアドレス名: 4343sa@yahoo.co.jp
パスワード: sa1093
<br>
<br>

## 実装機能
## トップページ
[![top page](https://i.gyazo.com/087b5fd27d1aa209b03269a5fff1e348.gif)](https://gyazo.com/087b5fd27d1aa209b03269a5fff1e348)
<br>

## 1.ユーザー登録機能
ユーザー登録することで出品・購入できるようになります。（ユーザー登録していない人でも出品している商品を見ることは可能です。）
[![user](https://i.gyazo.com/7f5470d78388371d405ccff1a72e5de2.gif)](https://gyazo.com/7f5470d78388371d405ccff1a72e5de2)
<br>

## 2.商品出品機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）
[![出品](https://i.gyazo.com/5934af1ad05c3612253e1eb84da600c1.gif)](https://gyazo.com/5934af1ad05c3612253e1eb84da600c1)

<br>

## 3.商品の編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。
[![編集](https://i.gyazo.com/d2eb0a412fe8a9a02841fa2389a38d64.gif)](https://gyazo.com/d2eb0a412fe8a9a02841fa2389a38d64)

<br>

## 4.商品の削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。
[![削除](https://i.gyazo.com/69d28c2ac3b32b381ee16e1c4226d010.gif)](https://gyazo.com/69d28c2ac3b32b381ee16e1c4226d010)

<br>

## 5.商品の購入機能
出品者以外であれば、商品を購入することができます。カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）
[![購入](https://i.gyazo.com/f261b492c3c7489b46065d7dc51fb902.gif)](https://gyazo.com/f261b492c3c7489b46065d7dc51fb902)

<br>

## 6.商品のコメント機能
出品された商品について、ログインしているユーザーであれば、コメント欄にコメントを入力し、コメントをするボタンをクリックするとコメントをすることができます。

[![comment](https://i.gyazo.com/38739526932a993f5b560cfcf3184cba.gif)](https://gyazo.com/38739526932a993f5b560cfcf3184cba)

<br>


## ER図
[![ER図(furima)](https://i.gyazo.com/7fb86f18d2834970c83bc301ebf2cbb4.png)](https://gyazo.com/7fb86f18d2834970c83bc301ebf2cbb4)
<br>


## データベース設計

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
<br>
<br>

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
<br>
<br>

## purchasesテーブル
| Column | Type       | Options                      |
| ---- | ---------- | ------------------------------ |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: shipping_addres
<br>
<br>

## shipping_addressテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| region_id    | integer    | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to: purchase
<br>
<br>

開発環境
Ruby:2.6.5/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
開発期間と平均作業時間
開発期間：4/11〜5/16(35日間)
1日あたりの平均作業時間：4
合計：140時間程度
<br>
<br>

ローカルでの動作確認方法
```
% git clone https://github.com/erika618/furima-29074.git
% cd furima-29074
% bundle install
% rails db:create
% rails db:migrate
% yarn install
```

# その他使用しているgem・使うコマンド
```
<!-- rubocop（インデントを整えるため） -->
% bundle exec rubocop -a
```