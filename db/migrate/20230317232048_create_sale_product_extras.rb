class CreateSaleProductExtras < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_product_extras do |t|
      t.references :sale_product, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
