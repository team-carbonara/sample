require 'test_helper'

class RecognitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recognitions_new_url
    assert_response :success
  end

  test "should get create" do
    get recognitions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recognitions_destroy_url
    assert_response :success
  end

end
