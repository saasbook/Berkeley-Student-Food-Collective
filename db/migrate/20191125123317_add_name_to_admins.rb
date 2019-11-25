class AddNameToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name, :string
  end
end
