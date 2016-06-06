class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.text :address
      t.string :fuel_types
      t.integer :distance
      t.string :access_times

      t.timestamps null: false
    end
  end
end
