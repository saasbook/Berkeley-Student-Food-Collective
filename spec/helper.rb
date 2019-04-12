def create_vendor_without_tags(attributes=nil)
  vendor = FactoryBot.build(:vendor, attributes)
  post :create, params: {vendor: vendor.attributes}
end

def create_vendor_with_new_tag
  vendor = FactoryBot.build(:vendor)
  tag1 = FactoryBot.build(:tag)
  post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {'0': tag1.attributes})}
end

def create_vendor_with_two_tags
  vendor = FactoryBot.build(:vendor)
  tag1 = FactoryBot.build(:tag)
  tag2 = FactoryBot.build(:tag, name: 'b')
  post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {
      '0': tag1.attributes, '1': tag2.attributes})}
end

def create_product_and_vendor(attributes=nil)
  FactoryBot.create(:vendor)
  product = FactoryBot.build(:product, attributes)
  post :create, params: {product: product.attributes}
end