class AddProviderToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :provider, foreign_key: true
  end
end
