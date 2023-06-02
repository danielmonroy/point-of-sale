class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :total, default: 0
      t.decimal :discount, default: 0
      t.integer :discount_type
      t.integer :payment_method, default: 0

      t.timestamps
    end
  end
end
