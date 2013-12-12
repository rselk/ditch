class AddalertController < ApplicationController
  def index
   @alert = Alert.new
   @txtalert = Txtalert.new
  end
end
