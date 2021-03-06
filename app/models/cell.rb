class Cell < ApplicationRecord
    has_many :goal_cells, dependent: :destroy
    has_many :users

    validates :name, :description, presence: true
end
