class CreateDesginations < ActiveRecord::Migration
  def change
    create_table :desginations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
