## users テーブル

| Column                         | Type  | Options     |
| -------------------           | ------ | ----------- |
| email                          | string | null: false,unique: true |
| encrypted_password              | string | null: false |
| nickname                        | string   | null: false |
| last_name                       |string    | null:false|
| first_name                      |string    |null:false |
| last_name_kana                  |string    |null:false|
| first_name_kana                 |string    |null:false|
| birth_info                      |date      |null:false|

### Association

has_many:items

## items テーブル

| Column        | Type     | Options                      |
| ------        | ------   | -----------------------------|
| name          | string   | null: false                  |
|description    | text      |null:false                    |
| price           | integer   |null:false                 |
｜category      |  integer    |null:false                   |
| condition      | integer     |null:false                   |
| shipping       | integer    | null:false                   |
| shipment_source| integer      |null:false           |
| shipping_date  |  integer    |  null:false                          |
| user_id        |reference |null; false, foreign_key: true|



has_one:user_items
belongs_to:user

## address テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
|prefecture   |string     |null:false                      |
|city         |string     |null:false                       |
|address      |string     |null:false                       |
|building_name |string     |                   |
|phone_num   |string       |null:false                       |
| user_id    | references | null: false, foreign_key: true |
|user_items_id   | references |null:false,foreign_key: true



belongs_to:user_item



## user_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id| references | null: false, foreign_key: true |

### Association


belongs_to:item
belongs_to:user