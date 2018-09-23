class Api::OrdersController < ApplicationController
  before_action :set_shop
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /shops/#/orders
  def index
    @orders = @shop.orders

    render json: @orders
  end

  # GET /shops/#/orders/1
  def show
    render json: @order
  end

  # POST /shops/#/orders
  def create
    @order = Order.new(order_params) #might need to merge shop_id

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shops/#/orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shops/#/orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find_by!(id: params[:shop_id])
    end

    def set_order
      if @shop
        @order = @shop.orders.find_by!(id: params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:cost, :Shop_id)
    end
end
