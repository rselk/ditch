class Alert < ActiveRecord::Base
  belongs_to :user
  before_save :addtimezone

  private
  def addtimezone 
    cuser = User.where(:id => self.user_id)
    cuserutc = cuser.first.timezone[4..9]
    tmpstr = "#{self.time_alert} #{cuserutc}"
    puts "TMMMMPSTR #{tmpstr}"
    puts "DTPRASE: #{DateTime.parse(tmpstr) }"
    self.time_alert = "#{DateTime.parse(tmpstr)}"
  end
end
