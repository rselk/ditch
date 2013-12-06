json.array!(@alerts) do |alert|
  json.extract! alert, :id, :time_alert, :contents, :to_email, :user_id
  json.url alert_url(alert, format: :json)
end
