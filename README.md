# テーブル設計

## users

| Column             | Type    | Options               |
|--------------------|---------|-----------------------|
| nickname           | string  | NOT NULL              |
| email              | string  | NOT NULL, unique:true |
| encrypted_password | string  | NOT NULL              |
| family_name        | string  | NOT NULL              |
| first_name         | string  | NOT NULL              |
| family_name(kana)  | string  | NOT NULL              |
| first_name(kana)   | string  | NOT NULL              |
| birthday      | date | NOT NULL              |


### Association

- has_many :items
- has_many :buys


## items

| Column            | Type       | Options            |
|-------------------|------------|--------------------|
| name              | string     | NOT NULL           |
| content           | text       | NOT NULL           |
| category_id       | integer    | NOT NULL |
| condition_id      | integer    | NOT NULL |
| bear_id           | integer    | NOT NULL |
| area_id           | integer    | NOT NULL |
| number of days_id | integer    | NOT NULL |
| price             | integer    | NOT NULL           |
| user              | references | NOT NULL, foreign_key: true |


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
| user    | references | NOT NULL, foreign_key: true |
| item    | references | NOT NULL, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses

| Column           | Type        | Options            |
|-------------------|------------|--------------------|
| post_code         | integer    | NOT NULL           |
| prefecture_id     | integer    | NOT NULL, 外部キー |
| municipalities    | text       | NOT NULL           |
| block             | string     | NOT NULL           |
| building_name     | string     |            |
| phone_number      | string    | NOT NULL           |
| buy               | references | NOT NULL, 外部キー |

### Association

- belongs_to :buy
