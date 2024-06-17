class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

    validates :nickname, presence: true
    validates :email, presence: true, uniqueness: { message: "has already been taken" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email" }
    validates :password, presence: true, length: { minimum: 6, message: "is too short (minimum is %{count} characters)" }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" }
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
    validates :birth_date, presence: true

end