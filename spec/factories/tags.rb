FactoryBot.define do
  factory :tag do
    name { Randamu::Text.word }
  end
end
