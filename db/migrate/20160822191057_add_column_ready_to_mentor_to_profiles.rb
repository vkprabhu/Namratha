class AddColumnReadyToMentorToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :ready_to_mentor, :boolean
  end
end
