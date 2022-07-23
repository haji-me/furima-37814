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
- has_many :user_items
- has_many :items, through: :user_records


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
- has_many :user_items
- has_many :users, through: :user_records



## user_items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchase           | date       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column                        | Type       | Options                        |
| ----------------------------- | ---------- | ------------------------------ |
| postcode                      | integer    | null: false                    |
| prefecture_id                 | integer    | null: false                    |
| municipality                  | string     | null: false                    |
| street_number                 | string     | null: false                    |
| building_name                 | string     |                                |
| phone                         | string     | null: false                    |
| user_items                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user_items