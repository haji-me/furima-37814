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
| email                         | string  | null: false, unique: true |
| encrypted_password            | string  | null: false |
| last_name_chinese_characters  | string  | null: false |
| first_name_chinese_characters | string  | null: false |
| last_name_katakana            | string  | null: false |
| first_name_katakana           | string  | null: false |
| birth                         | date    | null: false |


### Association

- has_many :items
- has_one :record


## items テーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| name                  | string      | null: false                    |
| explanation           | text        | null: false                    |
| detail_category_id    | integer     | null: false                    |
| detail_condition_id   | integer     | null: false                    |
| delivery_charge_id    | integer     | null: false                    |
| prefecture_id         | integer     | null: false                    |
| delivery_date_id      | integer     | null: false                    |
| price                 | integer     | null: false                    |
| user                  | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record



## records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column                        | Type       | Options                        |
| ----------------------------- | ---------- | ------------------------------ |
| postcode                      | string    | null: false                    |
| prefecture_id                 | integer    | null: false                    |
| municipality                  | string     | null: false                    |
| street_number                 | string     | null: false                    |
| building_name                 | string     |                                |
| phone                         | string     | null: false                    |
| record                        | references | null: false, foreign_key: true |

### Association

- belongs_to :record