class AddTagslistToMyProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :my_products, :tagslist, :string
  end
end
