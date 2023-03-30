class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.boolean :available
      t.string :product_code

      t.timestamps
    end
  end
end
