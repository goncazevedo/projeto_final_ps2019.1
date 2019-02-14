class AddProjectToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :project, :boolean
  end
end
