## users テーブル

| Column                         | Type  | Options     |
| -------------------           | ------ | ----------- |
| email                          | string | null: false,unique: true |
|encrypted_password              | string | null: false |
| nickname                       | string   | null: false |
|fullname                        |string    | null:false|
|fullname(katakana)              |string    |null:false|
|birth_info                      |date      |null:false|


has_one:items
has_one:address

## items テーブル

| Column        | Type     | Options                      |
| ------        | ------   | -----------------------------|
| name          | string   | null: false                  |
|description    | text      |null:false                    |
| price         | integer   |null:false                 |
｜category      |  string    |null:false                   |
|condition      | string|   null:false                   |
|shipping       |string | null:false                   |
|shipment_source|string |null:false           |
|day            | string    |  null:false                          |
|user           |reference |null; false, foreign_key: true|

has_one:address
belongs_to:user

## addresses テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
|post_num|    |string    |null:false                      |
|todoufukenn |string     |null:false                      |
|sikuchousonn|string     |null:false                       |
|banchi      |string     |null:false                       |
|build_name  |string     |null:false                       |
|phone_num   |integer    |null:false                       |




belongs_to:user
belongs_to:item



## user_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association


has_one:item
belongs_to:user