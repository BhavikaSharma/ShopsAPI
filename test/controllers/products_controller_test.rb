require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
    @product = @shop.products.first
  end

  test "should get index" do
    get api_shop_products_url(@shop.id), as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post api_shop_products_url(@shop.id), params: { product: { Shop_id: @product.Shop_id, name: @product.name, price: @product.price } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get api_shop_product_url(@shop.id, @product.id), as: :json
    assert_response :success
  end

  test "should update product" do
    patch api_shop_product_url(@shop.id, @product.id), params: { product: { Shop_id: @product.Shop_id, name: @product.name, price: @product.price } }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete api_shop_product_url(@shop.id, @product.id), as: :json
    end

    assert_response 204
  end
end
