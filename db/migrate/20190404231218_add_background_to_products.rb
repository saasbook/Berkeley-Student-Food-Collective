class AddBackgroundToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :origin, :text
    add_column :products, :cultural_history, :text
  end
end
