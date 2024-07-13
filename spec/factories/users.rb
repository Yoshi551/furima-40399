FactoryBot.define do
  factory :user do
    nickname              { 'testuser' }
    email                 { Faker::Internet.email }
    password              { 'password123' }
    password_confirmation { password }
    first_name            { 'テスト' }
    last_name             { 'ユーザー' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'ユーザー' }
    birth_date            { '1990-01-01' }
  end
end