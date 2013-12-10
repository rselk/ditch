class TxtalertsController < ApplicationController
  before_action :set_txtalert, only: [:show, :edit, :update, :destroy]

  # GET /txtalerts
  # GET /txtalerts.json
  def index
    @txtalerts = Txtalert.all
  end

  # GET /txtalerts/1
  # GET /txtalerts/1.json
  def show
  end

  # GET /txtalerts/new
  def new
    @txtalert = Txtalert.new
  end

  # GET /txtalerts/1/edit
  def edit
  end

  # POST /txtalerts
  # POST /txtalerts.json
  def create
    @txtalert = Txtalert.new(txtalert_params)

    respond_to do |format|
      if @txtalert.save
        format.html { redirect_to @txtalert, notice: 'Txtalert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @txtalert }
      else
        format.html { render action: 'new' }
        format.json { render json: @txtalert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /txtalerts/1
  # PATCH/PUT /txtalerts/1.json
  def update
    respond_to do |format|
      if @txtalert.update(txtalert_params)
        format.html { redirect_to @txtalert, notice: 'Txtalert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @txtalert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /txtalerts/1
  # DELETE /txtalerts/1.json
  def destroy
    @txtalert.destroy
    respond_to do |format|
      format.html { redirect_to txtalerts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_txtalert
      @txtalert = Txtalert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def txtalert_params
      params.require(:txtalert).permit(:time_alert, :contents, :to_sms, :user_id, :msg_sent)
    end
end
