class DropProducts < ActiveRecord::Migration[5.2]
  def change
    drop_table :products
  end
end
