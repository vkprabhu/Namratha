class AddColumnUserIdToProjectrequirement < ActiveRecord::Migration
  def change
    add_column :projectrequirements, :user_id, :integer
  end
end
