FactoryBot.define do
	factory :product do
		name {'Default Product Name'}
		picture {'https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500'}
		vegan {true}
		gluten_free {false}
		dairy_free {false}
    	organic {false}
		lc_based {false}
		fair {false}
		eco_sound {false}
		upc {'000000000000'}
		vendor_id {1}
	end
end