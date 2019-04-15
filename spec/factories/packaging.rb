FactoryBot.define do
  factory :packaging do
    name {'Default Packaging Name'}

    factory :new_packaging do
      name {'New Packaging Name'}
    end

    factory :original_packaging do
      name {'Original Packaging Name'}
    end
  end
end