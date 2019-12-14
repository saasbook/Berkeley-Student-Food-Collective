class CreateProductTagCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tag_categories do |t|
      t.string :name
      t.string :description
      t.string :picture
    end
  end
end
