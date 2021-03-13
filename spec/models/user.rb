FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { Faker::Internet.email }
    password              { '111aaaa' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana            { 'タロウ' }
    last_name_kana             { 'ヤマダ' }
    birth_info { '2020-01-01' }
  end
end
