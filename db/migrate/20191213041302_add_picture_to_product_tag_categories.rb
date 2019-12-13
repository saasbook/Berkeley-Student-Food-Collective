class AddPictureToProductTagCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_tag_categories, :picture, :string
  end
end
