# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last-name       | string | null: false |
| first-name      | string | null: false |
| last-name-kana  | string | null: false |
| first-name-kana | string | null: false |
| birth-date      | string | null: false |

### Association

- has_many : items
- has_many : purchase

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item-name       | string     | null: false                    |
| exhibitor       | references | null: false, foreign_key: true |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery-charge | string     | null: false                    |
| area            | string     | null: false                    |
| shipping-date   | string     | null: false                    |


### Association

- belongs_to : users
- has_one : purchase

## purchase テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| credit-number | string     | null: false                    |
| address       | string     | null: false                    |

### Association

- belongs_to :users
- belongs_to :items
