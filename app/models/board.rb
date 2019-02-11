class Board < ApplicationRecord
    has_many :goals
    has_many :users

    #Relação N pra N
    has_many :fusions
    has_many :users, through: :fusions
end
