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
| description      | text       | null: false, foreign_key: true |
| images_id        | integer    | null: false, foreign_key: true |
| category_id      | integer    | null: false, foreign_key: true |
| condition_id     | integer    | null: false, foreign_key: true |
| postage_payer_id | integer    | null: false, foreign_key: true |
| prefecture_id    | integer    | null: false, foreign_key: true |
| handling_time_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase
- has_many : images

## images テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| image  | string     | null: false                    |
| item   | references | null: false, foreign_key: true |

- belongs_to : item

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
| Prefectures_id | integer    | null: false, foreign_key: true |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building-name  | string     |                                |
| phone-number   | string     | null: false, uniqueness: true  |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to : purchase