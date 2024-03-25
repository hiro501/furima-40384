# README

# テーブル設計

## usersテーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| name                | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| kanji_last_name     | string | null: false               |
| kanji_first_name    | string | null: false               |
| katakana_last_name  | string | null: false               |
| katakana_first_name | string | null: false               |
| birthdate           | date   | null: false               |

- has_many: items
- has_many: comments
- has_many: orders

## itemsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| price           | integer    | null: false                    |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

- belongs_to: user
- has_many: comments
- has_one: order

## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to: user
- belongs_to: item

## ordersテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

- belongs_to: order