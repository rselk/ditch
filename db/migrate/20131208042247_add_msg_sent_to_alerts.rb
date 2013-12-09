class AddMsgSentToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :msg_sent, :bool
  end
end
