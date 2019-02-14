class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project_id, presence: true, uniqueness: {:scope => :user_id}
  validates :user_id, presence: true
end
