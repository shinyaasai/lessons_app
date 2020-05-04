FactoryBot.define do
  factory :lesson do
    title { "初心者歓迎" }
    practice_field { "テスト練習場" }
    target { "初心者" }
    content { "クラブを握ったことがなくてもOK" }
    association :user
  end
end
