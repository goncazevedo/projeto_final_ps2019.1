class ProjectTag < ApplicationRecord
  belongs_to :tag
  belongs_to :project

  validates :tag_id, presence: true, uniqueness: {:scope => :project_id}
  validates :project_id, presence: true
end
