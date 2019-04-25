class AddTypeToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :type, :string
  end
end
