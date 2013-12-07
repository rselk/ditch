scheduler = Rufus::Scheduler.new


scheduler.every '15' do
  # Check if record time is past current time
  # if so, send email + mark record as sent (DO NOT DELETE AS NEED TO ALERT USER)
  # if not, do nothing
  AlertMail.send_email_alert("ryanselk@gmail.com").deliver
  @test = Alert.where("time_alert > ?", 3)
  @test.each do |p|
    puts p.to_email
  end
  puts 'Hello... Rufus'
end

scheduler.join

