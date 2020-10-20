class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipment_date


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
  has_one_attached :image
end
