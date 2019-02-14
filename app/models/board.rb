class Board < ApplicationRecord
    has_many :goal_boards, dependent: :destroy
    has_many :users

    #Relação N pra N
    has_many :fusions
    has_many :users, through: :fusions

    validates :name, :description, presence: true
end
