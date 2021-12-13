class OrdersController < ApplicationController

  def cart
    @products = Product.all
  end


  def new
    @order = Order.new
    params[:orders].each do |order|
      if order[1]["product"].present?
        order[1].permit("product", "quantity")
        @order.order_details.new(product_id: order[1]["product"], quantity: order[1]["quantity"])
      end
    end
  end

  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  def index
  end


  private

  def order_params
    params.require(:order).permit(:number, :occured_at, :payment, :payment_stat, 
      order_details_attributes: [:id, :discount_rate, :quantity, :order_id, :product_id])
  end

end
