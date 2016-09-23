class CreateDelivers < ActiveRecord::Migration
  def change
    create_table :delivers do |t|
      t.date :date_of_release
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
