class DropProductPackagings < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_packagings
  end
end
