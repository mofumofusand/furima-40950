# テーブル設計

## users

| Column             | Type    | Options                  |
|--------------------|---------|--------------------------|
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| family_name        | string  | null: false              |
| first_name         | string  | null: false              |
| family_name_kana   | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday           | date    | null: false              |


### Association

- has_many :items
- has_many :buys


## items

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| name              | string     | null: false                    |
| content           | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| bear_id           | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| number_of_days_id | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buy
- belongs_to :category
- belongs_to :condition
- belongs_to :Bear
- belongs_to :area
- belongs_to :date
 

## buys

| Column  | Type       | Options            |
|---------|------------|--------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses

| Column           | Type        | Options                        |
|-------------------|------------|--------------------------------|
| post_code         | integer    | null: false                    |
| prefecture_id     | integer    | null: false,                   |
| municipalities    | text       | null: false                    |
| block             | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| buy               | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
