class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    
    if user_signed_in? 
      @alerts = Alert.where(user_id: current_user)
    else
      @alerts = []
    end

  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)

    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: 'Alert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alert }
      else
        format.html { render action: 'new' }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    #this is ugly. delete the only emails/sms then they will be re-created.  
    Email.where(:alerts_id => @alert.id).destroy_all
    Sms.where(:alerts_id => @alert.id).destroy_all

    respond_to do |format|
      if @alert.update(alert_params)
        

        format.html { redirect_to @alert, notice: 'Alert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    #find the sms and emails which this alert is attached to.
    #then destroy them
    Email.where(:alerts_id => @alert.id).destroy_all
    Sms.where(:alerts_id => @alert.id).destroy_all

    #then destroy the alert itself
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to manage_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:time_alert, :contents, :to_email, :user_id, :msg_sent)
    end
end
