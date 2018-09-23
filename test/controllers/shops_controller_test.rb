require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get api_shops_url, as: :json
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post api_shops_url, params: { shop: { address: @shop.address, name: @shop.name } }, as: :json
    end

    assert_response 201
  end

  test "should show shop" do
    get api_shop_url(@shop), as: :json
    assert_response :success
  end

  test "should update shop" do
    patch api_shop_url(@shop), params: { shop: { address: @shop.address, name: @shop.name } }, as: :json
    assert_response 200
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete api_shop_url(@shop), as: :json
    end

    assert_response 204
  end
end
