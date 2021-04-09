1## users テーブル

| Column                         | Type  | Options     |
| -------------------             | ------ | ----------- |
| email                           | string | null: false,unique: true |
| encrypted_password              | string | null: false |
| nickname                        | string   | null: false |
| last_name                       |string    | null:false|
| first_name                      |string    |null:false |
| last_name_kana                  |string    |null:false|
| first_name_kana                 |string    |null:false|
| birth_info                      |date      |null:false|

### Association

has_many:items
has_many:orders

## items テーブル

| Column           | Type     | Options                      |
| ------           | ------   | -----------------------------|
| name             | string   | null: false                    |
|description       | text      |null:false                      |
| price            | integer   |null:false                      |
｜category_id       |  integer    |null:false                   |
| condition_id      | integer     |null:false                   |
| shipping_id      | integer    | null:false                    |
| shipment_source_id| integer      |null:false                  |
| shipping_date_id  |  integer    |  null:false                 |
| user               |references |null; false, foreign_key: true|



has_one:order
belongs_to:user

## addresses テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
|post_num          |string      |null:false                      |
|shipment_source_id|integer     |null:false                      |
|city              |string     |null:false                       |
|address           |string     |null:false                       |
|build_name     |string     |                                 |
|phone_num         |string     |null:false                     |
|order_id      | references |null:false,foreign_key: true |



belongs_to:order



## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association


belongs_to:item
belongs_to:user
has_one:address