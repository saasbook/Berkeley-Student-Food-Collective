class DropProductNutritions < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_nutritions do |t|
      t.references 'product'
      t.references 'nutrition'

      t.timestamps
    end
  end
end
