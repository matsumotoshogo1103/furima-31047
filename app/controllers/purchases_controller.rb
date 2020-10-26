class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new(item_purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :municipality, :street_number, :building, :phone)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
