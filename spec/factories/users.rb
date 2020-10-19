FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Faker::Name.last_name}
    first_name_kana       {Faker::Name.first_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.in_date_period}
  end
end
