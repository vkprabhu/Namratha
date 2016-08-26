class CreateSublocations < ActiveRecord::Migration
  def change
    create_table :sublocations do |t|
      t.string :name
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
