class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :board, foreign_key: true
      t.references :cell, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :cell_kind
      t.integer :board_kind
      t.string :photo
      t.boolean :creation_cell

      t.timestamps
    end
  end
end
