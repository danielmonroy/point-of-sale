class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :stock
      t.string :measurement_unit
      t.decimal :stock_warning
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
