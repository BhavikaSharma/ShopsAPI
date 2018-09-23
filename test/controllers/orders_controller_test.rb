require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
    @order = @shop.orders.first
  end

  test "should get index" do
    get api_shop_orders_url(@shop.id), as: :json
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post api_shop_orders_url(@shop.id), params: { order: { Shop_id: @order.Shop_id, cost: @order.cost } }, as: :json
    end

    assert_response 201
  end

  test "should show order" do
    get api_shop_order_url(@shop.id, @order.id), as: :json
    assert_response :success
  end

  test "should update order" do
    patch api_shop_order_url(@shop.id, @order.id), params: { order: { Shop_id: @order.Shop_id, cost: @order.cost } }, as: :json
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete api_shop_order_url(@shop.id, @order.id), as: :json
    end

    assert_response 204
  end
end
