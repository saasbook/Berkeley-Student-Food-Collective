class RemoveOrganicFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :organic, :boolean
  end

end
