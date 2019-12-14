class DropProductCertifications < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_certifications do |t|
      t.references 'product'
      t.references 'certification'

      t.timestamps
    end
  end
end
