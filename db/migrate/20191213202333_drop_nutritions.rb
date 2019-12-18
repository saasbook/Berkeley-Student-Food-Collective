class DropNutritions < ActiveRecord::Migration[5.2]
  def change
    drop_table :nutritions
  end
end
