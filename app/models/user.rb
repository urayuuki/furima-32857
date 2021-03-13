class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :user_items

  validates :nickname, :email, :birth_info, presence: true

  with_options presence: true do
    validates :last_name, presence: { message: 'last name cant be black' }
    validates :first_name, presence: { message: 'first name cant be black' }
    validates :last_name_kana, presence: { message: 'last name kana cant be black' }
    validates :first_name_kana, presence: { message: 'first name kana cant be black' }
  end

  validates :email, uniqueness: true

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }

  validates :first_name,
            :last_name,
            format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width characters' }

  validates  :first_name_kana,
             :last_name_kana,
             format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width characters' }
end
