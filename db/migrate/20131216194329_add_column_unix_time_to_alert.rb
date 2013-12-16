class AddColumnUnixTimeToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :unixtime, :integer
  end
end
