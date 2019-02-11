class Project < ApplicationRecord
    #Relação N pra N
    has_many :project_users
    has_many :users, through: :project_users
end
