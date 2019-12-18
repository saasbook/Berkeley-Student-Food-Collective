class DropProductNutritions < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_nutritions
  end
end
