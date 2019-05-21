class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string 'name'
	    t.string 'description'
	    t.string 'address'
	    t.string 'facebook'
  	  t.string 'twitter'
	    t.string 'instagram'
	    
      t.timestamps
    end
  end
end
