class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :time_alert
      t.text :contents
      t.string :to_email
      t.integer :user_id

      t.timestamps
    end
  end
end
