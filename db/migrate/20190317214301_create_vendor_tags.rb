class CreateVendorTags < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_tags do |t|
      t.references 'tag'
      t.references 'vendor'
      t.timestamps
    end
  end
end
