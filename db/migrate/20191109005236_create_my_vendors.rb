class CreateMyVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :my_vendors do |t|
      t.string :name
      t.string :story
      t.string :address
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :picture
      t.timestamps
    end
  end
end
