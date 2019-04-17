FactoryBot.define do
  factory :nutrition do
    name {'Default Nutrition Name'}

    factory :new_nutrition do
      name {'New Nutrition Name'}
    end

    factory :original_nutrition do
      name {'Original Nutrition Name'}
    end
  end
end