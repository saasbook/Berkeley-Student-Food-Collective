class CreateTaggedVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :tagged_vendors do |t|
      t.belongs_to :my_vendor
      t.belongs_to :producer_tag
    end
  end
end
