class CreateExternalIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :external_incomes do |t|
      t.date :date, null: false
      t.decimal :amount, default: 0, null: false
      t.integer :payment_method, null: false
      t.integer :source, null: false
      t.string :description

      t.timestamps
    end
  end
end
