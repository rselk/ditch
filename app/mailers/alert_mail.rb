class AlertMail < ActionMailer::Base
  default from: "ryanselk@gmail.com"

  def send_email_alert(email)
    mail(:to => "#{email}", :subject => "ALERT!")
  end

end
