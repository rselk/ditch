class AddalertController < ApplicationController
  before_filter :authenticate_user! 
  def index
   @alert = Alert.new
   @txtalert = Txtalert.new
  end
end
