class ManageController < ApplicationController
  before_filter :authenticate_user! 
  def index
    if user_signed_in? 
      @alerts_true = Alert.where(user_id: current_user, msg_sent: 't')
      @alerts_false = Alert.where(user_id: current_user, msg_sent: 'f')
    else
      @alerts_false = []
      @alerts_true= []
    end
  end
end
