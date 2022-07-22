# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                        | Type    | Options     |
| ------------------            | ------- | ----------- |
| nickname                      | string  | null: false |
| email                         | string  | null: false |
| encrypted_password            | string  | null: false |
| last_name_chinese_characters  | string  | null: false |
| first_name_chinese_characters | string  | null: false |
| last_name_katakana            | string  | null: false |
| first_name_katakana           | string  | null: false |
| birth_y                       | integer | null: false |
| birth_m                       | integer | null: false |
| birth_d                       | integer | null: false |

### Association

- has_many :items
- has_many :user_records
- has_many :records, through: :user_records


## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| explanation        | text    | null: false |
| detail_category    | string  | null: false |
| detail_condition   | string  | null: false |
| delivery_charge    | string  | null: false |
| delivery_area      | string  | null: false |
| delivery_date      | string  | null: false |
| price              | integer | null: false |

### Association

- has_one :record
- belongs_to :user


## records テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| purchase_date      | datetime   | null: false                    |
| item               | references | null: false, foreign_key: true |

### Association

- has_many :user_records
- has_many :users, through: :user_records
- has_one :address
- belongs_to :item

## user_records テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| record             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :record


## addresses テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| postcode                | integer    | null: false |
| prefecture              | string     | null: false |
| municipality            | string     | null: false |
| street_number           | string     | null: false |
| building_name           | string     | null: true  |
| phone                   | integer    | null: false |
| record                  | references | null: false, foreign_key: true |

### Association

- belongs_to :records