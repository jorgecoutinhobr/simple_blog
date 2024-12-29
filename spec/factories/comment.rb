FactoryBot.define do
  factory :comment do
    body { Randamu::Text.phrase }
    association :post
    association :user
  end
end
