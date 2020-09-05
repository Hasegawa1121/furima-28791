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
- has_many : purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| price            | string     | null: false                    |
| description      | text       | null: false                    |
| images_id        | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| handling_time_id | integer    | null: false                    |

### Association

- belongs_to : user
- has_one : purchase

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building-name  | string     |                                |
| phone-number   | string     | null: false, uniqueness: true  |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to : purchase