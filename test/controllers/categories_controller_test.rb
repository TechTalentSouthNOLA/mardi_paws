require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "logged in should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "logged in should create category" do
    sign_in users(:one)
    assert_difference('Category.count') do
      post :create, category: { name: 'new_unique_category' }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "logged in should get edit" do
    sign_in users(:one)
    get :edit, id: @category
    assert_response :success
  end

  test "logged in should update category" do
    sign_in users(:one)
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "logged in should destroy category" do
    sign_in users(:one)
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
