class DropProductCertifications < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_certifications
  end
end
