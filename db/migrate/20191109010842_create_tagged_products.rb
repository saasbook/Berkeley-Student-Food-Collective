class CreateTaggedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tagged_products do |t|
      t.belongs_to :my_product
      t.belongs_to :product_tag
    end
  end
end
