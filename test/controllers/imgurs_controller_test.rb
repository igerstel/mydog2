require 'test_helper'

class ImgursControllerTest < ActionController::TestCase
  setup do
    @imgur = imgurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imgurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imgur" do
    assert_difference('Imgur.count') do
      post :create, imgur: { filename: @imgur.filename, processed: @imgur.processed, url: @imgur.url }
    end

    assert_redirected_to imgur_path(assigns(:imgur))
  end

  test "should show imgur" do
    get :show, id: @imgur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imgur
    assert_response :success
  end

  test "should update imgur" do
    patch :update, id: @imgur, imgur: { filename: @imgur.filename, processed: @imgur.processed, url: @imgur.url }
    assert_redirected_to imgur_path(assigns(:imgur))
  end

  test "should destroy imgur" do
    assert_difference('Imgur.count', -1) do
      delete :destroy, id: @imgur
    end

    assert_redirected_to imgurs_path
  end
end
