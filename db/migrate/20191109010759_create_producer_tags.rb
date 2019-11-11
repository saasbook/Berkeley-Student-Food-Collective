class CreateProducerTags < ActiveRecord::Migration[5.2]
  def change
    create_table :producer_tags do |t|
      t.string :name
      t.string :description
      t.string :picture
    end
  end
end
