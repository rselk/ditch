class Alert < ActiveRecord::Base
  belongs_to :user
  before_save :addtimezone

  private
  def addtimezone 
    cuser = User.where(:id => self.user_id)
    cuserutc = cuser.first.timezone[4..9]
    self.time_alert = "#{self.time_alert} #{cuserutc}"
  end
end
