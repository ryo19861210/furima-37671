class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
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

  private

  def item_params
    params.require(:item).permit(:name, :profile, :category_genre_id, :status_genre_id, :send_price_genre_id, :place_genre_id,
                                 :scheduled_day_genre_id, :price, :image).merge(user_id: current_user.id)
  end
end
