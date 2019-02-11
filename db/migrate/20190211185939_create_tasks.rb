class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :goal, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :finished

      t.timestamps
    end
  end
end
