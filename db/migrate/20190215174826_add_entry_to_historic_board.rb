class AddEntryToHistoricBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :historic_boards, :entry, :date
  end
end
