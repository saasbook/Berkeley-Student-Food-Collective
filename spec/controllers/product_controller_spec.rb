require 'rails_helper'
require 'helper'

describe ProductsController do
  describe '#new' do
    it 'shows the new product page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    it 'shows the edit product page' do
      create_product_and_vendor
      get :edit, params: {id: 1}
      expect(response).to render_template(:edit)
    end
  end

  describe '#create' do
    context 'when product has no vendor' do
      before do
        product = FactoryBot.build(:product)
        post :create, params: {product: product.attributes}
      end

      it 'does not add product to DB' do
        expect(Product.count).to eq(0)
      end

      it 'redirects to the new product page' do
        expect(response).to redirect_to(new_product_path)
      end
    end

    context 'when product has no name' do
      before do
        create_product_and_vendor(name: '')
      end

      it 'does not add product to DB' do
        expect(Product.count).to eq(0)
      end

      it 'redirects to the new product page' do
        expect(response).to redirect_to(new_product_path)
      end
    end

    context 'when product has valid attributes' do
      before do
        create_product_and_vendor
      end

      it 'adds product to DB' do
        expect(Product.count).to eq(1)
      end

      it 'updates vendor in DB' do
        expect(Vendor.first.products.count).to eq(1)
      end

      it 'redirects to the products page' do
        expect(response).to redirect_to(products_path)
      end
    end
  end

  describe '#update' do
    context 'when product is updated with no name' do
      before do
        create_product_and_vendor
        patch :update, params: {id: Product.first.id, product: {name: ''}}
      end

      it 'does not alter product in DB' do
        expect(Product.count).to eq 1
        expect(Product.first.name).to eq(FactoryBot.attributes_for(:product)[:name])
      end

      it 'redirects to the edit product page' do
        expect(response).to redirect_to(edit_product_path)
      end
    end

    context 'when product\'s vendor does not change' do
      before do
        create_product_and_vendor
        patch :update, params: {id: Product.first.id, product: {name: 'Updated Product', lc_based: 'true'}}
      end

      it 'updates product in DB' do
        expect(Product.count).to eq(1)
        expect(Product.first.name).to eq('Updated Product')
        expect(Product.first.lc_based).to be(true)
      end

      it 'redirects to the products page' do
        expect(response).to redirect_to(products_path)
      end
    end

    context 'when product\'s vendor does change' do
      before do
        create_product_and_vendor
        FactoryBot.create(:vendor, name: 'Second Vendor')
        patch :update, params: {id: Product.first.id, product: {vendor_id: 2}}
      end

      it 'updates product in DB' do
        expect(Product.count).to eq(1)
        expect(Product.first.vendor_id).to eq(2)
      end

      it 'updates vendors in DB' do
        expect(Vendor.find(1).products.count).to eq(0)
        expect(Vendor.find(2).products.count).to eq(1)
      end

      it 'redirects to the products page' do
        expect(response).to redirect_to(products_path)
      end
    end
  end
end