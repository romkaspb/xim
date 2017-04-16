require 'test_helper'

class StatusLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_log = status_logs(:one)
  end

  test "should get index" do
    get status_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_status_log_url
    assert_response :success
  end

  test "should create status_log" do
    assert_difference('StatusLog.count') do
      post status_logs_url, params: { status_log: { plane_id: @status_log.plane_id, status: @status_log.status } }
    end

    assert_redirected_to status_log_url(StatusLog.last)
  end

  test "should show status_log" do
    get status_log_url(@status_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_log_url(@status_log)
    assert_response :success
  end

  test "should update status_log" do
    patch status_log_url(@status_log), params: { status_log: { plane_id: @status_log.plane_id, status: @status_log.status } }
    assert_redirected_to status_log_url(@status_log)
  end

  test "should destroy status_log" do
    assert_difference('StatusLog.count', -1) do
      delete status_log_url(@status_log)
    end

    assert_redirected_to status_logs_url
  end
end
