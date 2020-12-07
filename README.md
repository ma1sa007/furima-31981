# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| first_name     | string | null: false |
| last_name       | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana  | string | null: false |
| nickname  | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| birthday   | date | null: false |

### Association

- has_many :items
- has_many :purchase_informations

##  items テーブル

| Column                   | Type         | Options      |
|  ------                  | ------       | -----------  |
| name                     |  string        |  null: false |
| category_id              |  integer     |  null: false |
| user                     | references   | null: false, foreign_key: true |
| product_description      |  text        |  null: false |

| shipping_charges_id  |  integer     |  null: false |
| shipping_area_id      |  integer     |  null: false |
| days_to_ship_id        |  integer     |  null: false |
| regarding_delivery    |  integer     |  null: false |
| selling_price            |  integer     |  null: false |


### Association
- belongs_to :user
- has_one :purchase_infomation

##  addresses テーブル

| Column                            | Type      | Options      |
|  ------                           | ------    | -----------  |
| postal_code                       |  string    |  null: false |
| shipping_area_id                 |  integer     |  null: false |
| municipalities                    |  string     |  null: false |
| address                           |  string     |  null: false |
| building_name                     |  string    |  null: false |
| phone_number                      |  string     |  null: false |
| purchase_infomation               | references | null: false, foreign_key: true |
### Association

- belongs_to :purchase_infomation

#  purchase_infomation テーブル

| Column                           | Type      | Options      |
|  ------                          | ------    | -----------  |
| user                             | references | null: false, foreign_key: true |
| item                             | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address