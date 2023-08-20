class AddRealTotalToCloses < ActiveRecord::Migration[7.0]
  def change
    add_column :closes, :real_total, :decimal
  end
end
