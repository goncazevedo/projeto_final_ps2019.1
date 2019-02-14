class TaskCell < ApplicationRecord
  belongs_to :goal_cell

  validates :name, :description, :goal_cell_id, presence: true
end
