class Api::ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]

  # GET /api/shops
  def index
    @shops = Shop.all

    render json: @shops
  end

  # GET /api/shops/1
  def show
    render json: @shop
  end

  # POST /api/shops
  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      render json: @shop, status: :created, location: @api_shop_url
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/shops/1
  def update
    if @shop.update(shop_params)
      render json: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/shops/1
  def destroy
    @shop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_params
      params.require(:shop).permit(:name, :address)
    end
end
