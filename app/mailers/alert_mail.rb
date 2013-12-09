class AlertMail < ActionMailer::Base
  default from: "ryanselk@gmail.com"

  def send_email_alert(email, contents)
    mail(:to => "#{email}", :subject => "ALERT! Very Important message", :content_type => "text/html", :body => contents)
  end

end
