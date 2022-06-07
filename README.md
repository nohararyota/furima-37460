## users

|Column              |Type                   |Options                    |
|--------------------|-----------------------|---------------------------|
| email              | string                | null: false, unique: true |
| encrypted_password | string                | null: false               |
| nick_name          | string                | null: false               |
| first_name         | string                | null: false               |
| last_name          | string                | null: false               |
| first_name_katakana| string                | null: false               |
| last_name_katakana | string                | null: false               |
| date_of_birth      | date                  | null: false               |



### Association
* has_many :item
* has_many :purchase_record

## items

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| product_name       | string     | null: false                    |
| description_of_item| text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days to ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record

## purchase records

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :sipping_information

## sipping information

|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| post_cord       | string     | null: false                    |
| area_id         | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | datetime   | null: false                    |
| purchase record | references | null: false, foreign_key: true |


### Association

belongs_to :purchase_record