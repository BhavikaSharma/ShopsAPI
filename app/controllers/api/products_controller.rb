class Api::ProductsController < ApplicationController
  before_action :set_shop
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /api/shops/#/products
  def index
    @products = @shop.products

    render json: @products
  end

  # GET /api/shops/#/products/1
  def show
    render json: @product
  end

  # POST /api/shops/#/products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: api_shop_products_url(@shop.id, @product.id)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/shops/#/products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/shops/#/products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find_by!(id: params[:shop_id])
    end

    def set_product
      if @shop
        @product = @shop.products.find_by!(id: params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :price, :Shop_id)
    end
end
