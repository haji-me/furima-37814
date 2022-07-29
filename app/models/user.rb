class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  zenkaku = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  katakana = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/

  validates :nickname,          presence: true
  validates :password,          format: { with: PASSWORD_REGEX }
  validates :last_name,         presence: true,
                                format: { with: zenkaku }
  validates :first_name,        presence: true,
                                format: { with: zenkaku }
  validates :last_name_kana,    presence: true,
                                format: { with: katakana }
  validates :first_name_kana,   presence: true,
                                format: { with: katakana }
  validates :birth,             presence: true
end
