class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :sale_total
      t.decimal :discount
      t.integer :payment_method
      t.string :ticket_id
      t.integer :status

      t.timestamps
    end
  end
end
