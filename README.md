# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| identification  | string | null: false |
| birthday   | string | null: false |

### Association

- has_one :product
- has_one :purchase information

##  items テーブル

| Column            | Type      | Options      |
|  ------           | ------    | -----------  |
| name              |  text     |  null: false |
| category_id       |  integer  |  null: false |
| seller            | references | null: false, foreign_key: true |
| exhibition image       |  integer  |  null: false |
| product description     |  integer  |  null: false |
| product details     |  integer  |  null: false |
| regarding delivery     |  integer  |  null: false |
| selling price     |  integer  |  null: false |


### Association

- belongs_to :users

##  items テーブル

| Column                            | Type      | Options      |
|  ------                           | ------    | -----------  |
| confirmation of purchase details  | references | null: false, foreign_key: true |
| credit card information input     | references | null: false, foreign_key: true |
| enter delivery address            | references | null: false, foreign_key: true |

### Association

- belongs_to :users