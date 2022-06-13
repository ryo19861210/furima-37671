FactoryBot.define do
  factory :user do
    name                   { Faker::Name.last_name }
    email                  { Faker::Internet.free_email }
    password               { '1a' + Faker::Internet.password(min_length: 7) }
    password_confirmation  { password }
    first_name             { '阿部' }
    last_name              { '亮' }
    first_name_kana        { 'アベ' }
    last_name_kana         { 'リョウ' }
    birthday               { '20000101' }
  end
end
