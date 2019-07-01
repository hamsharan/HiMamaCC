require 'test_helper'

class ClockEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clock_events_index_url
    assert_response :success
  end

  test "should get show" do
    get clock_events_show_url
    assert_response :success
  end

  test "should get new" do
    get clock_events_new_url
    assert_response :success
  end

  test "should get edit" do
    get clock_events_edit_url
    assert_response :success
  end

end
