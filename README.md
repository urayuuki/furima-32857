## users テーブル

| Column               | Type   | Options     |
| -------------------  | ------ | ----------- |
| email                | string | null: false |
| password             | string | null: false |
|password_confirmation |string    |null: false|
| nickname             | string   | null: false |
|fullname              |string    | null:false|
|birth_info            |string    |null:false|

|

has_one:items
has_many:address

## items テーブル

| Column    | Type     | Options                      |
| ------    | ------   | -----------------------------|
|image      |          |                              |
| name      | string   | null: false                  |
|description|text      |null:false                    |
| price     |text      |null:false                   |
|user       |reference |null; false, foreign_key: true|

has_one:address
belongs_to:user

## addresses テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
|card_info    | string     | null:false                   |
|dead_line    | string    | null:false                    |
|security_code|string    |null:false                     |
|post_num|    |string    |null:false                      |
|todoufukenn |string     |null:false                      |
|sikuchousonn|string     |null:false                       |
|banchi      |string     |null:false                       |
|build_name  |string     |                                 |
|phone_num   |string     |                                 |




belongs_to:user
belongs_to:item