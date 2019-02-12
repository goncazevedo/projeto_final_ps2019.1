class CreateGoalBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_boards do |t|
      t.string :name
      t.date :deadline
      t.boolean :finished
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
