class DropPackagings < ActiveRecord::Migration[5.2]
  def change
    drop_table :packagings do |t|
      t.string :name

      t.timestamps
    end
  end
end
