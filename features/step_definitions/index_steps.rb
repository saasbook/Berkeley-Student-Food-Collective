Given /there are (.*) (.*)/ do |num, type|
	i = 0
	num.to_i.times do
		FactoryBot.create(type[0..type.length - 1].to_sym, :name => i.to_s)
		i += 1
	end
end

Then /I should see (.*) (.*) on the customer-facing page/ do |num, type|
	expect(page).to have_selector(type, count: num.to_i)
end