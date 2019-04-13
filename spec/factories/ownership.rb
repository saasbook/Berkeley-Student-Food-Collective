FactoryBot.define do
  factory :ownership do
    name {'Default Ownership Name'}

    factory :new_ownership do
      name {'New Ownership Name'}
    end

    factory :original_ownership do
      name {'Original Ownership Name'}
    end
  end
end