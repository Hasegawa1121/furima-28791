class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname,              presence: { message: "入力が正しくありません。" }
  validates :email,                 presence: true, uniqueness: false, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "入力が正しくありません。" }
  validates :password,              presence: true, format: { with:  /\A(?=.*?[a-z])[a-z\d]+\z/, message: "入力が正しくありません。" }, length: { minimum: 6 }
  validates :password_confirmation, presence: { message: "入力が正しくありません。" }
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "入力が正しくありません。" }
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "入力が正しくありません。" }
  validates :last_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "入力が正しくありません。" }
  validates :first_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "入力が正しくありません。" }
  validates :birth_date,            presence: { message: "入力が正しくありません。" }

end
