class CreateWorkingStations < ActiveRecord::Migration[7.0]
  def change
    create_table :working_stations do |t|
      t.string :name

      t.timestamps
    end
  end
end
