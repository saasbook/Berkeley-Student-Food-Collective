class CreatePackagings < ActiveRecord::Migration[5.2]
  def change
    create_table :packagings do |t|
      t.string :name

      t.timestamps
    end
  end
end
