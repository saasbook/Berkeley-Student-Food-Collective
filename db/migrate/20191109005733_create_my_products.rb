class CreateMyProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :my_products do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.belongs_to :my_vendor
      t.timestamps
    end
  end
end