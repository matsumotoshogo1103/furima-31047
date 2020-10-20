class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

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
