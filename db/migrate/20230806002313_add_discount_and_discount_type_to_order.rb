class AddDiscountAndDiscountTypeToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :discount, :decimal
    add_column :orders, :discount_type, :integer
  end
end
