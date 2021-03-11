## users テーブル

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
has_many:user_items

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



has_one:user_item
belongs_to:user

## addresses テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
|post_num          |string      |null:false                      |
|shipment_source_id|integer     |null:false                      |
|city              |string     |null:false                       |
|address           |string     |null:false                       |
|building_name     |string     |                                 |
|phone_num         |string     |null:false                     |
|user_item         | references |null:false,foreign_key: true |



belongs_to:user_item



## user_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association


belongs_to:item
belongs_to:user
has_one:address