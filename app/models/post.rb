class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  
  acts_as_commontable
  
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  
  #Relação N pra N
  has_many :post_tags
  has_many :tag, through: :post_tags

  enum kind: {
    article: 0,
    question: 1
  }

  validates :user_id, :title, :content, :kind, presence: true
  
end
