class AddPostToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :post, :boolean
  end
end
