class CreateGoalCells < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_cells do |t|
      t.string :name
      t.date :deadline
      t.boolean :finished
      t.references :cell, foreign_key: true

      t.timestamps
    end
  end
end
