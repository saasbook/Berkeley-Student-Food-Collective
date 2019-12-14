class DropOwnerships < ActiveRecord::Migration[5.2]
  def change
    drop_table :ownerships do |t|
      t.string :name

      t.timestamps
    end
  end

end
