class DropCertifications < ActiveRecord::Migration[5.2]
  def change
    drop_table :certifications do |t|
      t.string :name

      t.timestamps
    end
  end
end
