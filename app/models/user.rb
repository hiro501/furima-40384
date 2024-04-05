class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :items
has_many :orders

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/

  with_options presence: true do
    validates :name
    validates :kanji_last_name, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/ }
    validates :kanji_first_name, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/ }
    validates :katakana_last_name, format: { with: /\A[\p{Katakana}ー－]+\z/ }
    validates :katakana_first_name, format: { with: /\A[\p{Katakana}ー－]+\z/ }
    validates :birth_date
  end
  validates :password, format: { with: VALID_PASSWORD_REGEX }

end
