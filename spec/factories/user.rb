FactoryBot.define do
  factory :user do
    email { Randamu::Account.email }
    nickname { Randamu::Account.username }
    password { Randamu::Account.password }
    password_confirmation { password }
  end
end
