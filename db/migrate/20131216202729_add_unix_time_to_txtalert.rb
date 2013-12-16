class AddUnixTimeToTxtalert < ActiveRecord::Migration
  def change
    add_column :txtalerts, :UnixTime, :integer
  end
end
