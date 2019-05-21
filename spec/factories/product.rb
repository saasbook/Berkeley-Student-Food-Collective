FactoryBot.define do
	factory :product do
		name {'Default Product Name'}
		picture {'http://www.google.com'}
		origin { 'Default Product Origin' }
		cultural_history { 'Default Product Cultural History' }
		vegan {true}
		gluten_free {false}
		dairy_free {false}
		lc_based {true}
		fair {true}
		eco_sound {true}
		humane {true}
		upc {'000000000000'}
		vendor_id {1}
	end
end