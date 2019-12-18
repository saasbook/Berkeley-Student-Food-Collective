class DropPackagings < ActiveRecord::Migration[5.2]
  def change
    drop_table :packagings
  end
end
