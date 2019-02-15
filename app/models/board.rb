class Board < ApplicationRecord
    has_many :goal_boards, dependent: :destroy
    has_many :users
    has_many :cells

    #Relação N pra N
    has_many :historic_boards
    has_many :users, through: :historic_boards

    #Relação N pra N
    has_many :fusions
    has_many :users, through: :fusions

    validates :name, :description, presence: true
end
