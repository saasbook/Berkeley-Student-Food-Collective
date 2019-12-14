class DropProducts < ActiveRecord::Migration[5.2]
  def change
    drop_table :products do |t|
      t.string 'name'
      t.boolean 'vegan'
      t.boolean 'gluten-free'
      t.boolean 'dairy-free'
      t.boolean 'lc_based'
      t.boolean 'fair'
      t.boolean 'eco_sound'
      t.boolean 'humane'
      t.string 'upc'
      t.references 'vendor'
      t.timestamps
    end
  end
end
