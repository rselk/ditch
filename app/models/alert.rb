class Alert < ActiveRecord::Base
  belongs_to :user
  before_save :addtimezone
  after_save :addevents

  has_many :emails
  accepts_nested_attributes_for :emails


  private

  def addevents
    #parse the email attribute and add each address to the email model
    emails = self.to_email.split(",").map(&:strip)


    emails.each { |x| 
      if x.include? "@"
        @addemail = Email.new(:alerts_id => self.id, :address => x)
        @addemail.save 
      else
        @addsms = Sms.new(:alerts_id => self.id, :smsnumber => x)
        @addsms.save
      end
    }
        

  end
  def addtimezone 
    #find current user
    cuser = User.where(:id => self.user_id)

    #get the timezone of current user
    cuserutc = cuser.first.timezone[4..9]

    #construct string with time_alert + current timezone
    utimeconstruct = "#{self.time_alert} #{cuserutc}"

    #populate unixTime column (so we can compare it quickly when we scan database)
    self.unixtime = Time.parse(utimeconstruct)
  end
end
