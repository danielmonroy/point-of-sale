require "test_helper"

class ExternalIncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_income = external_incomes(:one)
  end

  test "should get index" do
    get external_incomes_url
    assert_response :success
  end

  test "should get new" do
    get new_external_income_url
    assert_response :success
  end

  test "should create external_income" do
    assert_difference("ExternalIncome.count") do
      post external_incomes_url, params: { external_income: { amount: @external_income.amount, date: @external_income.date, delivery_app: @external_income.delivery_app, description: @external_income.description, source: @external_income.source } }
    end

    assert_redirected_to external_income_url(ExternalIncome.last)
  end

  test "should show external_income" do
    get external_income_url(@external_income)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_income_url(@external_income)
    assert_response :success
  end

  test "should update external_income" do
    patch external_income_url(@external_income), params: { external_income: { amount: @external_income.amount, date: @external_income.date, delivery_app: @external_income.delivery_app, description: @external_income.description, source: @external_income.source } }
    assert_redirected_to external_income_url(@external_income)
  end

  test "should destroy external_income" do
    assert_difference("ExternalIncome.count", -1) do
      delete external_income_url(@external_income)
    end

    assert_redirected_to external_incomes_url
  end
end
