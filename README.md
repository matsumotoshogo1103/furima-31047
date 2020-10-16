# テーブル設計

## usersテーブル

| Column        | Type    | Option      |
| --------------|---------|-------------|
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| name_kanji    | string  | null: false |
| name_katakana | string  | null: false |
| birthday      | integer | null: false |

### アソシエーション

- has_many :items
- has_many :purchases

## itemsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| name            | string     | null: false       |
| price           | integer    | null: false       |
| category        | text       | null: false       |
| condition       | text       | null: false       |
| charge          | text       | null: false       |
| shipment_source | text       | null: false       |
| shipment_date   | text       | null: false       |
| user            | references | foreign_key: true |

### アソシエーション

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| credit_number   | integer    | null: false       |
| expiration_date | integer    | null: false       |
| security_code   | integer    | null: false       |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### アソシエーション

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Option            |
|---------------|------------|-------------------|
| postal_code   | integer    | null: false       |
| prefecture    | text       | null: false       |
| municipality  | text       | null: false       |
| street_number | text       | null: false       |
| building      | text       |                   |
| phone         | integer    | null: false       |
| purchase      | references | foreign_key: true |

### アソシエーション

- belongs_to :purchase
