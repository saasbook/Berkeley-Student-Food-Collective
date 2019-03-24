require 'rails_helper'

describe VendorsController do
	describe '#new' do
		it 'shows the new vendor page' do
			get :new
			expect(response).to render_template(:new)
		end
  end

  describe '#edit' do
    it 'shows the edit vendor page' do
      FactoryBot.create(:vendor)
      get :edit, params: {id: 1}
      expect(response).to render_template(:edit)
    end
  end

	describe '#create' do
    context 'when vendor has no name' do
      before do
        vendor = FactoryBot.build(:vendor, name: '')
        post :create, params: {vendor: vendor.attributes}
      end

      it 'does not add vendor to DB' do
        expect(Vendor.count).to eq(0)
        expect(Tag.count).to eq(0)
        expect(VendorTag.count).to eq(0)
      end

      it 'redirects to the new vendor page' do
        expect(response).to redirect_to(new_vendor_path)
      end
    end

    context 'when vendor has no tags' do
      before do
        vendor = FactoryBot.build(:vendor)
        post :create, params: {vendor: vendor.attributes}
      end

      it 'adds vendor to DB' do
        expect(Vendor.count).to eq(1)
        expect(Tag.count).to eq(0)
        expect(VendorTag.count).to eq(0)
      end

      it 'redirects to the vendors page' do
        expect(response).to redirect_to(vendors_path)
      end
    end

    context 'when vendor has tags' do
      before do
        vendor = FactoryBot.build(:vendor)
        tag1 = FactoryBot.build(:tag)
        post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {'0': tag1.attributes})}
      end

      it 'adds vendor and tags to DB' do
        expect(Vendor.count).to eq(1)
        expect(Tag.count).to eq(1)
        expect(VendorTag.count).to eq(1)
      end

      # it 'does not add duplicate tag to the DB' do
      #   vendor = FactoryBot.build(:vendor, name: 'Second Vendor')
      #   tag = FactoryBot.build(:tag)
      #   post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {'0': tag.attributes})}
      #   expect(Vendor.count).to eq(2)
      #   expect(Tag.count).to eq(1)
      #   expect(VendorTag.count).to eq(2)
      # end
    end
  end

  describe '#update' do
    context 'when vendor has no tags' do
      before do
        vendor = FactoryBot.build(:vendor)
        post :create, params: {vendor: vendor.attributes}
      end

      it 'updates vendor in DB' do
        patch :update, params: {id: Vendor.first.id, vendor: {name: 'Updated Vendor'}}
        expect(Vendor.count).to eq(1)
        expect(Tag.count).to eq(0)
        expect(VendorTag.count).to eq(0)
        expect(Vendor.first.name).to eq('Updated Vendor')
      end

      it 'redirects to the vendors page' do
        expect(response).to redirect_to(vendors_path)
      end
    end

    context 'when vendor has tags altered' do
      before do
        vendor = FactoryBot.build(:vendor)
        tag1 = FactoryBot.build(:tag)
        tag2 = FactoryBot.build(:tag, name: 'b')
        post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {
            '0': tag1.attributes, '1': tag2.attributes})}
      end

      it 'updates name of existing tag in DB' do
        patch :update, params: {id: Vendor.first.id, vendor: {tags_attributes: {id: 1, name: 'b'}}}
        expect(Tag.find(1).name).to eq('b')
        Vendor.first.tags.each do |vendor_tag|
          expect(vendor_tag.name).to eq('b')
        end
      end

      it 'does not change the number of tags' do
        expect(Tag.count).to eq(2)
      end
    end

    context 'when vendor has tags added' do
      before do
        vendor = FactoryBot.build(:vendor)
        tag1 = FactoryBot.build(:tag)
        tag2 = FactoryBot.build(:tag, name: 'b')
        post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {
            '0': tag1.attributes, '1': tag2.attributes})}
        patch :update, params: {id: Vendor.first.id, vendor: {tags_attributes: {'0': {name: 'c'}}}}
      end

      it 'updates vendor\'s associated tags in DB' do
        expect(Vendor.first.tags.count).to eq(3)
        expect(VendorTag.count).to eq(3)
      end

      it 'adds tag in DB' do
        expect(Tag.count).to eq(3)
      end
    end

    context 'when vendor has tags removed' do
      before do
        vendor = FactoryBot.build(:vendor)
        tag1 = FactoryBot.build(:tag)
        tag2 = FactoryBot.build(:tag, name: 'b')
        post :create, params: {vendor: vendor.attributes.merge(tags_attributes: {
            '0': tag1.attributes, '1': tag2.attributes})}
        patch :update, params: {id: Vendor.first.id, vendor: {tags_attributes: {'0': {id: 1, _destroy: 1}}}}
      end

      it 'updates vendor\'s associated tags in DB' do
        expect(Vendor.first.tags.count).to eq(1)
        expect(VendorTag.count).to eq(1)
      end

      # it 'removes tag from DB' do
      #   expect(Tag.count).to eq(1)
      # end
    end
  end
end