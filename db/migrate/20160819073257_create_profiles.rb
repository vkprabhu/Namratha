class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :employeeid
      t.date :DOB
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :level
      t.string :previous_manager
      t.string :current_manager
      t.float :experience
      t.string :domain
      t.string :hr
      t.integer :sublocation_id
      t.string :primary_technology
      t.string :secondary_technology
      t.integer :designation_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
