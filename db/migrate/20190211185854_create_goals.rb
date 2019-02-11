class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :board, foreign_key: true
      t.references :cell, foreign_key: true
      t.string :name
      t.date :deadline
      t.boolean :finished

      t.timestamps
    end
  end
end
