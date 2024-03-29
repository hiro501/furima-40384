FactoryBot.define do
  factory :user do
    name                    {'test'}
    email                   {Faker::Internet.email}
    password                {'11111a'}
    password_confirmation   {password}
    kanji_last_name         {'山田'}
    kanji_first_name        {'太郎'}
    katakana_last_name      {'ヤマダ'}
    katakana_first_name     {'タロウ'}
    birth_date              {'2000-01-01'}
  end
end
