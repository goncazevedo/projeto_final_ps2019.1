class AddEntryToHistoricCell < ActiveRecord::Migration[5.2]
  def change
    add_column :historic_cells, :entry, :date
  end
end
