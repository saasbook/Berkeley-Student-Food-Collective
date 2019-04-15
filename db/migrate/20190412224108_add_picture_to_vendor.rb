class AddPictureToVendor < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :picture, :string
  end
end
