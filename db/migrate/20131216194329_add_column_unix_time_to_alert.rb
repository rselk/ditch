class AddColumnUnixTimeToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :unixTime, :integer
  end
end
