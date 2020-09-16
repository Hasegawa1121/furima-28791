class OrdersController < ApplicationController
  before_action :move_to_new_session, except: [:index]
  before_action :move_to_index, except: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Purchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_new_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

end
