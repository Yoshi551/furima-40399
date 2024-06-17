FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.unique.name }
    email                 { Faker::Internet.unique.email }
    password              { 'password1' }
    password_confirmation { 'password1' }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birth_date            { '1990-01-01' }
  end
end