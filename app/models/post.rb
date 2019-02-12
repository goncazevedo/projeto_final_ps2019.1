class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  
  #Relação N pra N
  has_many :post_tags
  has_many :tag, through: :post_tags
end
