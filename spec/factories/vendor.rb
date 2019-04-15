FactoryBot.define do 
  factory :vendor do
    name {'Default Vendor Name'}
    picture {'https://previews.123rf.com/images/rastudio/rastudio1611/rastudio161100449/65118808-hand-drawn-cartoon-of-supermarket-interior-colourful-cartoon-of-background-of-grocery-store-with-pro.jpg'}
    address {'Default Vendor Address'}
    facebook {'Default Vendor Facebook'}
    twitter {'Default Vendor Twitter'}
    instagram {'Default Vendor Instagram'}


    factory :other_vendor do
      name {'Vendor 2'}
    end

    factory :third_vendor do
      name {'Vendor 3'}
    end

    factory :second_vendor do
       name {'Vendor 4'}
    end
  end
end