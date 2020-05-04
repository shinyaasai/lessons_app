FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "example@example" }
    password { "hogehoge" }
  end
end
