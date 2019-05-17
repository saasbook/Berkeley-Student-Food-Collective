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

=begin

@vendor_picture = "http://image.shutterstock.com/image-vector/vector-illustration-supermarket-grocery-store-260nw-518613133.jpg"

@first_vendor = Vendor.create(name: 'First Vendor', picture: @vendor_picture, address: "", facebook: "", twitter: "", instagram: "", story: "", mission: "")
@second_vendor = Vendor.create(name: 'Second Vendor', picture: @vendor_picture, address: "", facebook: "", twitter: "", instagram: "", story: "", mission: "")
@third_vendor = Vendor.create(name: 'Third Vendor', picture: @vendor_picture, address: "", facebook: "", twitter: "", instagram: "", story: "", mission: "")
@fourth_vendor = Vendor.create(name: 'Fourth Vendor', picture: @vendor_picture, address: "", facebook: "", twitter: "", instagram: "", story: "", mission: "")
@fifth_vendor = Vendor.create(name: 'Fifth Vendor', picture: @vendor_picture, address: "", facebook: "", twitter: "", instagram: "", story: "", mission: "")


@first_vendor.ownerships << @poc
@second_vendor.ownerships << @poc
@third_vendor.ownerships << @poc
@fourth_vendor.ownerships << @poc
@fifth_vendor.ownerships << @poc

@product_picture = "http://image.shutterstock.com/image-vector/cartoon-apple-260nw-651312034.jpg"

@first_product = Product.create(name: 'First Product', vendor: @first_vendor, picture: @product_picture, vegan: "", gluten_free: "", dairy_free: "", lc_based: "", fair: "", eco_sound: "", humane: "", upc: "", origin: "", cultural_history: "")
@second_product = Product.create(name: 'Second Product', vendor: @first_vendor, picture: @product_picture, vegan: "", gluten_free: "", dairy_free: "", lc_based: "", fair: "", eco_sound: "", humane: "", upc: "", origin: "", cultural_history: "")
@third_product = Product.create(name: 'Third Product', vendor: @first_vendor, picture: @product_picture, vegan: "", gluten_free: "", dairy_free: "", lc_based: "", fair: "", eco_sound: "", humane: "", upc: "", origin: "", cultural_history: "")
@fourth_product = Product.create(name: 'Fourth Product', vendor: @first_vendor, picture: @product_picture, vegan: "", gluten_free: "", dairy_free: "", lc_based: "", fair: "", eco_sound: "", humane: "", upc: "", origin: "", cultural_history: "")
@fifth_product = Product.create(name: 'Fifth Product', vendor: @first_vendor, picture: @product_picture, vegan: "", gluten_free: "", dairy_free: "", lc_based: "", fair: "", eco_sound: "", humane: "", upc: "", origin: "", cultural_history: "")

@first_product.certifications << @halal
@second_product.certifications << @halal
@third_product.certifications << @halal
@fourth_product.certifications << @halal
@fifth_product.certifications << @halal

=end




