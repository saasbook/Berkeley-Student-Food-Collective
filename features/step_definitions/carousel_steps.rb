And /I hover over the third carousel element/ do 
	find('#button3').hover
end

Then /the left elements should shift to the left/ do
	expect(find("#button1")['class']).to contain("carousel_element spreadLeft") 
	expect(find("#button2")['class']).to contain("carousel_element spreadLeft") 
end

And /the right elements should shift to the right/ do
	expect(find("#button4")['class']).to contain("carousel_element spreadRight") 
	expect(find("#button5")['class']).to contain("carousel_element spreadRight") 
	expect(find("#button6")['class']).to contain("carousel_element spreadRight") 
	expect(find("#button7")['class']).to contain("carousel_element spreadRight") 
	expect(find("#button8")['class']).to contain("carousel_element spreadRight") 
	expect(find("#button9")['class']).to contain("carousel_element spreadRight") 
	expect(find("#button10")['class']).to contain("carousel_element spreadRight") 
end	

Then /I should see a vendor carousel for (.*)/ do |type|
	save_and_open_page
	expect(find_by_id("#{type}")).not_to be nil
end
