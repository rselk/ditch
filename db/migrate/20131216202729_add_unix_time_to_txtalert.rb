class AddUnixTimeToTxtalert < ActiveRecord::Migration
  def change
    add_column :txtalerts, :unixtime, :integer
  end
end
