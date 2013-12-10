scheduler = Rufus::Scheduler.new

@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN



scheduler.every '10' do
  # Check if record time is past current time
  # if so, send email + mark record as sent (DO NOT DELETE AS NEED TO ALERT USER)
  # if not, do nothing
  
  #@test = Alert.where("time_alert < ? AND msg_sent = ?", Time.now, false)
  #@test = Alert.where("time_alert < ? AND msg_sent == ?", DateTime.current, false)
  @emailalerts = Alert.where("time_alert < ? AND msg_sent = ?", DateTime.current, 'f')

  @emailalerts.each do |p|
    AlertMail.send_email_alert(p.to_email, p.contents).deliver
    p.update_attributes(msg_sent: 't')
    scheduler.join
  end

  @txtalerts = Txtalert.where("time_alert < ? AND msg_sent = ?", DateTime.current, 'f')

  @txtalerts.each do |p|
    @client.account.messages.create(
    :from => '+15873162981',
    :to => '+14038355938',
    :body => 'RAILS FAILS'
    )
    p.update_attributes(msg_sent: 't')
    scheduler.join
  end
  
end


