class AddStoreToWorkingStations < ActiveRecord::Migration[7.0]
  def change
    add_reference :working_stations, :store, null: false, foreign_key: true
  end
end
