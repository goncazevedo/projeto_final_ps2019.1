class Project < ApplicationRecord
    #Relação N pra N
    has_many :project_users
    has_many :users, through: :project_users

    #Relação N pra N
    has_many :project_tags
    has_many :tags, through: :project_tags
end
