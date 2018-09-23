# require 'test_helper'
#
# class OrdersControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @order = orders(:one)
#   end
#
#   test "should get index" do
#     get api_shop_orders_url, as: :json
#     assert_response :success
#   end
#
#   test "should create order" do
#     assert_difference('Order.count') do
#       post api_shop_orders_url, params: { order: { Shop_id: @order.Shop_id, cost: @order.cost } }, as: :json
#     end
#
#     assert_response 201
#   end
#
#   test "should show order" do
#     get api_shop_order_url(@order), as: :json
#     assert_response :success
#   end
#
#   test "should update order" do
#     patch api_shop_order_url(@order), params: { order: { Shop_id: @order.Shop_id, cost: @order.cost } }, as: :json
#     assert_response 200
#   end
#
#   test "should destroy order" do
#     assert_difference('Order.count', -1) do
#       delete api_shop_order_url(@order), as: :json
#     end
#
#     assert_response 204
#   end
# end
