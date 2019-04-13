FactoryBot.define do 
  factory :vendor do
    name {'Default Vendor Name'}
    picture {'www.google.com'}
    address {'Default Vendor Address'}
    facebook {'Default Vendor Facebook'}
    twitter {'Default Vendor Twitter'}
    instagram {'Default Vendor Instagram'}

    factory :other_vendor do
      name {'Vendor 2'}
    end
  end
end