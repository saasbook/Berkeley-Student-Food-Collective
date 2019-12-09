class AddTagslistToMyVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :my_vendors, :tagslist, :string
  end
end
