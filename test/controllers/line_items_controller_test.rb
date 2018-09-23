# require 'test_helper'
#
# class LineItemsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @line_item = line_items(:one)
#   end
#
#   test "should get index" do
#     get api_shop_order_line_items_url, as: :json
#     assert_response :success
#   end
#
#   test "should create line_item" do
#     assert_difference('LineItem.count') do
#       post api_shop_order_line_items_url, params: { line_item: { Order_id: @line_item.Order_id, Product_id: @line_item.Product_id, name: @line_item.name, price: @line_item.price, quantity: @line_item.quantity, total_cost: @line_item.total_cost } }, as: :json
#     end
#
#     assert_response 201
#   end
#
#   test "should show line_item" do
#     get api_shop_order_line_item_url(@line_item), as: :json
#     assert_response :success
#   end
#
#   test "should update line_item" do
#     patch api_shop_order_line_item_url(@line_item), params: { line_item: { Order_id: @line_item.Order_id, Product_id: @line_item.Product_id, name: @line_item.name, price: @line_item.price, quantity: @line_item.quantity, total_cost: @line_item.total_cost } }, as: :json
#     assert_response 200
#   end
#
#   test "should destroy line_item" do
#     assert_difference('LineItem.count', -1) do
#       delete api_shop_order_line_item_url(@line_item), as: :json
#     end
#
#     assert_response 204
#   end
# end
