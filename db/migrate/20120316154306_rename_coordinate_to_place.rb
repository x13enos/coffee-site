# -*- encoding : utf-8 -*-
class RenameCoordinateToPlace < ActiveRecord::Migration
  def up
  	rename_table :coordinates, :places
  end

  def down
  	rename_table :places, :coordinates
  end
end
