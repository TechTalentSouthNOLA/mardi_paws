require 'test_helper'

class BrandsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @brand = brands(:one)
    @new_brand_good = {name: 'new_brand'}
    @update_brand_good = {name: 'update_brand'}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brands)
  end

  test "logged in should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "logged in should create brand" do
    sign_in users(:one)
    assert_difference('Brand.count') do
      post :create, brand: @new_brand_good
    end

    assert_redirected_to brand_path(assigns(:brand))
  end

  test "should show brand" do
    get :show, id: @brand
    assert_response :success
  end

  test "logged in should get edit" do
    sign_in users(:one)
    get :edit, id: @brand
    assert_response :success
  end

  test "logged in should update brand" do
    sign_in users(:one)
    patch :update, id: @brand, brand: @update_brand_good
    assert_redirected_to brand_path(assigns(:brand))
  end

  test "logged in should destroy brand" do
    sign_in users(:one)
    assert_difference('Brand.count', -1) do
      delete :destroy, id: @brand
    end

    assert_redirected_to brands_path
  end
end
