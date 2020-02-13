class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true

   # 半角以外の正規表現      
  validates :family_name, :first_name,format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力して下さい"
  }

  validates :family_name_kana, :first_name_kana,format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }

  belongs_to :card
end

