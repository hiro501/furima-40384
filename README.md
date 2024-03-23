# README

# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| kanji_name         | text   | null: false               |
| katakana_name      | text   | null: false               |

- has_many: items
- has_many: comments
- has_one: order

## itemsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| price       | integer    | null: false                    |
| item_name   | text       | null: false                    |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

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
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| total_paid     | integer    | null: false                    |
| postal_code    | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

- belongs_to: user
- belongs_to: item