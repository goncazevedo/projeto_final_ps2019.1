class PostTag < ApplicationRecord
  belongs_to :tag
  belongs_to :post

  validates :tag_id, presence: true, uniqueness: {:scope => :post_id}
  validates :post_id, presence: true
end
