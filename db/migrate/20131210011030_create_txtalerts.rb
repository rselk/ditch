class CreateTxtalerts < ActiveRecord::Migration
  def change
    create_table :txtalerts do |t|
      t.string :time_alert
      t.string :contents
      t.string :to_sms
      t.integer :user_id
      t.string :msg_sent

      t.timestamps
    end
  end
end
