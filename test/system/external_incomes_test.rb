require "application_system_test_case"

class ExternalIncomesTest < ApplicationSystemTestCase
  setup do
    @external_income = external_incomes(:one)
  end

  test "visiting the index" do
    visit external_incomes_url
    assert_selector "h1", text: "External incomes"
  end

  test "should create external income" do
    visit external_incomes_url
    click_on "New external income"

    fill_in "Amount", with: @external_income.amount
    fill_in "Date", with: @external_income.date
    check "Delivery app" if @external_income.delivery_app
    fill_in "Description", with: @external_income.description
    fill_in "Source", with: @external_income.source
    click_on "Create External income"

    assert_text "External income was successfully created"
    click_on "Back"
  end

  test "should update External income" do
    visit external_income_url(@external_income)
    click_on "Edit this external income", match: :first

    fill_in "Amount", with: @external_income.amount
    fill_in "Date", with: @external_income.date
    check "Delivery app" if @external_income.delivery_app
    fill_in "Description", with: @external_income.description
    fill_in "Source", with: @external_income.source
    click_on "Update External income"

    assert_text "External income was successfully updated"
    click_on "Back"
  end

  test "should destroy External income" do
    visit external_income_url(@external_income)
    click_on "Destroy this external income", match: :first

    assert_text "External income was successfully destroyed"
  end
end
