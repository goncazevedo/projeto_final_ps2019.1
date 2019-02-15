class CreateHistoricCells < ActiveRecord::Migration[5.2]
  def change
    create_table :historic_cells do |t|
      t.references :cell, foreign_key: true
      t.references :user, foreign_key: true
      t.date :departure

      t.timestamps
    end
  end
end
