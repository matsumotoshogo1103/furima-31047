FactoryBot.define do
  factory :item_purchase do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    municipality  { '目黒区自由が丘' }
    street_number { '3-10-19' }
    phone         { '09012345678' }
    token         { 'testtoken' }
  end
end
