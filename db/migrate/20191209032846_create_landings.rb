class CreateLandings < ActiveRecord::Migration[5.2]
  def change
    create_table :landings do |t|
      t.string :allvendorspicture
      t.string :string
      t.string :allvendorsdescription
      t.string :string
      t.string :vendorsbycatpicture
      t.string :string
      t.string :vendorsbycatdescription
      t.string :string
      t.string :allprodcutspicture
      t.string :string
      t.string :allproductsdescription
      t.string :string
      t.string :productsbycatpicture
      t.string :string
      t.string :productsbycatdescription
      t.string :string

      t.timestamps
    end
  end
end
