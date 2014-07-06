require 'test_helper'

class FbImgsControllerTest < ActionController::TestCase
  setup do
    @fb_img = fb_imgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fb_imgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fb_img" do
    assert_difference('FbImg.count') do
      post :create, fb_img: { ext: @fb_img.ext, filename: @fb_img.filename, imgur_id: @fb_img.imgur_id, processed: @fb_img.processed }
    end

    assert_redirected_to fb_img_path(assigns(:fb_img))
  end

  test "should show fb_img" do
    get :show, id: @fb_img
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fb_img
    assert_response :success
  end

  test "should update fb_img" do
    patch :update, id: @fb_img, fb_img: { ext: @fb_img.ext, filename: @fb_img.filename, imgur_id: @fb_img.imgur_id, processed: @fb_img.processed }
    assert_redirected_to fb_img_path(assigns(:fb_img))
  end

  test "should destroy fb_img" do
    assert_difference('FbImg.count', -1) do
      delete :destroy, id: @fb_img
    end

    assert_redirected_to fb_imgs_path
  end
end
