class AddColumnDesginationIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :desgination_id, :integer
  end
end
