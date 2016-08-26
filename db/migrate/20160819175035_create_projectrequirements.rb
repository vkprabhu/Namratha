class CreateProjectrequirements < ActiveRecord::Migration
  def change
    create_table :projectrequirements do |t|
      t.integer :level
      t.float :experience
      t.string :domain
      t.string :desgination
      t.string :primary_technology
      t.string :secondary_technology
      t.string :location
      t.string :sublocation

      t.timestamps null: false
    end
  end
end
