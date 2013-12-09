scheduler = Rufus::Scheduler.new


scheduler.every '10' do
  # Check if record time is past current time
  # if so, send email + mark record as sent (DO NOT DELETE AS NEED TO ALERT USER)
  # if not, do nothing
  
  #@test = Alert.where("time_alert < ? AND msg_sent = ?", Time.now, false)
  #@test = Alert.where("time_alert < ? AND msg_sent == ?", DateTime.current, false)
  @test = Alert.where("time_alert < ? AND msg_sent == ?", DateTime.current, 'f')
  puts DateTime.current

  @test.each do |p|
    puts "SENT EMAIL TO: #{p.to_email}, CONTENTS: #{p.contents}"
    AlertMail.send_email_alert(p.to_email, p.contents).deliver

    p.update_attributes(msg_sent: 't')
    scheduler.join
  end
end


