require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Delivery app", with: @order.delivery_app
    fill_in "Status", with: @order.status
    fill_in "Store id", with: @order.store_id_id
    fill_in "Table", with: @order.table
    fill_in "Type", with: @order.type
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Delivery app", with: @order.delivery_app
    fill_in "Status", with: @order.status
    fill_in "Store id", with: @order.store_id_id
    fill_in "Table", with: @order.table
    fill_in "Type", with: @order.type
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
