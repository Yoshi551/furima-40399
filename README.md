# テーブル設計

## usersテーブル

| column           | type    | options                      |
|------------------|---------|------------------------------|
|email             |string   |null: false, unique: true     |
|encrypted_password|string   |null: false                   |
|nickname          |string   |null: false                   |
|first_name        |string   |null: false                   |
|last_name         |string   |null: false                   |
|first_name_kana   |string   |null: false                   |
|last_name_kana    |string   |null: false                   |
|birth_date        |date     |null: false                   |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|name               |string      |null: false                   |
|description        |text        |null: false                   |
|category_id        |integer     |null: false                   |
|condition_id       |integer     |null: false                   |
|shipping_fee_id    |integer     |null: false                   |
|prefecture_id      |integer     |null: false                   |
|shipping_days_id   |integer     |null: false                   |
|price              |integer     |null: false                   |
|user_id            |references  |null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee
- belongs_to :prefecture
- belongs_to :shipping_days

## categoriesテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|name               |string      |null: false                   |

### Association

- has_many :items

## conditionsテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|name               |string      |null: false                   |

### Association

- has_many :items

## shipping_feesテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|name               |string      |null: false                   |

### Association

- has_many :items

## prefecturesテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|name               |string      |null: false                   |

### Association

- has_many :items
- has_many :addresses

## shipping_daysテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|name               |string      |null: false                   |

### Association

- has_many :items

## ordersテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|user_id            |references  |null: false, foreign_key: true|
|item_id            |references  |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| column            | type       | options                       |
|-------------------|------------|------------------------------|
|postal_code        |string      |null: false                   |
|prefecture_id      |integer     |null: false                   |
|city               |string      |null: false                   |
|street_address     |string      |null: false                   |
|building_name      |string      |                             |
|phone_number       |string      |null: false                   |
|order_id           |references  |null: false, foreign_key: true|

### Association

- belongs_to :order
- belongs_to :prefecture