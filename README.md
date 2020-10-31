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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false | 
| birthday        | date   | null: false |

### Association 

- has_many :items
- has_many :buy


## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| title           | string     | null: false       |
| explication     | text       | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |
| category_id     | integer    | null: false       |
| item_status_id  | integer    | null: false       |
| fee_shipping_id | integer    | null: false       |
| region_id       | integer    | null: false       |
| days_to_ship_id | integer    | null: false       |

### Association

- belongs_to :user
- has_one :buy
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :fee_shipping
- belongs_to_active_hash :region
- belongs_to_active_hash :days_to_ship


## destinations テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | string     | null: false       |  
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| telephone     | string     | null: false       |
| user          | references | foreign_key: true |
| region_id     | integer    | null: false       |

### Association

- belongs_to :buy
- belongs_to_active_hash :select_prefecture


## buys テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association 

- has_one :destination
- belongs_to :user
- belongs_to :item