FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "テストユーザー#{n}" }
    sequence(:email) { |n| "example#{n}@example" }
    password { "hogehoge" }
  end
end
