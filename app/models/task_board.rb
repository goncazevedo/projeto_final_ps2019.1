class TaskBoard < ApplicationRecord
  belongs_to :goal_board

  validates :name, :description, :goal_board_id, presence: true
end
