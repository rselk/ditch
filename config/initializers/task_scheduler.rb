scheduler = Rufus::Scheduler.new


scheduler.every '50' do
  # Check if record time is past current time
  # if so, send email + mark record as sent (DO NOT DELETE AS NEED TO ALERT USER)
  # if not, do nothing
  
  @test = Alert.where("time_alert < ?", Time.now)

  @test.each do |p|
    puts "SENT EMAIL TO: #{p.to_email}"

    AlertMail.send_email_alert(p.to_email).deliver
    scheduler.join
  end
end


