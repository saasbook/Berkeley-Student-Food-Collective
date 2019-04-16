FactoryBot.define do
  factory :certification do
    name {'Default Certification Name'}

    factory :new_certification do
      name {'New Certification Name'}
    end

    factory :original_certification do
      name {'Original Certification Name'}
    end
  end
end