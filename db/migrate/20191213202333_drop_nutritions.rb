class DropNutritions < ActiveRecord::Migration[5.2]
  def change
    drop_table :nutritions do |t|
      t.string :name

      t.timestamps
    end
  end
end
