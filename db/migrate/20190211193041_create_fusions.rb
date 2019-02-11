class CreateFusions < ActiveRecord::Migration[5.2]
  def change
    create_table :fusions do |t|
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
