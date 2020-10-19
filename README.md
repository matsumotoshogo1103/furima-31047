# テーブル設計

## usersテーブル

| Column          | Type    | Option      |
| ----------------|---------|-------------|
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | date    | null: false |

### アソシエーション

- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type       | Option                         |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| charge_id          | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| shipment_date_id   | integer    | null: false                    |
| user               | references | foreign_key: true, null: false |

### アソシエーション

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :charge
- belongs_to_active_hash :shipment_source
- belongs_to_active_hash :shipment_date

## purchasesテーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| user   | references | foreign_key: true, null: false |
| item   | references | foreign_key: true, null: false |

### アソシエーション

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Option                         |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| street_number | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| purchase      | references | foreign_key: true, null: false |

### アソシエーション

- belongs_to :purchase
- belongs_to_active_hash :prefecture
