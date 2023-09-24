class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.date :date, null: false
      t.decimal :amount, default: 0, null: false
      t.integer :source, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
