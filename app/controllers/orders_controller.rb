class OrdersController < ApplicationController
  before_action :set_item, only: [:index]
  before_action :move_to_new_session, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :indexa, only: [:index]

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
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params # params{ purchase => {postal_code => "123-4567", token => "tok_123456789"} item_id => "4"}
    # params[:item_id], params[:purchase][:token]
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_new_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def indexa
    redirect_to root_path if @item.order.present?
  end
end
