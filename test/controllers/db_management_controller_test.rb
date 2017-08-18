require 'test_helper'

class DbManagementControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get font_db" do
    get :font_db
    assert_response :success
  end

  test "should get category_db" do
    get :category_db
    assert_response :success
  end

  test "should get font_create" do
    get :font_create
    assert_response :success
  end

  test "should get category_create" do
    get :category_create
    assert_response :success
  end

end
