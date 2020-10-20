class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price
    validates :text
    validates :category_id
    validates :condition_id
    validates :chage_id
    validates :shipment_sourse_id
    validates :shipment_date_id
    validates :user
  end

  belongs_to :user
end
