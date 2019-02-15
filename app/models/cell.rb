class Cell < ApplicationRecord
    has_many :goal_cells, dependent: :destroy
    has_many :users

    has_many :historic_cells
    has_many :users, through: :historic_cells

    belongs_to :board

    validates :name, :description, presence: true
end
