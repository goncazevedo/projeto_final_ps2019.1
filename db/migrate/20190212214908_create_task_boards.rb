class CreateTaskBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :task_boards do |t|
      t.string :name
      t.text :description
      t.boolean :finished
      t.references :goal_board, foreign_key: true

      t.timestamps
    end
  end
end
