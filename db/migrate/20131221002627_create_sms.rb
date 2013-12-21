class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.integer :alerts_id
      t.string :smsnumber

      t.timestamps
    end
  end
end
