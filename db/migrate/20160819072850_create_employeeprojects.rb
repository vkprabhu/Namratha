class CreateEmployeeprojects < ActiveRecord::Migration
  def change
    create_table :employeeprojects do |t|
      t.date :start_date
      t.date :end_date
      t.string :domain
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
