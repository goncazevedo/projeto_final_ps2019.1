class CreateHistoricBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :historic_boards do |t|
      t.references :board, foreign_key: true
      t.references :user, foreign_key: true
      t.date :departure

      t.timestamps
    end
  end
end
