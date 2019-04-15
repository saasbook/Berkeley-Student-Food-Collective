class RemoveDescriptionFromVendors < ActiveRecord::Migration[5.2]
  def change
    remove_column :vendors, :description, :string
  end
end
