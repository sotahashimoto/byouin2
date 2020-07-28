class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image
  has_many :favorites
  has_many :comments, dependent: :destroy
  # has_many :"ここと", through: :"ここ", source: 'hospital'同じ名前だと無限ループ
  has_many :favorites_hospital, through: :favorites, source: 'hospital'

  def already_favorited?(hospital)
    self.favorites.exists?(hospital_id: hospital.id)
  end
end