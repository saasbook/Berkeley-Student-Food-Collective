# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ownership.create(name: 'Person of Color')
Ownership.create(name: 'Women')
Ownership.create(name: 'Worker-owned')
Ownership.create(name: 'LGBTQ+')
Ownership.create(name: 'Disabled')

Packaging.create(name: 'Cardboard box')
Packaging.create(name: 'Plastic bag/wrap')
Packaging.create(name: 'Plastic container')
Packaging.create(name: 'Minimal packaging')
Packaging.create(name: 'Paper bag')
Packaging.create(name: 'Recyclable')

Certification.create(name: 'Halal')
Certification.create(name: 'Kosher')
Certification.create(name: 'Non-GMO')

Nutrition.create(name: 'Superfood')
Nutrition.create(name: 'High in protein')

Vendor.create(name: 'Vendor 1')

Product.create(name: 'Product 1', vendor_id: 1)