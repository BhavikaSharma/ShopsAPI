class Api::LineItemsController < ApplicationController
  before_action :set_shop, :set_order
  before_action :set_line_item, only: [:show, :update, :destroy]

  # GET /api/shops/#/orders/#/line_items
  def index
    @line_items = @order.line_items

    render json: @line_items
  end

  # GET /api/shops/#/orders/#/line_items/1
  def show
    render json: @line_item
  end

  # POST /api/shops/#/orders/#/line_items
  def create
    @line_item = LineItem.new(line_item_params)

    if @line_item.save
      render json: @line_item, status: :created, location: api_shop_order_line_items_url(@shop.id, @order.id, @line_item.id)
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/shops/#/orders/#/line_items/1
  def update
    if @line_item.update(line_item_params)
      render json: @line_item
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/shops/#/orders/#/line_items/1
  def destroy
    @line_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find_by!(id: params[:shop_id])
    end

    def set_order
      if @shop
        @order = @shop.orders.find_by!(id: params[:order_id])
      end
    end

    def set_line_item
      if @order
        @line_item = @order.line_items.find_by!(id: params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def line_item_params
      params.require(:line_item).permit(:name, :Product_id, :Order_id, :quantity, :price, :total_cost)
    end
end
