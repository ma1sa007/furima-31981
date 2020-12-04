# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | null: false |

### Association

- has_one :users
- has_one :rooms, through: users
- has_one :messages

##  items テーブル

| Column          | Type   | Options      |
|  ------         | ------ | -----------  |
| product name    |  text  |  null: false |
| category        |  text  |  null: false |
| seller          |  text  |  null: false |

### Association

- has_one :room_users
- has_one :users, through: room_users
- has_one :messages

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
|   title  | string| null: false |
| catch_copy | text | null: false |
| concept | text | null: false |
| profile  | text   | null: false |
| image | text | null: false |
| user | refernces  |

### Association


- belongs_to :room
- belongs_to :user