class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit, :update]
  before_action :item_find, only: [:show, :destroy, :edit, :update]

  def index
    @item = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    if current_user.id == @item.user_id && @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :condition_id, :charge_id, :shipment_date_id, :shipment_source_id, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
