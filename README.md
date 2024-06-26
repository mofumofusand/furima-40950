# テーブル設計

## users

| Column             | Type    | Options               |
|--------------------|---------|-----------------------|
| nickname           | string  | NOT NULL, ユニーク制約 |
| email              | string  | NOT NULL, ユニーク制約 |
| password           | string  | NOT NULL              |
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

| Column    | Type       | Options            |
|-----------|------------|--------------------|
| image     |            |                    |
| name      | string     | NOT NULL           |
| content   | text       | NOT NULL           |
| category  | integer    | NOT NULL, 外部キー |
| condition | integer    | NOT NULL, 外部キー |
| Bear      | integer    | NOT NULL, 外部キー |
| area      | integer    | NOT NULL, 外部キー |
| date      | integer    | NOT NULL, 外部キー |
| price     | integer    | NOT NULL           |
| user      | references | NOT NULL, 外部キー |


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
| address | references | NOT NULL, 外部キー |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address



## addresses

| Column         | Type    | Options            |
|----------------|---------|--------------------|
| post code      | integer | NOT NULL           |
| prefecture     | integer | NOT NULL, 外部キー |
| municipalities | text    | NOT NULL           |
| block          | string  | NOT NULL           |
| building name  | string  | NOT NULL           |
| phone number   | integer | NOT NULL           |

### Association

- has_one :buy
- belongs_to :prefecture



# ActiveHash

## categories

### Association

- has_many :items


## conditions

### Association

- has_many :items


## Bears

### Association

- has_many :items


## areas

### Association

- has_many :items


## dates

### Association

- has_many :items


## prefecture

### Association

- has_many :addresses