class ManageController < ApplicationController
  def index
    if user_signed_in? 
      @alerts_false = Alert.where(user_id: current_user, msg_sent: 'f')
      @txtalerts_false = Txtalert.where(user_id: current_user, msg_sent: 'f' )
      @alerts_true = Alert.where(user_id: current_user, msg_sent: 't')
      @txtalerts_true = Txtalert.where(user_id: current_user, msg_sent: 't')
    else
      @alerts_false = []
      @alerts_true= []
      @txtalerts_false = []
      @txtalerts_true= []
    end


  end
end
