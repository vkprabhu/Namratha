
class AddColumnsSublocationLocationDesginationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :location, :string
    add_column :profiles, :sublocation, :string
    add_column :profiles, :desgination, :string
  end
end
