require 'rails_helper'
describe Vendor do
  it 'should include name' do
    vendor = FactoryBot.build(:vendor)
    expect(vendor.name == 'Default Vendor Name')
  end
end