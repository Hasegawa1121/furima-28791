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
| birth-date      | date   | null: false |

### Association

- has_many : items
- has_many : purchase

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| user            | reference  | null: false, foreign_key: true |
| price           | string     | null: false                    |
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
| user          | reference  | null: false, foreign_key: true |
| item          | reference  | null: false, foreign_key: true |

### Association

- belongs_to : users
- belongs_to : items
- has_one : address

## address テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| city          | string | null: false |
| house_number  | string | null: false |
| building-name | string | null: false |
| phone-number  | string | null: false |

### Association

- belongs_to : purchase