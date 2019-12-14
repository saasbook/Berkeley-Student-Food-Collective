class DropVendorOwnerships < ActiveRecord::Migration[5.2]
  def change
    drop_table :vendor_ownerships do |t|
      t.references 'vendor'
      t.references 'ownership'

      t.timestamps
    end
  end
end
