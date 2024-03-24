# README

# テーブル設計

## usersテーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| name                | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| kanji_last_name     | text   | null: false               |
| kanji_first_name    | text   | null: false               |
| katakana_last_name  | text   | null: false               |
| katakana_first_name | text   | null: false               |
| birth_year          | date   | null: false               |
| birth_month         | date   | null: false               |
| birth_day           | date   | null: false               |

- has_many: items
- has_many: comments
- has_one: order

## itemsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| price       | integer    | null: false                    |
| item_name   | string       | null: false                    |
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
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

- belongs_to: order