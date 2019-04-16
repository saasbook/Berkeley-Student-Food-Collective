class CreateProductPackagings < ActiveRecord::Migration[5.2]
  def change
    create_table :product_packagings do |t|
      t.references 'product'
      t.references 'packaging'

      t.timestamps
    end
  end
end
