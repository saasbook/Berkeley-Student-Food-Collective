# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@poc = Ownership.create(name: 'Person of Color')
@women = Ownership.create(name: 'Women')
@worker = Ownership.create(name: 'Worker-owned')
@lgbtq = Ownership.create(name: 'LGBTQ+')
@disabled = Ownership.create(name: 'Disabled')

Packaging.create(name: 'Cardboard box')
Packaging.create(name: 'Plastic bag/wrap')
Packaging.create(name: 'Plastic container')
Packaging.create(name: 'Minimal packaging')
Packaging.create(name: 'Paper bag')
Packaging.create(name: 'Recyclable')

@halal = Certification.create(name: 'Halal')
Certification.create(name: 'Kosher')
Certification.create(name: 'Non-GMO')

Nutrition.create(name: 'Superfood')
Nutrition.create(name: 'High in protein')


@lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"

@vendor_picture = "http://image.shutterstock.com/image-vector/vector-illustration-supermarket-grocery-store-260nw-518613133.jpg"

@first_vendor = Vendor.create(name: 'First Vendor', picture: @vendor_picture, address: "", facebook: "https://www.facebook.com/DangFoods/?", twitter: "", instagram: "", story: @lorem, mission: @lorem)
@second_vendor = Vendor.create(name: 'Second Vendor', picture: @vendor_picture, address: "", facebook: "https://www.facebook.com/DangFoods/?", twitter: "", instagram: "", story: @lorem, mission: @lorem)
@third_vendor = Vendor.create(name: 'Third Vendor', picture: @vendor_picture, address: "", facebook: "https://www.facebook.com/DangFoods/?", twitter: "", instagram: "", story: @lorem, mission: @lorem)
@fourth_vendor = Vendor.create(name: 'Fourth Vendor', picture: @vendor_picture, address: "", facebook: "https://www.facebook.com/DangFoods/?", twitter: "", instagram: "", story: @lorem, mission: @lorem)
@fifth_vendor = Vendor.create(name: 'Fifth Vendor', picture: @vendor_picture, address: "", facebook: "https://www.facebook.com/DangFoods/?", twitter: "", instagram: "", story: @lorem, mission: @lorem)


@first_vendor.ownerships << @poc
@second_vendor.ownerships << @poc
@third_vendor.ownerships << @poc
@fourth_vendor.ownerships << @poc
@fifth_vendor.ownerships << @poc

@product_picture = "http://image.shutterstock.com/image-vector/cartoon-apple-260nw-651312034.jpg"

@first_product = Product.create(name: 'First Product', vendor: @first_vendor, picture: @product_picture, vegan: true, gluten_free: false, dairy_free: false, lc_based: false, fair: false, eco_sound: false, humane: false, upc: "", origin: "America", cultural_history: @lorem)
@second_product = Product.create(name: 'Second Product', vendor: @first_vendor, picture: @product_picture, vegan: false, gluten_free: true, dairy_free: false, lc_based: false, fair: false, eco_sound: false, humane: false, upc: "", origin: "China", cultural_history: @lorem)
@third_product = Product.create(name: 'Third Product', vendor: @first_vendor, picture: @product_picture, vegan: false, gluten_free: true, dairy_free: false, lc_based: false, fair: false, eco_sound: false, humane: false, upc: "", origin: "Mexico", cultural_history: @lorem)
@fourth_product = Product.create(name: 'Fourth Product', vendor: @first_vendor, picture: @product_picture, vegan: false, gluten_free: true, dairy_free: false, lc_based: false, fair: false, eco_sound: false, humane: false, upc: "", origin: "Great Britain", cultural_history: @lorem)
@fifth_product = Product.create(name: 'Fifth Product', vendor: @first_vendor, picture: @product_picture, vegan: false, gluten_free: true, dairy_free: false, lc_based: false, fair: false, eco_sound: false, humane: false, upc: "", origin: "India", cultural_history: @lorem)

@first_product.certifications << @halal
@second_product.certifications << @halal
@third_product.certifications << @halal
@fourth_product.certifications << @halal
@fifth_product.certifications << @halal





