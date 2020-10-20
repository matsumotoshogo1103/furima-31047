FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname              {Faker::Name.name}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    email                 {Faker::Internet.free_email}
    password              {'test123'}
    password_confirmation {password}
    birthday              {Faker::Date.in_date_period}
  end
end
