class ItemPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :street_number, :building, :phone, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :municipality
    validates :street_number
    validates :phone, format: {with: /\A\d{0,11}\z/}
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, 
    phone: phone, purchase_id: purchase.id)
  end
end