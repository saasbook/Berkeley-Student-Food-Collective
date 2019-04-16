class AddStoryToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :story, :text
    add_column :vendors, :mission, :text
  end
end
