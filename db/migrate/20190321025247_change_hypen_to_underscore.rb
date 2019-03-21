class ChangeHypenToUnderscore < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, "gluten-free", :gluten_free
  	rename_column :products, "dairy-free", :dairy_free
  end
end
