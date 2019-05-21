class CreateVendorOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_ownerships do |t|
      t.references 'vendor'
      t.references 'ownership'

      t.timestamps
    end
  end
end
