class GoalCell < ApplicationRecord
  belongs_to :cell
  has_many :task_cells, dependent: :destroy

  validates :name, :deadline, :cell_id, presence: true
end
