class GoalBoard < ApplicationRecord
  belongs_to :board
  has_many :task_boards, dependent: :destroy
end
