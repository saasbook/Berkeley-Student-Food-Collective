class AddNameTypeToTags < ActiveRecord::Migration[5.2]
  def change
  	add_column :tags, :name, :string
  end
end
