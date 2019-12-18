class DropVendorOwnerships < ActiveRecord::Migration[5.2]
  def change
    drop_table :vendor_ownerships
  end
end
