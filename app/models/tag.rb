class Tag < ApplicationRecord
    #Relação N pra N
    has_many :post_tags
    has_many :posts, through: :post_tags

    #Relação N pra N
    has_many :project_tags
    has_many :projects, through: :project_tags

    validates :name, presence: true
end
