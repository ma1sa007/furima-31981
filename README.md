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
| name                     |  text        |  null: false |
| category_id              |  integer     |  null: false |
| user                     | references   | null: false, foreign_key: true |
| product_description      |  text        |  null: false |
| product status_id        |  integer     |  null: false |
| shipping fee burden_id   |  integer     |  null: false |
| shipping area_id         |  integer     |  null: false |
| days to ship_id          |  integer     |  null: false |
| regarding delivery_id    |  integer     |  null: false |
| selling price_id         |  integer     |  null: false |


### Association

- belongs_to :user

##  addresses テーブル

| Column                            | Type      | Options      |
|  ------                           | ------    | -----------  |
| postal code_id                    |  integer     |  null: false |
| prefectures_id                    |  integer     |  null: false |
| municipalities_id                 |  integer     |  null: false |
| address_id                        |  integer     |  null: false |
| building name_id                  |  integer     |  null: false |
| phone number_id                   |  integer     |  null: false |

### Association

- belongs_to :user


#  purchase infomations テーブル

| Column                           | Type      | Options      |
|  ------                          | ------    | -----------  |
| user                             | references | null: false, foreign_key: true |
| item                             | references | null: false, foreign_key: true |
| confirmation of purchase details | references | null: false, foreign_key: true |
| credit card information input    | references | null: false, foreign_key: true |
| enter delivery address           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items