class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   # 半角以外の正規表現      
  validates :family_name, :first_name,format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力して下さい"
  }

  validates :family_name_kana, :first_name_kana,format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }

  
end

