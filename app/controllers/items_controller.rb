class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
end

def update
  if @item.update(item_params)
    redirect_to root_path
  else
    render :edit
  end
end

  private

def item_params
  params.require(:item).permit(:image, :name, :explanation, :detail_category_id, :detail_condition_id, :delivery_charge_id,
                               :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to new_user_session_path unless user_signed_in?
end

def set_item
  @item = Item.find(params[:id])
end
