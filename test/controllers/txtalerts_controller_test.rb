require 'test_helper'

class TxtalertsControllerTest < ActionController::TestCase
  setup do
    @txtalert = txtalerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:txtalerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create txtalert" do
    assert_difference('Txtalert.count') do
      post :create, txtalert: { contents: @txtalert.contents, msg_sent: @txtalert.msg_sent, time_alert: @txtalert.time_alert, to_sms: @txtalert.to_sms, user_id: @txtalert.user_id }
    end

    assert_redirected_to txtalert_path(assigns(:txtalert))
  end

  test "should show txtalert" do
    get :show, id: @txtalert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @txtalert
    assert_response :success
  end

  test "should update txtalert" do
    patch :update, id: @txtalert, txtalert: { contents: @txtalert.contents, msg_sent: @txtalert.msg_sent, time_alert: @txtalert.time_alert, to_sms: @txtalert.to_sms, user_id: @txtalert.user_id }
    assert_redirected_to txtalert_path(assigns(:txtalert))
  end

  test "should destroy txtalert" do
    assert_difference('Txtalert.count', -1) do
      delete :destroy, id: @txtalert
    end

    assert_redirected_to txtalerts_path
  end
end
