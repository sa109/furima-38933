class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, presence: true
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: ' is invalid. Input full-width characters' }
  validates :first_name_kana, :last_name_kana,format: { with: /\A[ァ-ヶー－]+\z/, message: ' is invalid. Input full-width katakana characters' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'
end
