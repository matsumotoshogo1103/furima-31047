class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipment_date


  with_options presence: true do
    validates :name
    validates :text
    validates :user
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :charge_id
      validates :shipment_source_id
      validates :shipment_date_id
    end

    with_options format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,greater_than: 299, less_than: 10000000 } do
      validates :price
    end

  end
end