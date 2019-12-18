class DropVendors < ActiveRecord::Migration[5.2]
  def change
    drop_table :vendors
  end
end
