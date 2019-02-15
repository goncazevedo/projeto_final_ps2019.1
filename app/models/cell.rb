class Cell < ApplicationRecord
    has_many :goal_cells, dependent: :destroy
    has_many :users

    belongs_to :board

    validates :name, :description, presence: true
end
