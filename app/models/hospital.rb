class Hospital < ApplicationRecord
  attachment :hospital_image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end