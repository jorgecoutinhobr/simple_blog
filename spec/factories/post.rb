FactoryBot.define do
  factory :post do
    title { Randamu::Text.title }
    body { Randamu::Text.text }
    association :user
  end
end
