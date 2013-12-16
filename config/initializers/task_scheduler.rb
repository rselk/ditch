scheduler = Rufus::Scheduler.new
account_sid = 'AC77dd03e7b9af533c85a64ed5360c2bc4'
auth_token = '630ad66ec565db63058109168c7c16c6'
@client = Twilio::REST::Client.new account_sid, auth_token



scheduler.every '10' do
  # Check if record time is past current time
  # if so, send email + mark record as sent (DO NOT DELETE AS NEED TO ALERT USER)
  # if not, do nothing
  
  #@test = Alert.where("time_alert < ? AND msg_sent = ?", Time.now, false)
  #@test = Alert.where("time_alert < ? AND msg_sent == ?", DateTime.current, false)

  puts "DateTime.current = #{DateTime.current}"
  @emailalerts = Alert.where("unixTime < ? AND msg_sent = ?", Time.now.to_i, 'f')

  @emailalerts.each do |p|
    AlertMail.send_email_alert(p.to_email, p.contents).deliver
    p.update_attributes(msg_sent: 't')
    scheduler.join
  end

  @txtalerts = Txtalert.where("unixTime < ? AND msg_sent = ?", Time.now.to_i, 'f')

  @txtalerts.each do |p|
    @client.account.messages.create(
    :from => '+15873162981', #this is the default number for now
    :to => "+ #{p.to_sms}",
    :body => "#{p.contents}"
    )
    p.update_attributes(msg_sent: 't')
    scheduler.join
  end

end


