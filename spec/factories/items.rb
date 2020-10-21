FactoryBot.define do
  factory :item do
    name               { 'test' }
    price              { 500 }
    text               { 'test_text' }
    category_id        { 2 }
    condition_id       { 2 }
    charge_id          { 2 }
    shipment_source_id { 2 }
    shipment_date_id   { 2 }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
