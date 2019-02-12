class CreateTaskCells < ActiveRecord::Migration[5.2]
  def change
    create_table :task_cells do |t|
      t.string :name
      t.text :description
      t.boolean :finished
      t.references :goal_cell, foreign_key: true

      t.timestamps
    end
  end
end
