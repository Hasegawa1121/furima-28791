class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: { message: '入力が正しくありません。' } do
    validates :nickname
    validates :email,                 uniqueness: false, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password,              format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6 }
    validates :password_confirmation
    validates :last_name,             format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana,        format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana,       format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end

end