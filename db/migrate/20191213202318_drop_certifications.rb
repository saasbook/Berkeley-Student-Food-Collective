class DropCertifications < ActiveRecord::Migration[5.2]
  def change
    drop_table :certifications
  end
end
