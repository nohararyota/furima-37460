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
| date_of_birth      | datetime              | null: false               |



### Association
* has_many :items
* has_many :purchase_records

## items

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| text               | text       | null: false                    |
| category_id        | string     | null: false                    |
| situation_id       | string     | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :users
has_one :purchase_records

## purchase records

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| sipping_information | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
| items               | references | null: false, foreign_key: true |


### Association
belongs_to :users
belongs_to :items
has_one :sipping_information

## sipping information

|Column          |Type       |Options      |
|----------------|-----------|-------------|
| post_cord      | integer   | null: false |
| prefectures_id | integer   | null: false |
| municipalities | string    | null: false |
| address        | string    | null: false |
| building       | string    |             |
| phone_number   | datetime  | null: false |


### Association

belongs_to :purchase_records