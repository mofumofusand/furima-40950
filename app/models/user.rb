class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :items
   has_many :buys

  validates :nickname, presence: true, length: { maximum: 40 }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :family_name
    validates :first_name
  end

  
  with_options presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/} do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

end
