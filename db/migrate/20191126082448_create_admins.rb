class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
    add_index :admins, :name, unique: true
  end
end
