# -*- encoding : utf-8 -*-
class CreateCoffeeTypes < ActiveRecord::Migration
  def change
    create_table :coffee_types do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
