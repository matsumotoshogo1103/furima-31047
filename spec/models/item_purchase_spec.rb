require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  it '配送先の情報として、郵便番号が必須であること' do
    @item_purchase.postal_code = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Postal code can't be blank"
  end

  it '配送先の情報として、都道府県が必須であること' do
    @item_purchase.prefecture_id = 1
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Prefecture must be other than 1"
  end

  it '配送先の情報として、市区町村が必須であること' do
    @item_purchase.municipality = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Municipality can't be blank"
  end

  it '配送先の情報として、番地が必須であること' do
    @item_purchase.street_number = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Street number can't be blank"
  end

  it '配送先の情報として、電話番号が必須であること' do
    @item_purchase.phone = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Phone can't be blank"
  end

  it '郵便番号にはハイフンが必要であること（123-4567となる）' do
    @item_purchase.postal_code = '1234567'
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Postal code is invalid"
  end

  it '電話番号にはハイフンは不要であること' do
    @item_purchase.phone = '090-123-456'
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Phone is invalid"
  end
  
  it '電話番号は11桁以内であること（09012345678となる）' do
    @item_purchase.phone = '123456789012'
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages). to include "Phone is invalid"
  end

  it '商品購入時にtokenが必要であること' do
    @item_purchase.token = nil
    @item_purchase.valid?
    expect(@item_purchase.errors.full_messages).to include "Token can't be blank"
  end
end