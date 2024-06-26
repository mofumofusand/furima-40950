# テーブル設計

## users

| Column             | Type    | Options               |
|--------------------|---------|-----------------------|
| nickname           | string  | NOT NULL              |
| email              | string  | NOT NULL, ユニーク制約 |
| encrypted_password | string  | NOT NULL              |
| family name        | string  | NOT NULL              |
| first name         | string  | NOT NULL              |
| family name(kana)  | string  | NOT NULL              |
| first name(kana)   | string  | NOT NULL              |
| date of birth      | integer | NOT NULL              |


### Association

- has_many :items
- has_many :buys


## items

| Column            | Type       | Options            |
|-------------------|------------|--------------------|
| name              | string     | NOT NULL           |
| content           | text       | NOT NULL           |
| category_id       | integer    | NOT NULL, 外部キー |
| condition_id      | integer    | NOT NULL, 外部キー |
| bear_id           | integer    | NOT NULL, 外部キー |
| area_id           | integer    | NOT NULL, 外部キー |
| number of days_id | integer    | NOT NULL, 外部キー |
| price             | integer    | NOT NULL           |
| user              | references | NOT NULL, 外部キー |


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
| user    | references | NOT NULL, 外部キー |
| item    | references | NOT NULL, 外部キー |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses

| Column           | Type        | Options            |
|-------------------|------------|--------------------|
| post code         | integer    | NOT NULL           |
| prefecture_id     | integer    | NOT NULL, 外部キー |
| municipalities    | text       | NOT NULL           |
| block             | string     | NOT NULL           |
| building name     | string     | NOT NULL           |
| phone number      | integer    | NOT NULL           |
| buy               | references | NOT NULL, 外部キー |

### Association

- belongs_to :buy
