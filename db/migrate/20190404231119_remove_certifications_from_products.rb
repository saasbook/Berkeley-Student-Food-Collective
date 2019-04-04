class RemoveCertificationsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :vegan, :boolean
    remove_column :products, :gluten_free, :boolean
    remove_column :products, :dairy_free, :boolean
  end
end
