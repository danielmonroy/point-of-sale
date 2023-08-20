class CreateCloses < ActiveRecord::Migration[7.0]
  def change
    create_table :closes do |t|
      t.date :date
      t.decimal :cash_total, default: 0
      t.decimal :card_total, default: 0
      t.decimal :transfer_total, default: 0
      t.decimal :cash_expenses, default: 0
      t.decimal :reported_difference, default: 0
      t.string :comments

      t.timestamps
    end
  end
end
