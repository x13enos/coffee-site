class AddMainScreenImageToPainting < ActiveRecord::Migration
  def change
    add_column :paintings, :main, :boolean

  end
end
