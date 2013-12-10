class SmsalertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    
    if user_signed_in? 
      @alerts = Smsalert.where(user_id: current_user)
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
    @smsalert = Smsalert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @smsalert = Smsalert.new(alert_params)

    respond_to do |format|
      if @smsalert.save
        format.html { redirect_to @smsalert, notice: 'Smsalert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @smsalert }
      else
        format.html { render action: 'new' }
        format.json { render json: @smsalert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    respond_to do |format|
      if @smsalert.update(alert_params)
        format.html { redirect_to @smsalert, notice: 'Smsalert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @smsalert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @smsalert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @smsalert = Smsalert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:smsalert).permit(:time_alert, :contents, :to_email, :user_id, :msg_sent)
    end
end
