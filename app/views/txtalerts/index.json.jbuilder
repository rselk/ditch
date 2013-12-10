json.array!(@txtalerts) do |txtalert|
  json.extract! txtalert, :id, :time_alert, :contents, :to_sms, :user_id, :msg_sent
  json.url txtalert_url(txtalert, format: :json)
end
