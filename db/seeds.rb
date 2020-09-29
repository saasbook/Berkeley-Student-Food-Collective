# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# tag categories for food items:
@packaging = ProductTagCategory.create(name: 'Packaging', description: 'Tags regarding how item is preserved and sold.')
@certification = ProductTagCategory.create(name: 'Certification', description: 'Tags regarding all certifications of item.')
@nutrition = ProductTagCategory.create(name: 'Nutrition', description: 'Tags regarding nutritional values of the item.')
@production = ProductTagCategory.create(name: 'Production', description: 'Tags regarding production process of the item.')


# 1. tags on packaging category:
@cardboard = ProductTag.create(name: 'Cardboard box', product_tag_category:@packaging)
@plasticBag = ProductTag.create(name: 'Plastic bag/wrap', product_tag_category:@packaging)
@plasticCont = ProductTag.create(name: 'Plastic container', product_tag_category:@packaging)
@minimal = ProductTag.create(name: 'Minimal packaging', product_tag_category:@packaging)
@paperBag = ProductTag.create(name: 'Paper bag', product_tag_category:@packaging)
@recyclable = ProductTag.create(name: 'Recyclable', product_tag_category:@packaging)

# 2. tags on certification cagetory:
@halal = ProductTag.create(name: 'Halal', product_tag_category: @certification)
@kosher = ProductTag.create(name: 'Kosher', product_tag_category: @certification)
@nongmo = ProductTag.create(name: 'Non-GMO', product_tag_category: @certification)
@vegan = ProductTag.create(name: 'Vegan',product_tag_category: @certification)
@glutenfree = ProductTag.create(name: 'Gluten Free',product_tag_category: @certification)
@dairyfree = ProductTag.create(name: 'Dairy Free',product_tag_category: @certification)

# 3. tags on nutritition category:
@superfood = ProductTag.create(name: 'Superfood', product_tag_category: @nutrition)
@protein = ProductTag.create(name: 'High in protein',product_tag_category: @nutrition)

# 4.tags on production category:
@humane = ProductTag.create(name: 'Humane',product_tag_category: @production)
@fairlytraded = ProductTag.create(name: 'Fairly Traded',product_tag_category: @production)
@locallybased = ProductTag.create(name: 'Locally Based',product_tag_category: @production)
@eco = ProductTag.create(name: 'Ecologically Sounr',product_tag_category: @production)

# tags for vendors:
@poc = ProducerTag.create(name: 'Person of Color')
@women = ProducerTag.create(name: 'Women')
@worker = ProducerTag.create(name: 'Worker-owned')
@lgbtq = ProducerTag.create(name: 'LGBTQ+')
@disabled = ProducerTag.create(name: 'Disabled')

@product_picture = "http://image.shutterstock.com/image-vector/cartoon-apple-260nw-651312034.jpg"
@vendor_picture = "http://image.shutterstock.com/image-vector/vector-illustration-supermarket-grocery-store-260nw-518613133.jpg"
@facebook = "http://www.facebook.com/DangFoods/?"
@twitter = "http://twitter.com/dangfoods?"
@instagram = "http://www.instagram.com/dangfoods/?"

@first_vendor = MyVendor.create(name: 'First Vendor', picture: @vendor_picture, address: "3254 Adeline St., Berkeley, CA 94703", facebook: @facebook, twitter: @twitter, instagram: @instagram,  story: "")
@second_vendor = MyVendor.create(name: 'Second Vendor', picture: @vendor_picture, address: "San Francisco, CA", facebook: @facebook, twitter: @twitter, instagram: @instagram, story: "")
@third_vendor = MyVendor.create(name: 'Third Vendor', picture: @vendor_picture, address: "PO Box 2352, Beverly Hills, CA 90213", facebook: @facebook, twitter: @twitter, instagram: @instagram, story: "")
@fourth_vendor = MyVendor.create(name: 'Fourth Vendor', picture: @vendor_picture, address: "21-23 Park Avenue Yonkers, NY 10703", facebook: @facebook, twitter: @twitter, instagram: @instagram, story: "")
@fifth_vendor = MyVendor.create(name: 'Fifth Vendor', picture: @vendor_picture, address: "Nectar Foods, Inc. Portland, Oregon 97212", facebook: @facebook, twitter: @twitter, instagram: @instagram, story: "")

@first_product = MyProduct.create(name: 'First Product', my_vendor: @first_vendor, picture: @product_picture)
@second_product = MyProduct.create(name: 'Second Product', my_vendor: @first_vendor, picture: @product_picture)
@third_product = MyProduct.create(name: 'Third Product', my_vendor: @second_vendor, picture: @product_picture)
@fourth_product = MyProduct.create(name: 'Fourth Product', my_vendor: @third_vendor, picture: @product_picture)
@fifth_product = MyProduct.create(name: 'Fifth Product', my_vendor: @fifth_vendor, picture: @product_picture)

# product tags assigned
@first_product.product_tags << @halal
@first_product.product_tags << @protein
@first_product.product_tags << @plasticBag
@first_product.product_tags << @fairlytraded 
@first_product.product_tags << @eco


@second_product.product_tags << @eco
@second_product.product_tags << @minimal
@second_product.product_tags << @glutenfree
@second_product.product_tags << @halal
@second_product.product_tags << @plasticBag


@third_product.product_tags << @nongmo
@third_product.product_tags << @fairlytraded
@third_product.product_tags << @paperBag
@third_product.product_tags << @superfood
@third_product.product_tags << @glutenfree
@third_product.product_tags << @protein


@fourth_product.product_tags << @eco
@fourth_product.product_tags << @halal
@fourth_product.product_tags << @recyclable

@fifth_product.product_tags << @superfood
@fifth_product.product_tags << @fairlytraded 
@fifth_product.product_tags << @eco
@fifth_product.product_tags << @protein


# vendor tags assigned
@first_vendor.producer_tags << @women
@first_vendor.producer_tags << @poc

@second_vendor.producer_tags << @worker
@second_vendor.producer_tags << @women
@second_vendor.producer_tags << @poc

@fourth_vendor.producer_tags << @worker

@fifth_vendor.producer_tags << @lgbtq