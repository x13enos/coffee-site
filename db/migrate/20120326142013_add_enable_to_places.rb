class AddEnableToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :enable, :boolean, :default => false

  end
end
