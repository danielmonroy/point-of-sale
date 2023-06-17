class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.references :store, null: false, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
