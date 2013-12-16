class Txtalert < ActiveRecord::Base
    belongs_to :user
    before_save :addtimezone

    private
    def addtimezone 
      #find current user
      cuser = User.where(:id => self.user_id)
      #get the timezone of current user
      cuserutc = cuser.first.timezone[4..9]
      #construct string with time_alert + current timezone
      utimeconstruct = "#{self.time_alert} #{cuserutc}"
      #populate unixTime column (so we can compare it quickly when we scan database)
      self.UnixTime = Time.parse(utimeconstruct)
    end
end
