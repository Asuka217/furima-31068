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
| first_name_kane | string | null: false |
| last_name_kana  | string | null: false | 
| birthday        | date   | null: false |

### Association 

- has_many :items
- has_many :buyer_infos


## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| title           | string     | null: false       |
| explication     | text       | null: false       |
| price           | integer    | null: false       |
| user_id         | integer    | foreign_key: true |
| category_id     | integer    | null: false       |
| item_status_id  | integer    | null: false       |
| fee_shipping_id | integer    | null: false       |
| region_id       | integer    | null: false       |
| days_to_ship_id | integer    | null: false       |

### Association

- belongs_to :user
- has_one :buyer_info
- belongs_to_active_hash :shipping_info
- belongs_to_active_hash :detail_item


## destinations テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | string     | null: false       |  
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| telephone     | string     | null: false       |
| buyer_info_id | integer    | foreign_key: true |
| prefecture_id | integer    | null: false       |

### Association

- belongs_to :buyer_info
- belongs_to_active_hash :select_prefecture


## buyer_infos テーブル

| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| user_id     | integer | foreign_key: true |
| item_id     | integer | foreign_key: true |

### Association 

- has_one :destination
- belongs_to :user
- belongs_to :item

