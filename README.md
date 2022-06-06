## user

|Column              |Type                 |Options                    |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| nick name          | string              | null: false               |
| first name         | string              | null: false               |
| last name          | string              | null: false               |
| first name katakana| string              | null: false               |
| last name katakana | string              | null: false               |
| date of birth      | string              | null: false               |



### Association
* has_many :items
* has_many :purchase record

## items

|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| situation       | string     | null: false
| delivery charge | string     | null: false                    |
| area            | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase record

## purchase record

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| sipping information | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
| items               | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :items
has_one :sipping information

## sipping information

|Column          |Type    |Options      |
|----------------|--------|-------------|
| credit card    | string | null: false |
| post cord      | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building       | string |             |
| phone number   | string | null: false |


### Association

belogs_to :purchase record