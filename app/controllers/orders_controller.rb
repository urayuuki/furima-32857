class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new

    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user

    redirect_to root_path if @item.order.present?
  end

  def create
    # binding.pry
    @order_address = OrderAddress.new(order_params)

    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item

      @order_address.save
      redirect_to root_path
    else

      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_num, :shipment_source_id, :city, :address, :build_name, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
