class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :postage_payer_id, :prefecture_id_id, :handling_time_id).merge(user_id: current_user.id)
  end

end
