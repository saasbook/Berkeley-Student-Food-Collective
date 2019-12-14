class DropVendors < ActiveRecord::Migration[5.2]
  def change
    drop_table :vendors do |t|
      t.string "name"
      t.string "address"
      t.string "facebook"
      t.string "twitter"
      t.string "instagram"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.text "story"
      t.text "mission"
      t.string "picture"
    end
  end
end
