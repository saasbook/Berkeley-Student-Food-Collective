class CreateProductTags < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tags do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.belongs_to :product_tag_category
    end
  end
end
