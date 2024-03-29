class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/

  validates :name, presence: true
  validates :kanji_last_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/ }
  validates :kanji_first_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/ }
  validates :katakana_last_name, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/ }
  validates :katakana_first_name, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/ }
  validates :birth_date, presence: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }

end
