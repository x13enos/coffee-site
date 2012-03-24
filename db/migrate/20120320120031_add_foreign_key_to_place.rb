class AddForeignKeyToPlace < ActiveRecord::Migration
  def change
    add_column :places, :category_id, :integer

  end
end
