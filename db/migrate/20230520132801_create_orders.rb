class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :order_type
      t.integer :status, default: 0
      t.integer :delivery_app
      t.integer :table
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
